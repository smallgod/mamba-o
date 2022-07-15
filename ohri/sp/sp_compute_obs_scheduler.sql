-- Scheduler / Event fired every 1 minute to compute & insert/update
use openmrs_dev;

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
    REPEAT
        FETCH cursor_pending_computations INTO patientid, conceptid, encounterid, procedure_name;

        CALL sp_compute_obs_helper(procedure_name, encounterid, conceptid, patientid);

        DELETE FROM mamba_computed_obs_queue
        WHERE compute_procedure_name = procedure_name AND patient_id = patientid AND encounter_id = encounterid;

    UNTIL done END REPEAT;
    CLOSE cursor_pending_computations;
END
//

DELIMITER ;