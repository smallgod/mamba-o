DELIMITER //

DROP PROCEDURE IF EXISTS sp_save_form_questions;

CREATE PROCEDURE sp_save_form_questions(
    IN question_array MEDIUMTEXT,
    IN encounter_type_uuid VARCHAR(38),
    IN form_name TEXT,
    IN form_version CHAR(10) CHARACTER SET UTF8MB4
)
BEGIN

    DECLARE question_type VARCHAR(255);
    SET session group_concat_max_len = 20000;

    SELECT JSON_LENGTH(@question_array) INTO @question_count;

    SET @question_number = 0;
    WHILE @question_number < @question_count
        DO
            SELECT JSON_EXTRACT(question_array, CONCAT('$[', @question_number, ']')) INTO @question;

            SELECT JSON_EXTRACT(@question, '$.type') INTO @type;
            -- SET question_type = JSON_UNQUOTE(@type);
            -- IF question_type = 'obsGroup' THEN
            SELECT JSON_EXTRACT(@question, '$.questionOptions') INTO @question_options;
            SELECT JSON_EXTRACT(@question, '$.id') INTO @id;
            SELECT JSON_EXTRACT(@question, '$.label') INTO @label;
            SELECT JSON_EXTRACT(@question_options, '$.concept') INTO @concept_uuid;
            SELECT JSON_EXTRACT(@question_options, '$.rendering') INTO @rendering;

            SET @tbl_name = fn_extract_table_name(form_name);

            INSERT INTO mamba_dim_form_question(form_name,
                                                form_version,
                                                encounter_type_id,
                                                encounter_type_uuid,
                                                concept_question_id,
                                                concept_rendering,
                                                concept_uuid,
                                                concept_label)
            SELECT form_name,
                   form_version,
                   e.encounter_type_id,
                   encounter_type_uuid,
                   JSON_UNQUOTE(@id),
                   JSON_UNQUOTE(@rendering),
                   JSON_UNQUOTE(@concept_uuid),
                   JSON_UNQUOTE(@label)
            FROM mamba_dim_encounter_type e
            where e.uuid = encounter_type_uuid;

            SET @question_number = @question_number + 1;
        END WHILE;

END;
//

DELIMITER ;