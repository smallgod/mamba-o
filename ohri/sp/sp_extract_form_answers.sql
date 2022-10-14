DELIMITER //

DROP PROCEDURE IF EXISTS sp_extract_form_answers;

CREATE PROCEDURE sp_extract_form_answers(
    IN question_array MEDIUMTEXT,
    IN encounter_type_uuid VARCHAR(38),
    IN form_name TEXT
)
BEGIN

    DECLARE question_type VARCHAR(255);
    DECLARE form_question_id INT;
    SET session group_concat_max_len = 20000;

    SELECT JSON_LENGTH(@question_array) INTO @question_count;

    SET @question_number = 0;
    WHILE @question_number < @question_count
        DO
            SELECT JSON_EXTRACT(question_array, CONCAT('$[', @question_number, ']')) INTO @question;

            SELECT JSON_EXTRACT(@question, '$.id') INTO @id;
            SELECT JSON_EXTRACT(@question, '$.label') INTO @label;
            SELECT JSON_EXTRACT(@question, '$.questionOptions') INTO @question_options;
            SELECT JSON_EXTRACT(@question_options, '$.concept') INTO @concept_uuid;
            SELECT JSON_EXTRACT(@question_options, '$.answers') INTO @answer_array;
            SELECT JSON_LENGTH(@answer_array) INTO @answer_count;

            SET @answer_number = 0;
            WHILE @answer_number < @answer_count
                DO
                    SET @et_uuid = JSON_UNQUOTE(@encounter_type_uuid);
                    SELECT JSON_EXTRACT(@answer_array, CONCAT('$[', @answer_number, ']')) INTO @answer;

                    SELECT mamba_id INTO @form_question_id FROM mamba_dim_form_question
                        WHERE encounter_type_uuid = @et_uuid AND form_concept_id = @id;

                    INSERT INTO mamba_dim_form_answer(form_question_id,
                                            concept_uuid,
                                            concept_label,
                                            column_label)
                        VALUE (@form_question_id,
                                JSON_UNQUOTE(@concept_uuid),
                                JSON_UNQUOTE(@concept_label),
                                JSON_UNQUOTE(@concept_uuid));

                    SET @answer_number = @answer_number + 1;
            END WHILE;

            SET @question_number = @question_number + 1;
    END WHILE;

END;
//

DELIMITER ;

select * from mamba_dim_form_question;