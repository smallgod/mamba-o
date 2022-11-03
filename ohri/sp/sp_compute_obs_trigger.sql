-- Trigger to insert into temp queuing Table for computed obs
DELIMITER //

DROP PROCEDURE IF EXISTS sp_compute_obs_trigger;

CREATE PROCEDURE sp_compute_obs_trigger()
BEGIN

    -- Obs Insert Trigger
    DROP TRIGGER IF EXISTS after_obs_insert;

    CREATE TRIGGER after_obs_insert
        AFTER INSERT
        ON obs
        FOR EACH ROW
    BEGIN
        CALL sp_compute_obs_queue_insert(NEW.encounter_id, NEW.concept_id, NEW.person_id);
    END;


-- Obs Update Trigger
    DROP TRIGGER IF EXISTS after_obs_update;

    CREATE TRIGGER after_obs_update
        AFTER UPDATE
        ON obs
        FOR EACH ROW
    BEGIN
        CALL sp_compute_obs_queue_insert(NEW.encounter_id, NEW.concept_id, NEW.person_id);
    END;

END;
//

DELIMITER ;