DELIMITER //

DROP PROCEDURE IF EXISTS sp_compute_obs_helper;

CREATE PROCEDURE sp_compute_obs_helper(
    IN procedure_name VARCHAR(50),
    IN obs_encounter_id INT,
    IN obs_concept_id INT,
    IN person_id INT
)
BEGIN
    -- DECLARE handler_name VARCHAR(38) DEFAULT CONCAT('handle', event_type);

    SET @compute_obs_procedure_sql = CONCAT('CALL ', procedure_name, '(?,?,?)');

    PREPARE prepared_statement FROM @compute_obs_procedure_sql;

    SET @obs_encounter_id = obs_encounter_id;
    SET @obs_concept_id = obs_concept_id;
    SET @person_id = person_id;

    EXECUTE prepared_statement USING @obs_encounter_id, @obs_concept_id, @person_id;
    DEALLOCATE PREPARE prepared_statement;
END
//

DELIMITER ;