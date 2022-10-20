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
                        ORDER BY fd.mamba_id ASC)
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


INSERT INTO `flat_poc_art_card_clinical_assessment_page`
SELECT z.encounter_id,  z.client_id,
       MAX(CASE WHEN concept_question_id = 'height' THEN obs_value_numeric END) height
       FROM mamba_z_encounter_obs z
                INNER JOIN mamba_dim_form_question fd
                    ON (fd.concept_uuid=z.obs_question_uuid)
            WHERE fd.encounter_type_uuid = '8d5b2be0-c2cc-11de-8d13-0010c6dffd0f'
                AND z.encounter_type_id = fd.encounter_type_id
                -- AND z.obs_question_uuid='5090AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
                AND fd.concept_uuid=(select distinct (q.concept_uuid) from mamba_dim_form_question q where q.concept_question_id='height')
            GROUP BY z.encounter_id, z.client_id;

INSERT INTO `flat_poc_art_card_clinical_assessment_page`
SELECT z.encounter_id,
       z.client_id,
       MAX(CASE WHEN concept_question_id = 'visit_date' THEN obs_value_datetime END)             visit_date,
       MAX(CASE WHEN concept_question_id = 'return_date' THEN obs_value_datetime END)            return_date,
       MAX(CASE WHEN concept_question_id = 'visit_on_schedule' THEN obs_value_text END)          visit_on_schedule,
       MAX(CASE WHEN concept_question_id = 'reason_for_next_appointment'
                   THEN obs_value_text END)                                                      reason_for_next_appointment,
       MAX(CASE WHEN concept_question_id = 'other_reason_for_next_appointment'
                   THEN obs_value_text END)                                                      other_reason_for_next_appointment,
       MAX(CASE WHEN concept_question_id = 'temperature' THEN obs_value_numeric END)             temperature,
       MAX(CASE WHEN concept_question_id = 'heart_rate' THEN obs_value_numeric END)              heart_rate,
       MAX(CASE WHEN concept_question_id = 'systolic_blood_pressure'
                   THEN obs_value_numeric END)                                                   systolic_blood_pressure,
       MAX(CASE WHEN concept_question_id = 'diastolic_blood_pressure'
                   THEN obs_value_numeric END)                                                   diastolic_blood_pressure,
       MAX(CASE WHEN concept_question_id = 'height' THEN obs_value_numeric END)                  height,
       MAX(CASE WHEN concept_question_id = 'weight' THEN obs_value_numeric END)                  weight,
       MAX(CASE WHEN concept_question_id = 'bmi' THEN obs_value_numeric END)                     bmi,
       MAX(CASE WHEN concept_question_id = 'muac_cm' THEN obs_value_numeric END)                 muac_cm,
       MAX(CASE WHEN concept_question_id = 'muac_code' THEN obs_value_text END)                  muac_code,
       MAX(CASE WHEN concept_question_id = 'nutritional_status' THEN obs_value_text END)         nutritional_status,
       MAX(CASE WHEN concept_question_id = 'nutritional_support' THEN obs_value_text END)        nutritional_support,
       MAX(CASE WHEN concept_question_id = 'on_family_planning' THEN obs_value_text END)         on_family_planning,
       MAX(CASE WHEN concept_question_id = 'family_planning_methods' THEN obs_value_text END)    family_planning_methods
FROM mamba_z_encounter_obs z
         INNER JOIN mamba_dim_form_question fd
                    ON (fd.concept_uuid = z.obs_question_uuid)
WHERE fd.encounter_type_uuid = '8d5b2be0-c2cc-11de-8d13-0010c6dffd0f'
  AND z.encounter_type_id = fd.encounter_type_id
GROUP BY z.encounter_id, z.client_id;

select count(mamba_id) from mamba_z_encounter_obs where encounter_type_id=15 and obs_question_uuid='5090AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'; -- 3903624

select e.encounter_type, o.person_id, c.concept_id, c.uuid, cd.name, q.concept_question_id, cn.name
from concept c
         inner join concept_name cn on c.concept_id = cn.concept_id
    inner join concept_datatype cd on c.datatype_id = cd.concept_datatype_id
         inner join obs o on c.concept_id = o.concept_id
         inner join encounter e on o.encounter_id = e.encounter_id
         inner join mamba_dim_form_question q on q.concept_uuid = c.uuid
where cn.locale = 'en'
  and o.encounter_id = 14;