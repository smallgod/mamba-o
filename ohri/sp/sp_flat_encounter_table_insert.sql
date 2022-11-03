DELIMITER //

DROP PROCEDURE IF EXISTS sp_flat_encounter_table_insert;

CREATE PROCEDURE sp_flat_encounter_table_insert(
    IN encounter_type_uuid CHAR(38)
)
BEGIN

    SET session group_concat_max_len = 20000;

    SET @form_name = (SELECT DISTINCT (form_name)
                      FROM mamba_dim_form_question fd
                      WHERE fd.encounter_type_uuid = encounter_type_uuid);
    SET @tbl_name = fn_extract_table_name(@form_name);

    SET @old_sql = (SELECT GROUP_CONCAT(COLUMN_NAME SEPARATOR ', ')
                    FROM INFORMATION_SCHEMA.COLUMNS
                    WHERE TABLE_NAME = @tbl_name
                      AND TABLE_SCHEMA = Database());

    SELECT GROUP_CONCAT(DISTINCT
                        CONCAT(' MAX(CASE WHEN concept_question_id = ''', concept_question_id, ''' THEN ',
                               fn_get_obs_value_column(c.datatype_name), ' END) ', concept_question_id)
                        ORDER BY fd.id ASC)
    INTO @column_labels
    FROM mamba_dim_form_question fd
             INNER JOIN mamba_dim_concept c
                        ON fd.concept_uuid = c.uuid
    WHERE fd.encounter_type_uuid = encounter_type_uuid;

    SET @insert_stmt = CONCAT(
            'INSERT INTO `', @tbl_name, '` SELECT z.encounter_id, z.client_id, ', @column_labels, '
            FROM mamba_z_encounter_obs z
                INNER JOIN mamba_dim_form_question fd
                    ON (fd.concept_uuid=z.obs_question_uuid)
            WHERE fd.encounter_type_uuid = ''', encounter_type_uuid, '''
                AND z.encounter_type_id = fd.encounter_type_id
            GROUP BY z.encounter_id, z.client_id;');

    PREPARE inserttbl FROM @insert_stmt;
    EXECUTE inserttbl;
    DEALLOCATE PREPARE inserttbl;

END;
//

DELIMITER ;