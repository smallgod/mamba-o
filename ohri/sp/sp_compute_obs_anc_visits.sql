use analysis;

DELIMITER //

DROP PROCEDURE IF EXISTS sp_compute_obs_anc_visits;

CREATE PROCEDURE sp_compute_obs_anc_visits(IN encounterid INT,
                                    IN conceptid INT,
                                    IN patientid INT)
sp:
BEGIN

    DECLARE computed_obs_encounter_type INT;
    DECLARE computed_obs_encounter_id INT;
    DECLARE request_encounter_type INT;
    DECLARE concept_encounter_type INT;
    DECLARE compute_procedure NVARCHAR(50);
    DECLARE concept_label NVARCHAR(50);

    DECLARE ptracker_concept INT;
    DECLARE anc_visit_count_old INT;
    DECLARE anc_visit_count_new INT DEFAULT 0;

    -- Initialise all relevant variables
    SELECT m.computed_obs_encounter_type_id,
           m.obs_encounter_type_id,
           m.compute_procedure_name,
           m.concept_label,
           e.encounter_type
    INTO computed_obs_encounter_type, concept_encounter_type, compute_procedure, concept_label, request_encounter_type
    FROM mamba_obs_compute_metadata m INNER JOIN encounter e ON m.obs_encounter_type_id = e.encounter_type
    WHERE e.encounter_id = encounterid AND e.patient_id = patientid AND m.concept_id = conceptid;

    -- Don't Compute if obs is not computable (i.e. we didn't find a procedure name)
    -- If above result returns empty/null, exit
    IF (compute_procedure IS NULL) THEN
        LEAVE sp;
    END IF;

    -- Fetch ANC VISIT COUNT
    SELECT count(o.obs_id) INTO anc_visit_count_new FROM obs o
        INNER JOIN mamba_obs_compute_metadata m ON o.concept_id = m.concept_id
        WHERE m.concept_label = 'ptracker_id' AND m.compute_procedure_name = compute_procedure
            AND o.person_id = patientid;

    -- Fetch the currently stored ANC Visit Count Value that was previously computed (if any) for this patient
    SELECT o.value_numeric INTO anc_visit_count_old FROM obs o
        INNER JOIN encounter e on o.encounter_id = e.encounter_id
        WHERE o.concept_id = ptracker_concept
          AND e.encounter_type = request_encounter_type AND o.person_id = patientid
        ORDER BY obs_id DESC LIMIT 1;


    -- here
     -- Insert/Update computed Obs Status
    IF(anc_visit_count_old IS NULL) THEN
        INSERT INTO obs(date_created, obs_datetime, encounter_id, person_id, concept_id, value_numeric, uuid, creator)
            VALUES (NOW(), NOW(), computed_obs_encounter_id, patientid, ptracker_concept, anc_visit_count_new, UUID(), 1);
    ELSE
        UPDATE obs SET value_numeric = anc_visit_count_new
            WHERE concept_id = ptracker_concept AND encounter_id = computed_obs_encounter_id AND person_id = patientid;
    END IF;

END;
//

DELIMITER ;