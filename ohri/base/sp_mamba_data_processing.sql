USE analysis;

-- $BEGIN
-- CALL dbo.sp_xf_system_drop_all_objects_in_schema('analysis');
-- CALL dbo.sp_xf_system_drop_all_views_in_schema('analysis');
CALL sp_mamba_system_drop_all_tables_in_schema('openmrs_dev');

CALL sp_mamba_dim_concept_datatype;
CALL sp_mamba_dim_encounter_type;
CALL sp_mamba_dim_form_data;
CALL sp_mamba_dim_concept;
-- CALL sp_mamba_dim_concept_name;
-- CALL sp_mamba_dim_concept_answer;
CALL sp_mamba_dim_encounter;
CALL sp_mamba_dim_person;
CALL sp_mamba_dim_person_name;
CALL sp_mamba_dim_person_address;
CALL sp_dim_client;
CALL sp_dim_agegroup;
CALL sp_mamba_z_tables;

-- CALL sp_fact_hts_encounter;
-- CALL sp_fact_covid_encounter;
CALL sp_fact_art_encounter;
-- $END