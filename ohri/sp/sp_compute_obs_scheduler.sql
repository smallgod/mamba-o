-- Scheduler / Event fired every 1 minute to compute & insert/update

DELIMITER //

DROP EVENT IF EXISTS SCHEDULE_COMPUTED_OBS;

CREATE EVENT IF NOT EXISTS SCHEDULE_COMPUTED_OBS
    ON SCHEDULE
        EVERY 1 MINUTE
    DO BEGIN

    DECLARE encounterid INT;
    DECLARE conceptid INT;
    DECLARE patientid INT;
    DECLARE procedure_name NVARCHAR(50);

    DECLARE done INT DEFAULT FALSE;

    DECLARE cursor_pending_computations CURSOR FOR
        SELECT patient_id, concept_id, encounter_id, compute_procedure_name
        FROM mamba_computed_obs_queue c WHERE c.computed = 0;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cursor_pending_computations;
    computations_loop:
    LOOP
        FETCH cursor_pending_computations INTO patientid, conceptid, encounterid, procedure_name;

        IF done THEN
            LEAVE computations_loop;
        END IF;

         CALL sp_compute_obs(procedure_name, encounterid, conceptid, patientid);

         DELETE FROM mamba_computed_obs_queue
         WHERE compute_procedure_name = procedure_name AND patient_id = patientid AND encounter_id = encounterid AND concept_id = conceptid;

    END LOOP computations_loop;
    CLOSE cursor_pending_computations;
END;
//

DELIMITER ;