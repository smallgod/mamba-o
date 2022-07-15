-- Trigger to insert into temp queuing Table for computed obs

DELIMITER //

DROP TRIGGER IF EXISTS after_obs_insert;

CREATE TRIGGER after_obs_insert
    AFTER INSERT
    ON obs
    FOR EACH ROW
BEGIN
    CALL sp_compute_obs_queue_insert(NEW.encounter_id, NEW.concept_id, NEW.person_id);
END//

DELIMITER ;