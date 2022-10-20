DELIMITER //

DROP PROCEDURE IF EXISTS sp_flat_encounter_table_create;

CREATE PROCEDURE sp_flat_encounter_table_create(
    IN encounter_type_uuid CHAR(38)
)
BEGIN

    SET session group_concat_max_len = 20000;
    SET @column_labels := NULL;

    SET @form_name = (SELECT DISTINCT (form_name)
                      FROM mamba_dim_form_question fd
                      WHERE fd.encounter_type_uuid = encounter_type_uuid);
    SET @tbl_name = fn_extract_table_name(JSON_UNQUOTE(@form_name));

    SET @drop_table = CONCAT('DROP TABLE IF EXISTS `', @tbl_name, '`');

    SELECT GROUP_CONCAT(concept_question_id SEPARATOR ' TEXT, ')
    INTO @column_labels
    FROM mamba_dim_form_question fd
    WHERE fd.encounter_type_uuid = encounter_type_uuid;

    SET @create_table = CONCAT(
            'CREATE TABLE `', @tbl_name, '` (encounter_id INT, client_id INT, ', @column_labels,
            ' TEXT);');

    PREPARE deletetb FROM @drop_table;
    PREPARE createtb FROM @create_table;

    EXECUTE deletetb;
    EXECUTE createtb;

    DEALLOCATE PREPARE deletetb;
    DEALLOCATE PREPARE createtb;

END //

DELIMITER ;