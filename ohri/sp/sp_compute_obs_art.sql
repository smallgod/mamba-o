use openmrs_dev;

DELIMITER //

DROP PROCEDURE IF EXISTS sp_compute_obs_art;

CREATE PROCEDURE sp_compute_obs_art(IN observation_id INT,
                                    IN patient_id INT,
                                    IN database_name VARCHAR(255),
                                    IN hiv_program_status_encountertype_id INT,
                                    IN art_therapy_encountertype_id INT,
                                    IN art_plan_concept_id INT,
                                    IN art_start_regimen_id INT,
                                    IN art_substitute_regimen_id INT,
                                    IN art_switch_regimen_id INT,
                                    IN art_stop_regimen_id INT,
                                    IN art_restart_regimen_id INT,
                                    IN computed_regimen_id INT,
                                    IN computed_regimen_line_id INT,
                                    IN computed_regimen_stored_id INT,
                                    IN computed_regimen_line_stored_id INT,
                                    IN regimen_startdate_id INT,
                                    IN regimen_switchdate_id INT,
                                    IN regimen_substitutedate_id INT,
                                    IN regimen_restartdate_id INT,
                                    IN regimen_stopdate_id INT)

sp:
BEGIN
    DECLARE conceptid INT;
    DECLARE encounterid INT;
    DECLARE encountertype INT;
    DECLARE selected_art_plan INT;
    DECLARE computed_regimen INT;
    DECLARE computed_regimen_line INT;
    DECLARE computed_regimen_stored INT;
    DECLARE computed_regimen_line_stored INT;
    DECLARE computed_stored_art_obs_date DATETIME;
    DECLARE regimen_date DATETIME;
    DECLARE regimen_date_difference INT;
    DECLARE selected_regimen_date_conceptid INT;

    SELECT concept_id INTO conceptid FROM openmrs_dev.obs o WHERE o.obs_id = observation_id;
    SELECT encounter_id INTO encounterid FROM openmrs_dev.obs o WHERE o.obs_id = observation_id;
    SELECT encounter_type INTO encountertype FROM encounter e where e.encounter_id = encounterid LIMIT 1;

    IF (encountertype != art_therapy_encountertype_id || conceptid != art_plan_concept_id) THEN
        LEAVE sp;
    END IF;

    SELECT value_coded
    INTO selected_art_plan
    FROM openmrs_dev.obs
    WHERE concept_id = art_plan_concept_id
      AND obs_id = observation_id
      AND person_id = patient_id;

    SELECT value_coded, obs_datetime
    INTO computed_regimen_stored, computed_stored_art_obs_date
    FROM openmrs_dev.obs
    WHERE concept_id = computed_regimen_stored_id
      AND encounter_id = hiv_program_status_encountertype_id
      AND person_id = patient_id;

    SELECT value_coded
    INTO computed_regimen_line_stored
    FROM openmrs_dev.obs
    WHERE concept_id = computed_regimen_line_stored_id
      AND encounter_id = hiv_program_status_encountertype_id
      AND person_id = patient_id;

    SELECT value_coded
    INTO computed_regimen
    FROM openmrs_dev.obs
    WHERE concept_id = computed_regimen_id
      AND encounter_id = encounterid
      AND person_id = patient_id;

    SELECT value_coded
    INTO computed_regimen_line
    FROM openmrs_dev.obs
    WHERE concept_id = computed_regimen_line_id
      AND encounter_id = encounterid
      AND person_id = patient_id;

    IF selected_art_plan = art_start_regimen_id THEN
        SET selected_regimen_date_conceptid = regimen_startdate_id;

    ELSEIF selected_art_plan = art_substitute_regimen_id THEN
        SET selected_regimen_date_conceptid = regimen_substitutedate_id;

    ELSEIF selected_art_plan = art_switch_regimen_id THEN
        SET selected_regimen_date_conceptid = regimen_switchdate_id;

    ELSEIF selected_art_plan = art_restart_regimen_id THEN
        SET selected_regimen_date_conceptid = regimen_restartdate_id;

    ELSEIF selected_art_plan = art_stop_regimen_id THEN
        SET selected_regimen_date_conceptid = regimen_stopdate_id;
    END IF;

    SELECT value_datetime
    INTO regimen_date
    FROM openmrs_dev.obs
    WHERE concept_id = selected_regimen_date_conceptid
      AND encounter_id = encounterid
      AND person_id = patient_id;

    IF (computed_regimen_stored IS NULL) THEN

        INSERT INTO openmrs_dev.obs(date_created, obs_datetime, encounter_id, person_id, concept_id, value_coded, uuid,
                                    creator)
        VALUES (now(), regimen_date, patient_id, hiv_program_status_encountertype_id, computed_regimen_id,
                computed_regimen, uuid(), 1);

        INSERT INTO openmrs_dev.obs(date_created, obs_datetime, encounter_id, person_id, concept_id, value_coded, uuid,
                                    creator)
        VALUES (now(), regimen_date, patient_id, hiv_program_status_encountertype_id, computed_regimen_line_id,
                computed_regimen_line, uuid(), 1);

    ELSE
        SET regimen_date_difference =
                DATEDIFF(regimen_date, STR_TO_DATE(computed_stored_art_obs_date, '%Y-%m-%d %H:%i:%s'));
        IF regimen_date_difference > 0 THEN

            UPDATE openmrs_dev.obs
            SET value_coded = computed_regimen
            WHERE concept_id = computed_regimen_id
              AND encounter_id = hiv_program_status_encountertype_id
              AND person_id = patient_id;

            UPDATE openmrs_dev.obs
            SET value_coded = computed_regimen_line
            WHERE concept_id = computed_regimen_line_id
              AND encounter_id = hiv_program_status_encountertype_id
              AND person_id = patient_id;
        END IF;

    END IF;
END
//

DELIMITER ;