DELIMITER //

DROP PROCEDURE IF EXISTS sp_compute_obs_schedule_event;

CREATE PROCEDURE sp_compute_obs_schedule_event()
BEGIN

    DROP EVENT IF EXISTS SCHEDULE_COMPUTED_OBS;

    CREATE EVENT IF NOT EXISTS SCHEDULE_COMPUTED_OBS
        ON SCHEDULE
            EVERY 1 MINUTE
        ON COMPLETION PRESERVE
        ENABLE
        DO
        CALL sp_compute_obs_scheduler();
END;
//

DELIMITER ;