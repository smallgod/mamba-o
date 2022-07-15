USE analysis;

-- $BEGIN
-- UPDATE mamba_dim_encounter e
--     INNER JOIN mamba_dim_form_data fd
--     ON e.encounter_type = fd.encounter_type_id
-- SET e.encounter_type_uuid = fd.encounter_type_uuid
-- WHERE e.encounter_id > 0;
-- $END
