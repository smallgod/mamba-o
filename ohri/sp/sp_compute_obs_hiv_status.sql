use openmrs_dev;

DELIMITER //

DROP PROCEDURE IF EXISTS sp_compute_obs_hiv_status;

CREATE PROCEDURE sp_compute_obs_hiv_status(IN final_hiv_status_concept_id INT,
                                           IN final_hiv_test_date_concept_id INT,
                                           IN hiv_positive_concept_id INT,
                                           IN hiv_negative_concept_id INT,
                                           IN hiv_unknown_concept_id INT,
                                           IN hiv_computed_status_concept_id INT,
                                           IN hiv_negative_status_duration INT,
                                           IN observation_id INT,
                                           IN patient_id INT,
                                           IN database_name VARCHAR(255))

sp:
BEGIN
    DECLARE conceptid INT;
    DECLARE encounterid INT;
    DECLARE encountertype INT;
    DECLARE computed_hiv_status INT;
    DECLARE computed_stored_hiv_status INT;
    DECLARE days_interval INT;
    DECLARE test_result_date DATETIME;
    DECLARE message VARCHAR(255);

    SELECT concept_id INTO conceptid FROM openmrs_dev.obs o WHERE o.obs_id = observation_id;

    IF conceptid != final_hiv_status_concept_id THEN
        LEAVE sp;
    END IF;

    SELECT encounter_id INTO encounterid FROM openmrs_dev.obs o WHERE o.obs_id = observation_id;

    SELECT encounter_type INTO encountertype FROM encounter e where e.encounter_id = encounterid LIMIT 1;

    SELECT value_coded
    INTO computed_stored_hiv_status
    FROM openmrs_dev.obs
    WHERE concept_id = hiv_computed_status_concept_id
      AND person_id = patient_id
    ORDER BY obs_id DESC
    LIMIT 1;

    IF computed_stored_hiv_status = hiv_positive_concept_id THEN
        LEAVE sp;

    ELSEIF final_hiv_status_concept_id = hiv_positive_concept_id THEN
        SET computed_hiv_status = hiv_positive_concept_id;

    ELSEIF final_hiv_status_concept_id = hiv_negative_concept_id THEN

        SELECT value_datetime
        INTO test_result_date
        FROM openmrs_dev.obs o
        WHERE o.encounter_id = encounterid
          AND o.concept_id = final_hiv_test_date_concept_id
          AND o.person_id = patient_id
        ORDER BY obs_id desc
        LIMIT 1;

        SET days_interval = DATEDIFF(CURDATE(), STR_TO_DATE(test_result_date, '%Y-%m-%d %H:%i:%s'));

        IF (days_interval <= hiv_negative_status_duration) THEN
            SET computed_hiv_status = hiv_negative_concept_id;
        ELSE
            SET computed_hiv_status = hiv_unknown_concept_id;
        END IF;

    ELSE
        SET computed_hiv_status = hiv_unknown_concept_id;
    END IF;

    IF (computed_stored_hiv_status IS NULL) THEN
        INSERT INTO openmrs_dev.obs(date_created, obs_datetime, person_id, concept_id, value_coded, uuid, creator)
        VALUES (now(), now(), patient_id, hiv_computed_status_concept_id, computed_hiv_status, uuid(), 1);

    ELSE
        UPDATE openmrs_dev.obs
        SET value_coded = computed_hiv_status
        WHERE person_id = patient_id
          AND concept_id = hiv_computed_status_concept_id;

    END IF;

END;
//
DELIMITER ;