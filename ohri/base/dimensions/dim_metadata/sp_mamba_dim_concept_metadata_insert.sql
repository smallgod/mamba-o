USE analysis;

TRUNCATE TABLE mamba_dim_concept_metadata2;

-- $BEGIN

INSERT INTO mamba_dim_concept_metadata2 (column_number,
                                        column_label,
                                        concept_uuid,
                                        report_name)
VALUES (1, 'test_setting', '13abe5c9-6de2-4970-b348-36d352ee8eeb', 'fact_hts'),
       (2, 'community_service_point', '74a3b695-30f7-403b-8f63-3f766461e104', 'fact_hts'),
       (3, 'facility_service_point', '80bcc9c1-e328-47e8-affe-6d1bffe4adf1', 'fact_hts'),
       (4, 'hts_approach', '9641ead9-8821-4898-b633-a8e96c0933cf', 'fact_hts'),
       (5, 'pop_type', '166432AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_hts'),
       (6, 'key_pop_type', 'd3d4ae96-8c8a-43db-a9dc-dac951f5dcb3', 'fact_hts'),
       (7, 'key_pop_migrant_worker', '63ea75cb-205f-4e7b-9ede-5f9b8a4dda9f', 'fact_hts'),
       (8, 'key_pop_uniformed_forces', 'b282bb08-62a7-42c2-9bea-8751c267d13e', 'fact_hts'),
       (10, 'key_pop_transgender', '22b202fc-67de-4af9-8c88-46e22559d4b2', 'fact_hts'),
       (11, 'key_pop_AGYW', '678f3144-302f-493e-ba22-7ec60a84732a', 'fact_hts'),
       (12, 'key_pop_fisher_folk', 'def00c73-f6d5-42fb-bcec-0b192b5be22d', 'fact_hts'),
       (13, 'key_pop_prisoners', '8da9bf92-22f6-40be-b468-1ad08de7d457', 'fact_hts'),
       (14, 'key_pop_refugees', 'dc1058ea-4edd-4780-aeaa-a474f7f3a437', 'fact_hts'),
       (15, 'key_pop_msm', '160578AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_hts'),
       (16, 'key_pop_fsw', '160579AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_hts'),
       (17, 'key_pop_truck_driver', '162198AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_hts'),
       (18, 'key_pop_pwd', '365371fd-0106-4a53-abc4-575e3d65d372', 'fact_hts'),
       (19, 'key_pop_pwid', 'c038bff0-8e33-408c-b51f-7fb6448d2f6c', 'fact_hts'),
       (20, 'sexually_active', '160109AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_hts'),
       (21, 'unprotected_sex_last_12mo', '159218AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_hts'),
       (22, 'sti_last_6mo', '156660AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_hts'),
       (23, 'ever_tested_hiv', '1492AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_hts'),
       (24, 'duration_since_last_test', 'e7947a45-acff-49e1-ba1c-33e43a710e0d', 'fact_hts'),
       (25, 'last_test_result', '159427AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_hts'),
       (26, 'reason_for_test', 'ce3816e7-082d-496b-890b-a2b169922c22', 'fact_hts'),
       (27, 'pretest_counselling', 'de32152d-93b0-412a-908a-20af0c46f215', 'fact_hts'),
       (28, 'type_pretest_counselling', '0473ec07-2f34-4447-9c58-e35a1c491b6f', 'fact_hts'),
       (29, 'consent_provided', '1710AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_hts'),
       (30, 'test_conducted', '164401AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_hts'),
       (31, 'date_test_conducted', '164400AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_hts'),
       (32, 'initial_kit_name', 'afa64df8-50af-4bc3-8135-6e6603f62068', 'fact_hts'),
       (33, 'initial_test_result', 'e767ba5d-7560-43ba-a746-2b0ff0a2a513', 'fact_hts'),
       (34, 'confirmatory_kit_name', 'b78d89e7-08aa-484f-befb-1e3e70cd6985', 'fact_hts'),
       (35, 'tiebreaker_kit_name', '73434a78-e4fc-42f7-a812-f30f3b3cabe3', 'fact_hts'),
       (36, 'tiebreaker_test_result', 'bfc5fbb9-2b23-422e-a741-329bb2597032', 'fact_hts'),
       (37, 'final_test_result', 'e16b0068-b6a2-46b7-aba9-e3be00a7b4ab', 'fact_hts'),
       (38, 'syphilis_test_result', '165303AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_hts'),
       (39, 'given_result', '164848AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_hts'),
       (40, 'date_given_result', '160082AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_hts'),
       (41, 'result_received_couple', '445846e9-b929-4519-bc83-d51c051918f5', 'fact_hts'),
       (42, 'couple_result', '5f38bc97-d6ca-43f8-a019-b9a9647d0c6a', 'fact_hts'),
       (43, 'recency_consent', '976ca997-fb2b-4bef-a299-f7c9e16b50a8', 'fact_hts'),
       (44, 'recency_test_done', '4fe5857e-c804-41cf-b3c9-0acc1f516ab7', 'fact_hts'),
       (45, 'recency_test_type', '05112308-79ba-4e00-802e-a7576733b98e', 'fact_hts'),
       (46, 'recency_rtri_result', '165092AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_hts'),
       (47, 'recency_vl_result', '856AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_hts'),

       (1, 'date_assessment', '160753AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_covid_case_assessment'),
       (3, 'assessment_contact_case', '5340f478-ec5d-41e6-bc62-961c52014d4d', 'fact_covid_case_assessment'),
       (4, 'assessment_entry_country', '677f4d21-7293-4810-abe6-57a192acde57', 'fact_covid_case_assessment'),
       (5, 'assessment_follow_up', 'ad8be6bf-ced7-4390-a6af-c5acebeac216', 'fact_covid_case_assessment'),
       (6, 'assessment_health_worker', '30320fb8-b29b-443f-98cf-f3ef491f8947', 'fact_covid_case_assessment'),
       (7, 'assessment_frontline_worker', '38769c82-a3d3-4714-97b7-015726cdb209', 'fact_covid_case_assessment'),
       (8, 'assessment_post_mortem', '1cee0ab3-bf06-49e9-a49c-baf261620c67', 'fact_covid_case_assessment'),
       (9, 'assessment_quarantine', 'e0f1584a-cc8b-48e9-980f-64d9f724caf8', 'fact_covid_case_assessment'),
       (10, 'assessment_rdt_confirmatory', '0ed2e3ca-b9a6-4ff6-ac74-4d4cd9520acc', 'fact_covid_case_assessment'),
       (11, 'assessment_surveillance', '8a6ab892-1b1d-4ad9-82da-c6c38ee8fcfb', 'fact_covid_case_assessment'),
       (12, 'assessment_symptomatic', '1068AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_covid_case_assessment'),
       (13, 'assessment_travel_out_country', 'f8c9c2cc-3070-444e-8818-26fb8100bb78', 'fact_covid_case_assessment'),
       (14, 'assessment_voluntary', 'f974e267-feeb-42be-9d37-61554dad16b1', 'fact_covid_case_assessment'),
       (15, 'assessment_other', 'a782ce41-5499-4521-ae42-16347fe6b9e0', 'fact_covid_case_assessment'),

       (16, 'assessment_presentation', 'de3bc9b7-05b5-41b6-a38d-8d2eec646c4f', 'fact_covid_case_assessment'),
       (17, 'date_onset_symptoms', '1730AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_covid_case_assessment'),

       (19, 'symptom_abdominal_pain', '151AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_covid_case_assessment'),
       (20, 'symptom_chest_pain', '120749AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_covid_case_assessment'),
       (21, 'symptom_cough', 'feb2a008-403c-480e-9d0e-f7100b370815', 'fact_covid_case_assessment'),
       (22, 'symptom_diarrhoea', '6e7d9cd7-8a0b-40ca-bf57-c4fc7510b09a', 'fact_covid_case_assessment'),
       (23, 'symptom_disturbance_consciousness', '118876AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_covid_case_assessment'),
       (24, 'symptom_general_weakness', '5226AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_covid_case_assessment'),
       (25, 'symptom_headache', '139084AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_covid_case_assessment'),
       (26, 'symptom_fever_chills', '140237AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_covid_case_assessment'),
       (27, 'symptom_irritability_confusion', '120345AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_covid_case_assessment'),
       (28, 'symptom_joint_pain', '116558AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_covid_case_assessment'),
       (29, 'symptom_loss_smell', '135589AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_covid_case_assessment'),
       (30, 'symptom_loss_taste', '135589AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_covid_case_assessment'),
       (31, 'symptom_muscular_pain', '133632AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_covid_case_assessment'),
       (32, 'symptom_nausea_vomiting', '5978AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_covid_case_assessment'),
       (33, 'symptom_red_eyes', '127777AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_covid_case_assessment'),
       (34, 'symptom_runny_nose', '94a6ae53-0c36-4889-b2b7-025e48542835', 'fact_covid_case_assessment'),
       (35, 'symptom_shortness_breath', '141600AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_covid_case_assessment'),
       (36, 'symptom_sneezing', '126319AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_covid_case_assessment'),
       (37, 'symptom_sore_throat', '158843AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_covid_case_assessment'),
       (38, 'symptom_tiredness', '124628AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_covid_case_assessment'),
       (39, 'symptom_other', '08287bbb-3b2d-41fc-83e6-9c827e79b8e0', 'fact_covid_case_assessment'),

       (40, 'comorbidity_present', '166020AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_covid_case_assessment'),

       (42, 'comorbidity_cardiovascular', '9a40049b-4875-4a1f-8969-d9231b807ec7', 'fact_covid_case_assessment'),
       (43, 'comorbidity_chronic_lung', '145270AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_covid_case_assessment'),
       (44, 'comorbidity_chronic_neurological', '165646AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_covid_case_assessment'),
       (45, 'comorbidity_current_smoker', '155600AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_covid_case_assessment'),
       (46, 'comorbidity_diabetes', 'e3ea3c4b-df5f-4659-b357-93e3de325660', 'fact_covid_case_assessment'),
       (47, 'comorbidity_former_smoker', '156358AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_covid_case_assessment'),
       (48, 'comorbidity_hiv_aids', '746d0622-21d3-4c57-8ee9-4e2a69637d8c', 'fact_covid_case_assessment'),
       (49, 'comorbidity_hypertension', '117399AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_covid_case_assessment'),
       (50, 'comorbidity_immunodeficiency', '156753AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_covid_case_assessment'),
       (51, 'comorbidity_liver', '139201AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_covid_case_assessment'),
       (52, 'comorbidity_malignancy', 'c4879004-17d7-4eee-b5fc-942e855e2027', 'fact_covid_case_assessment'),
       (53, 'comorbidity_renal', '9c37b227-6426-4866-9fb9-a19800572924', 'fact_covid_case_assessment'),
       (54, 'comorbidity_tb', '1a0ce98b-3fc0-4a07-b813-9dad49d8347e', 'fact_covid_case_assessment'),
       (55, 'comorbidity_other', '166104AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_covid_case_assessment'),
       (56, 'covid_test', '069f6dfe-88c1-4a45-a894-0d99549c8718', 'fact_covid_case_assessment'),
       (57, 'order_date', '162078AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_covid_case_assessment'),
       (58, 'rapid_antigen_test', '165852AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_covid_case_assessment'),
       (59, 'diagnostic_pcr_test', '165840AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_covid_case_assessment'),
       (60, 'result_date', '163724AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_covid_case_assessment'),
       (61, 'rapid_antigen_result', 'cbcbb029-f11f-4437-9d53-1d0f0a170433', 'fact_covid_case_assessment'),
       (62, 'diagnostic_pcr_result', '3f4ee14b-b4ab-4597-9fe9-406883b63d76', 'fact_covid_case_assessment'),
       (63, 'patient_outcome', 'a845f3e6-4432-4de4-9fff-37fa270b1a06', 'fact_covid_case_assessment'),
       (64, 'date_recovered', '162868AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_covid_case_assessment'),
       (65, 'date_died', '1543AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'fact_covid_case_assessment'),
       (66, 'long_covid_description', '4560c560-4bd6-4989-bff8-6e4e1fa39972', 'fact_covid_case_assessment');

-- Insert output Table Names
-- Tie together the report names to the corresponding encounter types & output tables

INSERT INTO mamba_dim_concept_metadata2 (output_table_name, report_name, concept_uuid, column_label)
SELECT (CASE
             WHEN (et.encounter_type_uuid = '253a43d3-c99e-415c-8b78-ee7d4d3c1d54' AND m.report_name = 'fact_covid_case_assessment') THEN 'encounter_covid'
             WHEN (et.encounter_type_uuid = '79c1f50f-f77d-42e2-ad2a-d29304dde2fe' AND m.report_name = 'fact_hts') THEN 'encounter_hts'
    END), m.report_name, m.concept_uuid, m.column_label
FROM mamba_dim_concept_metadata2 m JOIN mamba_dim_encounter_type et
WHERE et.encounter_type_uuid
          IN ('253a43d3-c99e-415c-8b78-ee7d4d3c1d54', '79c1f50f-f77d-42e2-ad2a-d29304dde2fe');








SET @report_data='
{
  "flat_report_metadata": [
    {
      "report_name": "HTS Report",
      "flat_table_name": "encounter_hts",
      "encounter_type_uuid": "253a43d3-c99e-415c-8b78-ee7d4d3c1d54",
      "table_columns": {
        "test_setting": "13abe5c9-6de2-4970-b348-36d352ee8eeb",
        "community_service_point": "74a3b695-30f7-403b-8f63-3f766461e104",
        "date_assessment": "160753AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
        "assessment_contact_case": "5340f478-ec5d-41e6-bc62-961c52014d4d"
      }
    },
    {
      "report_name": "COVID Report",
      "flat_table_name": "encounter_covid",
      "encounter_type_uuid": "79c1f50f-f77d-42e2-ad2a-d29304dde2fe",
      "table_columns": {
        "date_assessment": "160753AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
        "assessment_contact_case": "5340f478-ec5d-41e6-bc62-961c52014d4d"
      }
    }
  ]
}
';
TRUNCATE TABLE mamba_dim_concept_metadata2;
CALL sp_extract_report_metadata(@report_data, '');

SELECT JSON_EXTRACT(@report_data, '$.flat_report_metadata[0].table_columns') as columns;
SELECT JSON_KEYS(@report_data, '$.flat_report_metadata[0].table_columns') as field_name_array; -- keys
SELECT JSON_EXTRACT(@report_data, '$.flat_report_metadata[0].table_columns.*') as concept_uuid_array; -- values
SELECT JSON_EXTRACT(@report_data, '$.flat_report_metadata[0]') as extracted;

SELECT JSON_KEYS(@report_data, '$.flat_report_metadata[0]') as jsonKeys;



-- $END