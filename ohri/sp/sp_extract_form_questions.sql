DELIMITER //

DROP PROCEDURE IF EXISTS sp_extract_form_questions;

CREATE PROCEDURE sp_extract_form_questions(
    IN save_questions BOOLEAN,
    IN form MEDIUMTEXT,
    IN form_version CHAR(10) CHARACTER SET UTF8MB4)
BEGIN

    SET session group_concat_max_len = 20000;

    -- TRUNCATE TABLE metadata_table;

    SELECT JSON_EXTRACT(form, '$.name') INTO @form_name;
    SELECT JSON_EXTRACT(form, '$.encounterType') INTO @encounter_type_uuid;
    SELECT JSON_EXTRACT(form, '$.pages') INTO @page_array;
    SELECT JSON_LENGTH(@page_array) INTO @page_count;

    SET @page_number = 0;
    WHILE @page_number < @page_count
        DO

            SELECT JSON_EXTRACT(@page_array, CONCAT('$[', @page_number, ']')) INTO @page;

            SELECT JSON_EXTRACT(@page, '$.sections') INTO @section_array;
            SELECT JSON_LENGTH(@section_array) INTO @section_count;

            SET @section_number = 0;
            WHILE @section_number < @section_count
                DO
                    SELECT JSON_EXTRACT(@section_array, CONCAT('$[', @section_number, ']')) INTO @section;
                    SELECT JSON_EXTRACT(@section, '$.questions') INTO @question_array;

                    IF save_questions THEN
                        CALL sp_save_form_questions( @question_array, JSON_UNQUOTE(@encounter_type_uuid), JSON_UNQUOTE(@form_name), form_version);
                    ELSE
                        CALL sp_save_form_answers( @question_array, JSON_UNQUOTE(@encounter_type_uuid), form_version);
                    END IF;

                    SET @section_number = @section_number + 1;
                END WHILE;

            SET @page_number = @page_number + 1;
        END WHILE;

END;
//

DELIMITER ;