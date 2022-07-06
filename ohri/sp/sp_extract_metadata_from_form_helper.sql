DELIMITER //

DROP PROCEDURE IF EXISTS sp_extract_metadata_from_form;

CREATE PROCEDURE sp_extract_metadata_from_form(
    IN report_data MEDIUMTEXT,
    IN metadata_table NVARCHAR(255)
)
BEGIN

    SET session group_concat_max_len = 20000;

    -- TRUNCATE TABLE metadata_table;

    SELECT JSON_EXTRACT(report_data, '$.pages') INTO @page_array;
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
                    SELECT JSON_LENGTH(@question_array) INTO @question_count;

                    SET @question_number = 0;
                    WHILE @question_number < @question_count
                        DO
                            SELECT JSON_EXTRACT(@question_array, CONCAT('$[', @question_number, ']')) INTO @question;

                            SELECT JSON_EXTRACT(@question, '$.type') INTO @type;
                            SELECT JSON_EXTRACT(@question, '$.questionOptions') INTO @question_options;
                            SELECT JSON_EXTRACT(@question, '$.id') INTO @id;
                            SELECT JSON_EXTRACT(@question, '$.label') INTO @label;
                            SELECT JSON_EXTRACT(@question_options, '$.concept') INTO @concept_uuid;
                            SELECT JSON_EXTRACT(@question_options, '$.rendering') INTO @rendering;

                            SET @tbl_name = '';
                            INSERT INTO mamba_dim_concept_metadata_test(id,
                                                                        type,
                                                                        label,
                                                                        rendering,
                                                                        concept_uuid)
                            VALUES (JSON_UNQUOTE(@id),
                                    JSON_UNQUOTE(@type),
                                    JSON_UNQUOTE(@label),
                                    JSON_UNQUOTE(@rendering),
                                    JSON_UNQUOTE(@concept_uuid));

                            SET @question_number = @question_number + 1;
                        END WHILE;


                    SET @section_number = @section_number + 1;
                END WHILE;

            SET @page_number = @page_number + 1;
        END WHILE;

END //

DELIMITER ;