use openmrs_dev;

DELIMITER //

DROP FUNCTION IF EXISTS fn_compute_obs_hiv_status;

CREATE FUNCTION fn_compute_obs_hiv_status(final_hiv_status_concept_id INT,
                                          final_hiv_test_date_concept_id INT,
                                          hiv_positive_concept_id INT,
                                          hiv_negative_concept_id INT,
                                          hiv_unknown_concept_id INT,
                                          hiv_computed_status_concept_id INT,
                                          hiv_negative_status_duration INT,
                                          observation_id INT,
                                          patient_id INT,
                                          database_name VARCHAR(255))
    RETURNS INT
    DETERMINISTIC
BEGIN
    DECLARE hiv_status INT;
    DECLARE stored_hiv_status INT;
    DECLARE days_interval INT;
    DECLARE test_result_date DATETIME;

    SET stored_hiv_status = (SELECT value_coded FROM openmrs_dev.obs where concept_id = hiv_computed_status_concept_id);

    IF (stored_hiv_status = hiv_positive_concept_id) THEN
        RETURN (hiv_positive_concept_id);

    ELSEIF (final_hiv_status_concept_id = hiv_positive_concept_id) THEN
        SET hiv_status = hiv_positive_concept_id;

    ELSEIF final_hiv_status_concept_id = hiv_negative_concept_id THEN

        SET test_result_date = (SELECT value_datetime
                                FROM openmrs_dev.obs o
                                WHERE o.encounter_id =
                                      (SELECT encounter_id FROM openmrs_dev.obs WHERE obs_id = observation_id)
                                  AND o.concept_id = final_hiv_test_date_concept_id);

        SET days_interval = DATEDIFF(CURDATE(), STR_TO_DATE(test_result_date, '%Y-%m-%d %H:%i:%s'));

        IF (days_interval <= hiv_negative_status_duration) THEN
            SET hiv_status = hiv_negative_concept_id;
        ELSE
            SET hiv_status = hiv_unknown_concept_id;
        END IF;
    ELSE
        SET hiv_status = hiv_unknown_concept_id;
    END IF;

    IF (stored_hiv_status IS NULL) THEN
        INSERT INTO openmrs_dev.obs(date_created, obs_datetime, person_id, concept_id, value_coded, uuid)
            value (now(), now(), patient_id, hiv_computed_status_concept_id, hiv_status, uuid());

    ELSE
        UPDATE openmrs_dev.obs
        SET value_coded=hiv_status
        where person_id = patient_id
          and concept_id = hiv_computed_status_concept_id;

    END IF;

    RETURN (hiv_status);
END
//

DELIMITER ;