use openmrs_dev;

DELIMITER //

DROP PROCEDURE IF EXISTS sp_compute_obs_art;

CREATE PROCEDURE sp_compute_obs_art(IN conceptid INT,
                                    IN encounterid INT,
                                    IN patientid INT)

sp:
BEGIN

    SET @computed_obs_encounter_type := NULL;
    SET @computed_obs_encounter_id := NULL;
    SET @request_encounter_type := NULL;
    SET @concept_encounter_type := NULL;
    SET @compute_type := NULL;
    SET @compute_procedure := NULL;
    SET @concept_label := NULL;
    SET @regimen := NULL;
    SET @regimen_line := NULL;
    SET @regimen_date := NULL;
    SET @previously_computed := FALSE;
    SET @previous_regimen_date := null;
    SET @regimen_id := null;
    SET @regimen_line_id := null;
    SET @computed_obs_encounter := null;

    -- Initialise all relevant variables
    SELECT m.computed_obs_encounter_type_id,
           m.concept_encounter_type_id,
           m.obs_compute_type,
           m.obs_compute_procedure_name,
           m.concept_label,
           e.encounter_type
    INTO @computed_obs_encounter_type, @concept_encounter_type, @compute_type, @compute_procedure, @concept_label, @request_encounter_type
    FROM mamba_obs_compute_metadata m INNER JOIN encounter e ON m.concept_encounter_type_id = e.encounter_type
    WHERE e.encounter_id = encounterid AND e.patient_id = patientid AND m.concept_id = conceptid;

    -- Don't Compute if obs is not computable (i.e. we didn't find a procedure name)
    IF (@compute_procedure IS NULL) THEN
        LEAVE sp;
    END IF;

    -- Fetch the Regimen & its concept_id (if any) that was captured in this Encounter
    SELECT o.value_coded, o.concept_id INTO @regimen, @regimen_id FROM obs o
        INNER JOIN mamba_obs_compute_metadata m ON o.concept_id = m.concept_id
        WHERE m.concept_label = 'regimen' AND o.encounter_id = encounterid AND o.person_id = patientid;

    -- Fetch the Regimen Line & its concept_id (if any) that was captured in this Encounter
    SELECT o.value_coded, o.concept_id INTO @regimen_line, @regimen_line_id FROM obs o
        INNER JOIN mamba_obs_compute_metadata m ON o.concept_id = m.concept_id
        WHERE m.concept_label = 'regimen_line' AND o.encounter_id = encounterid AND o.person_id = patientid;

    -- Fetch the saved (computed) Regimen date, and the computed Obs Encounter Id for this Patient
    SELECT o.obs_datetime, e.encounter_id INTO @previous_regimen_date, @computed_obs_encounter_id FROM obs o
        INNER JOIN encounter e on o.encounter_id = e.encounter_id
        WHERE e.encounter_type = @computed_obs_encounter_type AND o.concept_id = @regimen_id AND e.patient_id = patientid;

    CASE @concept_label

        WHEN 'stop_date' THEN
            -- Delete both the computed Regimen & Regimen Line (if any) for this Patient since they have Stopped trtmt
            DELETE FROM obs WHERE encounter_id = @computed_obs_encounter_id AND person_id = patientid;
            LEAVE sp;

        WHEN 'start_date' OR 'switch_date' OR 'substitute_date' OR 'restart_date' THEN

            SELECT value_datetime INTO @regimen_date FROM obs o
                WHERE o.encounter_id = encounterid AND o.concept_id = conceptid AND o.person_id = patientid;

            IF (@computed_obs_encounter_id IS NULL) THEN -- There is NO ART computed obs Encounter for this Patient

                -- Create a new computed Obs Encounter for this patient
                INSERT INTO encounter(encounter_type, patient_id, encounter_datetime, creator, date_created, uuid)
                VALUES (@computed_obs_encounter_type, patientid, NOW(), 1, NOW(), UUID());

                -- Set the computed obs encounter id with the newly persisted computed Obs Encounter id
                SELECT encounter_id INTO @computed_obs_encounter_id FROM encounter e
                    WHERE encounter_type = @computed_obs_encounter_type AND e.patient_id = patientid;

                -- Insert the regimen & the Date
                INSERT INTO obs(date_created, obs_datetime, encounter_id, person_id, concept_id, value_coded, uuid, creator)
                VALUES (now(), @regimen_date, @computed_obs_encounter_id, patientid, @regimen_id, @regimen, uuid(), 1);

                 -- Insert the regimen Line & the Date
                INSERT INTO obs(date_created, obs_datetime, encounter_id, person_id, concept_id, value_coded, uuid, creator)
                VALUES (now(), @regimen_date, @computed_obs_encounter_id, patientid, @regimen_line_id, @regimen_line, uuid(), 1);

            ELSE

                SET @regimen_date_difference = DATEDIFF(@regimen_date, STR_TO_DATE(@previous_regimen_date, '%Y-%m-%d %H:%i:%s'));
                -- previously computed Regimen Date is Older
                IF @regimen_date_difference > 0 THEN

                    UPDATE obs SET value_coded = @regimen
                    WHERE concept_id = @regimen_id AND encounter_id = @computed_obs_encounter_id AND person_id = patientid;

                    UPDATE obs SET value_coded = @regimen_line
                    WHERE concept_id = @regimen_line_id AND encounter_id = @computed_obs_encounter_id AND person_id = patientid;
                END IF;
            END IF;

        END CASE;
END
//

DELIMITER ;