-- Scheduler / Event fired every 1 minute to compute & insert/update
use openmrs_dev;

DELIMITER //

DROP EVENT IF EXISTS SCHEDULE_COMPUTED_OBS;
CREATE EVENT IF NOT EXISTS SCHEDULE_COMPUTED_OBS
    ON SCHEDULE
        EVERY 1 MINUTE
    DO BEGIN

    DECLARE compute_type NVARCHAR(50);
    DECLARE encounterid INT;
    DECLARE conceptid INT;
    DECLARE patientid INT;

    DECLARE done INT DEFAULT FALSE;

    DECLARE cursor_pending_computations CURSOR FOR
        SELECT patient_id, concept_id, encounter_id, computed_obs_type
        FROM mamba_computed_obs_queue c WHERE c.computed = 0;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cursor_pending_computations;
    REPEAT
        FETCH cursor_pending_computations INTO patientid, conceptid, encounterid, compute_type;

        CALL sp_compute_obs_helper(procedure_name, encounterid, conceptid, patientid);

        DELETE FROM mamba_computed_obs_queue
        WHERE computed_obs_type = compute_type AND patient_id = patientid AND encounter_id = encounterid;

    UNTIL done END REPEAT;
    CLOSE cursor_pending_computations;
END
//

DELIMITER ;