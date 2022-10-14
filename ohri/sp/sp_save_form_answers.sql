DELIMITER //

DROP PROCEDURE IF EXISTS sp_save_form_answers;

CREATE PROCEDURE sp_save_form_answers(
    IN question_array MEDIUMTEXT,
    IN encounter_type_uuid VARCHAR(38),
    IN form_version CHAR(10) CHARACTER SET UTF8MB4
)
BEGIN

    -- DECLARE  NVARCHAR(255);
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
            SELECT JSON_EXTRACT(@question_options, '$.concept') INTO @question_concept_uuid;
            SELECT JSON_EXTRACT(@question_options, '$.answers') INTO @answer_array;
            SELECT JSON_LENGTH(@answer_array) INTO @answer_count;

            SET @answer_number = 0;
            SET @concept_question_id = JSON_UNQUOTE(@id);
            WHILE @answer_number < @answer_count
                DO
                    SELECT JSON_EXTRACT(@answer_array, CONCAT('$[', @answer_number, ']')) INTO @answer;
                     SELECT JSON_EXTRACT(@answer, '$.concept') INTO @answer_concept_uuid;
                     SELECT JSON_EXTRACT(@answer, '$.label') INTO @answer_concept_label;

                    SELECT mamba_id INTO form_question_id
                    FROM mamba_dim_form_question q
                    WHERE q.form_version = form_version
                      AND q.encounter_type_uuid = encounter_type_uuid
                      AND q.concept_question_id = @concept_question_id;

                    INSERT INTO iss.mamba_test_it(form_question_id, form_version, encounter_type_uuid, concept_question_id)
                    SELECT form_question_id, form_version, encounter_type_uuid, @concept_question_id;

                    INSERT INTO mamba_dim_form_answer(fk_form_question_id,
                                                      question_concept_uuid,
                                                      answer_concept_uuid,
                                                      answer_concept_label)
                        VALUE (form_question_id,
                               JSON_UNQUOTE(@question_concept_uuid),
                               JSON_UNQUOTE(@answer_concept_uuid),
                               JSON_UNQUOTE(@answer_concept_label));

                    SET @answer_number = @answer_number + 1;
            END WHILE;

            SET @question_number = @question_number + 1;
    END WHILE;

END;
//

DELIMITER ;