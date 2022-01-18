USE recency_uganda_prod_analysis_test
GO

TRUNCATE TABLE  base.fact_cqi_assessment_merged;

-- $BEGIN

INSERT INTO base.fact_cqi_assessment_merged
(
    cqi_assessment_merged_id,
    form_version,
    uri,
    cqi_checklist_type,
    assessment_point,
    visit_date,
    visit_date_id,
    review_period_start_date,
    review_period_start_date_id,
    review_period_end_date,
    review_period_end_date_id,
    visitor_name,
    visitor_name_other,
    ss_total_hts_providers,
    ss_number_of_hts_providers_trained,
    ss_hts_providers_trained_comments,
    ss_number_of_hts_providers_trained_available,
    ss_number_of_hts_providers_trained_working,
    ss_number_of_hts_providers_trained_by_cme,
    ss_hts_providers_follow_sops_for_eligibility,
    ss_hts_providers_follow_sops_for_eligibilit_comment,
    ss_hts_providers_follow_sops_for_testing,
    ss_hts_providers_follow_sops_for_testing_comment,
    ss_hts_providers_interpret_results_accurately,
    ss_hts_providers_interpret_results_accurately_comment,
    ss_all_tests_with_control_and_verification_line_marked_recent,
    ss_all_tests_with_control_and_verification_line_marked_recent_comment,
    ss_all_tests_with_three_lines_marked_long_term,
    ss_all_tests_with_three_lines_marked_long_term_comment,
    ss_all_tests_with_only_control_line_marked_negative,
    ss_all_tests_with_only_control_line_marked_negative_comment,
    ss_all_invalid_tests_interpreted_correctly,
    ss_all_invalid_tests_interpreted_correctly_comment,
    ss_docs_showing_all_hts_providers_trained_in_routine_rapid_testing,
    ss_docs_showing_all_hts_providers_trained_in_routine_rapid_testing_comment,
    ss_docs_showing_all_hts_providers_trained_in_rtri_testing,
    ss_docs_showing_all_hts_providers_trained_in_rtri_testing_comment,
    ss_hts_performed_in_private_space,
    ss_hts_performed_in_private_space_comment,
    ss_any_recency_trained_staff_changes_since_training,
    ss_any_recency_trained_staff_changes_since_training_comment,
    ss_score_denominator,
    ss_score,
    procedures_sop_manual_visible_at_facility_location,
    procedures_sop_manual_visible_at_facility_location_comment,
    procedures_informed_consent_materials_easily_physically_accessible,
    procedures_informed_consent_materials_easily_physically_accessible_comment,
    procedures_rtri_conducted_correctly,
    procedures_rtri_conducted_correctly_comment,
    procedures_sample_buffer_tube_labeled_with_client_identifiers,
    procedures_sample_buffer_tube_labeled_with_client_identifiers_comment,
    procedures_timers_available_and_used_routinely_for_rtri,
    procedures_timers_available_and_used_routinely_for_rtri_comment,
    procedures_sop_followed_for_rtri,
    procedures_sop_followed_for_rtri_comment,
    procedures_repeat_testing_of_invalid_tests_done,
    procedures_repeat_testing_of_invalid_tests_done_comment,
    procedures_specimen_collection_timely,
    procedures_specimen_collection_timely_comment,
    procedures_qc_for_positive_and_negative_routinely_used,
    procedures_qc_for_positive_and_negative_routinely_used_comment,
    procedures_recency_pt_performed_by_hts_providers,
    procedures_recency_pt_performed_by_hts_providers_comment,
    procedures_samples_prepared_according_to_schedule,
    procedures_samples_prepared_according_to_schedule_comment,
    procedures_electronic_data_entry_done_weekly,
    procedures_electronic_data_entry_done_weekly_comment,
    procedures_corrective_action_taken_in_sop_failure_taken,
    procedures_corrective_action_taken_in_sop_failure_taken_comment,
    procedures_date_of_qc,
    procedures_kit_lot_number,
    procedures_score_denominator,
    procedures_score,
    sd_number_records_in_logbook,
    sd_number_records_in_logbook_comment,
    sd_number_records_in_logbook_rtri_complete,
    sd_number_records_in_logbook_rtri_complete_comment,
    sd_number_records_with_complete_hts_id,
    sd_number_records_with_complete_hts_id_comment,
    sd_number_records_in_logbook_with_complete_kit_details,
    sd_number_records_in_logbook_with_complete_kit_details_comment,
    sd_total_specimen_shipment_forms_created,
    sd_total_specimen_shipment_forms_created_comment,
    sd_total_specimens_in_shipment_forms,
    sd_total_specimens_in_shipment_forms_comment,
    sd_total_specimens_in_shipment_forms_completely_filled,
    sd_total_specimens_in_shipment_forms_completely_filled_comment,
    sd_only_standard_hts_forms_used,
    sd_only_standard_hts_forms_used_comment,
    sd_hts_forms_correctly_filled,
    sd_hts_forms_correctly_filled_comment,
    sd_all_hts_register_demographics_and_rtri_results_correctly_filled,
    sd_all_hts_register_demographics_and_rtri_results_correctly_filled_comment,
    sd_all_logbooks_correctly_filled_with_kit_details_and_rtri_results,
    sd_all_logbooks_correctly_filled_with_kit_details_and_rtri_results_comment,
    sd_all_records_in_hts_register_have_hts_history,
    sd_all_records_in_hts_register_have_hts_history_comment,
    sd_all_records_in_hts_register_have_final_hts_diagnosis,
    sd_all_records_in_hts_register_have_final_hts_diagnosis_comment,
    sd_prop_of_records_complete_with_hts_id,
    sd_prop_of_samples_shipped_to_hub,
    sd_score_denominator,
    sd_score,
    pf_sufficient_lighting_in_testing_area,
    pf_sufficient_lighting_in_testing_area_comment,
    pf_kits_stored_according_to_instructions,
    pf_kits_stored_according_to_instructions_comment,
    pf_current_and_past_temperature_charts_available,
    pf_current_and_past_temperature_charts_available_comment,
    pf_records_stored_in_secure_storage_room,
    pf_records_stored_in_secure_storage_room_comment,
    pf_all_electronic_tools_password_protected,
    pf_all_electronic_tools_password_protected_comment,
    pf_score_denominator,
    pf_score,
    prf_total_15_and_above_received_hts,
    prf_total_15_and_above_received_hts_comment,
    prf_total_clients_eligible,
    prf_total_clients_eligible_comment,
    prf_total_clients_enrolled_for_rtri,
    prf_total_clients_enrolled_for_rtri_comment,
    prf_total_clients_ineligible,
    prf_total_clients_ineligible_comment,
    prf_total_clients_enrolled_for_rtri_with_correct_consent_doc,
    prf_total_clients_enrolled_for_rtri_with_correct_consent_doc_comment,
    prf_total_15_and_above_tested_recent,
    prf_total_15_and_above_tested_recent_comment,
    prf_total_15_and_above_tested_long_term,
    prf_total_15_and_above_tested_long_term_comment,
    prf_total_clients_enrolled_for_rtri_repoering_adverse_events,
    prf_total_clients_enrolled_for_rtri_repoering_adverse_events_comment,
    prf_score_denominator,
    prf_score,
    site_supplies_asante_test_kits_available,
    site_supplies_asante_test_kits_available_comment,
    site_supplies_specimen_shipment_forms_available,
    site_supplies_specimen_shipment_forms_available_comment,
    site_supplies_samples_shipped,
    site_supplies_samples_shipped_comment,
    site_supplies_samples_shipped_rejected,
    site_supplies_samples_shipped_rejected_comment,
    site_supplies_logbooks_available,
    site_supplies_logbooks_available_comment,
    site_supplies_all_rtri_supplies_available,
    site_supplies_all_rtri_supplies_available_comment,
    site_supplies_asante_test_kits_available_and_stocked,
    site_supplies_asante_test_kits_available_and_stocked_comment,
    site_supplies_ppt_edta_tubes_available,
    site_supplies_ppt_edta_tubes_available_comment,
    site_supplies_rtri_supplies_used_before_expiry,
    site_supplies_rtri_supplies_used_before_expiry_comment,
    site_supplies_score_denominator,
    site_supplies_score,
    visit_number,
    reversed_visit_number,
    is_latest_visit,
    ss_prop_of_trained_hts_providers,
    ss_prop_of_trained_hts_providers_available_during_visit,
    ss_prop_of_hts_providers_trained_on_hiv_rapid_testing,
    cx_procedures_score,
    cx_study_staff_score,
    sd_prop_of_complete_records_in_logbook,
    sd_prop_of_complete_records_with_kit_details,
    sd_prop_of_shipment_forms_completely_filled,
    cx_source_data_score,
    cx_physical_facility_score,
    prf_prop_of_enrolled_clients_in_rtri,
    prf_prop_of_enrolled_clients_in_rtri_with_consent_doc,
    cx_participant_recruitment_score,
    cx_site_supplies_score,
  	facility_id

)
SELECT
    cqi_assessment_id,
    form_version,
    uri,
    'Regular CQI Checklist' AS cqi_checklist_type,
    assessment_point,
    visit_date,
    (SELECT date_id FROM base.dim_date WHERE date_yyyymmdd = visit_date) AS visit_date_id,
    review_period_start AS review_period_start_date,
    (SELECT date_id FROM base.dim_date WHERE date_yyyymmdd = review_period_start) AS review_period_start_date_id,
    review_period_end AS review_period_end_date,
    (SELECT date_id FROM base.dim_date WHERE date_yyyymmdd = review_period_end) AS review_period_end_date_id,
    visitor_name,
    visitor_name_other,
    ss_total_hts_providers,
    ss_number_of_hts_providers_trained,
    ss_hts_providers_trained_comments,
    ss_number_of_hts_providers_trained_available,
    ss_number_of_hts_providers_trained_working,
    ss_number_of_hts_providers_trained_by_cme,
    ss_hts_providers_follow_sops_for_eligibility,
    ss_hts_providers_follow_sops_for_eligibilit_comment,
    ss_hts_providers_follow_sops_for_testing,
    ss_hts_providers_follow_sops_for_testing_comment,
    ss_hts_providers_interpret_results_accurately,
    ss_hts_providers_interpret_results_accurately_comment,
    ss_all_tests_with_control_and_verification_line_marked_recent,
    ss_all_tests_with_control_and_verification_line_marked_recent_comment,
    ss_all_tests_with_three_lines_marked_long_term,
    ss_all_tests_with_three_lines_marked_long_term_comment,
    ss_all_tests_with_only_control_line_marked_negative,
    ss_all_tests_with_only_control_line_marked_negative_comment,
    ss_all_invalid_tests_interpreted_correctly,
    ss_all_invalid_tests_interpreted_correctly_comment,
    ss_docs_showing_all_hts_providers_trained_in_routine_rapid_testing,
    ss_docs_showing_all_hts_providers_trained_in_routine_rapid_testing_comment,
    ss_docs_showing_all_hts_providers_trained_in_rtri_testing,
    ss_docs_showing_all_hts_providers_trained_in_rtri_testing_comment,
    ss_hts_performed_in_private_space,
    ss_hts_performed_in_private_space_comment,
    ss_any_recency_trained_staff_changes_since_training,
    ss_any_recency_trained_staff_changes_since_training_comment,
    ss_score_denominator,
    ss_score,
    procedures_sop_manual_visible_at_facility_location,
    procedures_sop_manual_visible_at_facility_location_comment,
    procedures_informed_consent_materials_easily_physically_accessible,
    procedures_informed_consent_materials_easily_physically_accessible_comment,
    procedures_rtri_conducted_correctly,
    procedures_rtri_conducted_correctly_comment,
    procedures_sample_buffer_tube_labeled_with_client_identifiers,
    procedures_sample_buffer_tube_labeled_with_client_identifiers_comment,
    procedures_timers_available_and_used_routinely_for_rtri,
    procedures_timers_available_and_used_routinely_for_rtri_comment,
    procedures_sop_followed_for_rtri,
    procedures_sop_followed_for_rtri_comment,
    procedures_repeat_testing_of_invalid_tests_done,
    procedures_repeat_testing_of_invalid_tests_done_comment,
    procedures_specimen_collection_timely,
    procedures_specimen_collection_timely_comment,
    procedures_qc_for_positive_and_negative_routinely_used,
    procedures_qc_for_positive_and_negative_routinely_used_comment,
    procedures_recency_pt_performed_by_hts_providers,
    procedures_recency_pt_performed_by_hts_providers_comment,
    procedures_samples_prepared_according_to_schedule,
    procedures_samples_prepared_according_to_schedule_comment,
    procedures_electronic_data_entry_done_weekly,
    procedures_electronic_data_entry_done_weekly_comment,
    procedures_corrective_action_taken_in_sop_failure_taken,
    procedures_corrective_action_taken_in_sop_failure_taken_comment,
    NULL AS procedures_date_of_qc,
    NULL AS procedures_kit_lot_number, 
    procedures_score_denominator,
    procedures_score,
    sd_number_records_in_logbook,
    sd_number_records_in_logbook_comment,
    sd_number_records_in_logbook_rtri_complete,
    sd_number_records_in_logbook_rtri_complete_comment,
    sd_number_records_with_complete_hts_id,
    sd_number_records_with_complete_hts_id_comment,
    sd_number_records_in_logbook_with_complete_kit_details,
    sd_number_records_in_logbook_with_complete_kit_details_comment,
    sd_total_specimen_shipment_forms_created,
    sd_total_specimen_shipment_forms_created_comment,
    sd_total_specimens_in_shipment_forms,
    sd_total_specimens_in_shipment_forms_comment,
    sd_total_specimens_in_shipment_forms_completely_filled,
    sd_total_specimens_in_shipment_forms_completely_filled_comment,
    sd_only_standard_hts_forms_used,
    sd_only_standard_hts_forms_used_comment,
    sd_hts_forms_correctly_filled,
    sd_hts_forms_correctly_filled_comment,
    sd_all_hts_register_demographics_and_rtri_results_correctly_filled,
    sd_all_hts_register_demographics_and_rtri_results_correctly_filled_comment,
    sd_all_logbooks_correctly_filled_with_kit_details_and_rtri_results,
    sd_all_logbooks_correctly_filled_with_kit_details_and_rtri_results_comment,
    sd_all_records_in_hts_register_have_hts_history,
    sd_all_records_in_hts_register_have_hts_history_comment,
    sd_all_records_in_hts_register_have_final_hts_diagnosis,
    sd_all_records_in_hts_register_have_final_hts_diagnosis_comment,
    sd_prop_of_records_complete_with_hts_id,
    sd_prop_of_samples_shipped_to_hub,
    sd_score_denominator,
    sd_score,
    pf_sufficient_lighting_in_testing_area,
    pf_sufficient_lighting_in_testing_area_comment,
    pf_kits_stored_according_to_instructions,
    pf_kits_stored_according_to_instructions_comment,
    pf_current_and_past_temperature_charts_available,
    pf_current_and_past_temperature_charts_available_comment,
    pf_records_stored_in_secure_storage_room,
    pf_records_stored_in_secure_storage_room_comment,
    pf_all_electronic_tools_password_protected,
    pf_all_electronic_tools_password_protected_comment,
    pf_score_denominator,
    pf_score,
    prf_total_15_and_above_received_hts,
    prf_total_15_and_above_received_hts_comment,
    prf_total_clients_eligible,
    prf_total_clients_eligible_comment,
    prf_total_clients_enrolled_for_rtri,
    prf_total_clients_enrolled_for_rtri_comment,
    prf_total_clients_ineligible,
    prf_total_clients_ineligible_comment,
    prf_total_clients_enrolled_for_rtri_with_correct_consent_doc,
    prf_total_clients_enrolled_for_rtri_with_correct_consent_doc_comment,
    prf_total_15_and_above_tested_recent,
    prf_total_15_and_above_tested_recent_comment,
    prf_total_15_and_above_tested_long_term,
    prf_total_15_and_above_tested_long_term_comment,
    prf_total_clients_enrolled_for_rtri_repoering_adverse_events,
    prf_total_clients_enrolled_for_rtri_repoering_adverse_events_comment,
    prf_score_denominator,
    prf_score,
    site_supplies_asante_test_kits_available,
    site_supplies_asante_test_kits_available_comment,
    site_supplies_specimen_shipment_forms_available,
    site_supplies_specimen_shipment_forms_available_comment,
    site_supplies_samples_shipped,
    site_supplies_samples_shipped_comment,
    site_supplies_samples_shipped_rejected,
    site_supplies_samples_shipped_rejected_comment,
    site_supplies_logbooks_available,
    site_supplies_logbooks_available_comment,
    site_supplies_all_rtri_supplies_available,
    site_supplies_all_rtri_supplies_available_comment,
    site_supplies_asante_test_kits_available_and_stocked,
    site_supplies_asante_test_kits_available_and_stocked_comment,
    site_supplies_ppt_edta_tubes_available,
    site_supplies_ppt_edta_tubes_available_comment,
    site_supplies_rtri_supplies_used_before_expiry,
    site_supplies_rtri_supplies_used_before_expiry_comment,
    site_supplies_score_denominator,
    site_supplies_score,
    NULL AS visit_number,
    NULL AS reversed_visit_number,
    NULL AS is_latest_visit,
    ss_prop_of_trained_hts_providers,
    ss_prop_of_trained_hts_providers_available_during_visit,
    ss_prop_of_hts_providers_trained_on_hiv_rapid_testing,
    cx_procedures_score,
    cx_study_staff_score,
    sd_prop_of_complete_records_in_logbook,
    sd_prop_of_complete_records_with_kit_details,
    sd_prop_of_shipment_forms_completely_filled,
    cx_source_data_score,
    cx_physical_facility_score,
    prf_prop_of_enrolled_clients_in_rtri,
    prf_prop_of_enrolled_clients_in_rtri_with_consent_doc,
    cx_participant_recruitment_score,
    cx_site_supplies_score,
  	facility_id
FROM
    base.fact_cqi_assessment


    UNION ALL 

SELECT
    cqi_shortened_assessment_id,
    form_version,
    uri,
    'Shortened CQI Checklist' AS cqi_checklist_type,
    assessment_point,
    visit_date,
    (SELECT date_id FROM base.dim_date WHERE date_yyyymmdd = visit_date) AS visit_date_id,
    review_period_start AS review_period_start_date,
    (SELECT date_id FROM base.dim_date WHERE date_yyyymmdd = review_period_start) AS review_period_start_date_id,
    review_period_end AS review_period_end_date,
    (SELECT date_id FROM base.dim_date WHERE date_yyyymmdd = review_period_end) AS review_period_end_date_id,
    visitor_name,
    visitor_name_other,
    ss_total_hts_providers,
    ss_number_of_hts_providers_trained,
    NULL AS ss_hts_providers_trained_comments,
    NULL AS ss_number_of_hts_providers_trained_available,
    NULL AS ss_number_of_hts_providers_trained_working,
    ss_number_of_hts_providers_trained_by_cme,
    NULL AS ss_hts_providers_follow_sops_for_eligibility,
    NULL AS ss_hts_providers_follow_sops_for_eligibilit_comment,
    NULL AS ss_hts_providers_follow_sops_for_testing,
    NULL AS ss_hts_providers_follow_sops_for_testing_comment,
    NULL AS ss_hts_providers_interpret_results_accurately,
    NULL AS ss_hts_providers_interpret_results_accurately_comment,
    NULL AS ss_all_tests_with_control_and_verification_line_marked_recent,
    NULL AS ss_all_tests_with_control_and_verification_line_marked_recent_comment,
    NULL AS ss_all_tests_with_three_lines_marked_long_term,
    NULL AS ss_all_tests_with_three_lines_marked_long_term_comment,
    NULL AS ss_all_tests_with_only_control_line_marked_negative,
    NULL AS ss_all_tests_with_only_control_line_marked_negative_comment,
    NULL AS ss_all_invalid_tests_interpreted_correctly,
    NULL AS ss_all_invalid_tests_interpreted_correctly_comment,
    NULL AS ss_docs_showing_all_hts_providers_trained_in_routine_rapid_testing,
    NULL AS ss_docs_showing_all_hts_providers_trained_in_routine_rapid_testing_comment,
    NULL AS ss_docs_showing_all_hts_providers_trained_in_rtri_testing,
    NULL AS ss_docs_showing_all_hts_providers_trained_in_rtri_testing_comment,
    NULL AS ss_hts_performed_in_private_space,
    NULL AS ss_hts_performed_in_private_space_comment,
    ss_any_recency_trained_staff_changes_since_training,
    ss_any_recency_trained_staff_changes_since_training_comment,
    NULL AS ss_score_denominator,
    NULL AS ss_score,
    NULL AS procedures_sop_manual_visible_at_facility_location,
    NULL AS procedures_sop_manual_visible_at_facility_location_comment,
    NULL AS procedures_informed_consent_materials_easily_physically_accessible,
    NULL AS procedures_informed_consent_materials_easily_physically_accessible_comment,
    NULL AS procedures_rtri_conducted_correctly,
    NULL AS procedures_rtri_conducted_correctly_comment,
    NULL AS procedures_sample_buffer_tube_labeled_with_client_identifiers,
    NULL AS procedures_sample_buffer_tube_labeled_with_client_identifiers_comment,
    NULL AS procedures_timers_available_and_used_routinely_for_rtri,
    NULL AS procedures_timers_available_and_used_routinely_for_rtri_comment,
    NULL AS procedures_sop_followed_for_rtri,
    NULL AS procedures_sop_followed_for_rtri_comment,
    NULL AS procedures_repeat_testing_of_invalid_tests_done,
    NULL AS procedures_repeat_testing_of_invalid_tests_done_comment,
    NULL AS procedures_specimen_collection_timely,
    NULL AS procedures_specimen_collection_timely_comment,
    procedures_qc_for_positive_and_negative_routinely_used,
    NULL AS procedures_qc_for_positive_and_negative_routinely_used_comment,
    NULL AS procedures_recency_pt_performed_by_hts_providers,
    NULL AS procedures_recency_pt_performed_by_hts_providers_comment,
    NULL AS procedures_samples_prepared_according_to_schedule,
    NULL AS procedures_samples_prepared_according_to_schedule_comment,
    NULL AS procedures_electronic_data_entry_done_weekly,
    NULL AS procedures_electronic_data_entry_done_weekly_comment,
    NULL AS procedures_corrective_action_taken_in_sop_failure_taken,
    NULL AS procedures_corrective_action_taken_in_sop_failure_taken_comment,
    procedures_date_of_qc,
    procedures_kit_lot_number, 
    NULL AS procedures_score_denominator,
    NULL AS procedures_score,
    NULL AS sd_number_records_in_logbook,
    NULL AS sd_number_records_in_logbook_comment,
    NULL AS sd_number_records_in_logbook_rtri_complete,
    NULL AS sd_number_records_in_logbook_rtri_complete_comment,
    NULL AS sd_number_records_with_complete_hts_id,
    NULL AS sd_number_records_with_complete_hts_id_comment,
    NULL AS sd_number_records_in_logbook_with_complete_kit_details,
    NULL AS sd_number_records_in_logbook_with_complete_kit_details_comment,
    NULL AS sd_total_specimen_shipment_forms_created,
    NULL AS sd_total_specimen_shipment_forms_created_comment,
    NULL AS sd_total_specimens_in_shipment_forms,
    NULL AS sd_total_specimens_in_shipment_forms_comment,
    NULL AS sd_total_specimens_in_shipment_forms_completely_filled,
    NULL AS sd_total_specimens_in_shipment_forms_completely_filled_comment,
    NULL AS sd_only_standard_hts_forms_used,
    NULL AS sd_only_standard_hts_forms_used_comment,
    NULL AS sd_hts_forms_correctly_filled,
    NULL AS sd_hts_forms_correctly_filled_comment,
    NULL AS sd_all_hts_register_demographics_and_rtri_results_correctly_filled,
    NULL AS sd_all_hts_register_demographics_and_rtri_results_correctly_filled_comment,
    NULL AS sd_all_logbooks_correctly_filled_with_kit_details_and_rtri_results,
    NULL AS sd_all_logbooks_correctly_filled_with_kit_details_and_rtri_results_comment,
    NULL AS sd_all_records_in_hts_register_have_hts_history,
    NULL AS sd_all_records_in_hts_register_have_hts_history_comment,
    NULL AS sd_all_records_in_hts_register_have_final_hts_diagnosis,
    NULL AS sd_all_records_in_hts_register_have_final_hts_diagnosis_comment,
    NULL AS sd_prop_of_records_complete_with_hts_id,
    NULL AS sd_prop_of_samples_shipped_to_hub,
    NULL AS sd_score_denominator,
    NULL AS sd_score,
    NULL AS pf_sufficient_lighting_in_testing_area,
    NULL AS pf_sufficient_lighting_in_testing_area_comment,
    NULL AS pf_kits_stored_according_to_instructions,
    NULL AS pf_kits_stored_according_to_instructions_comment,
    NULL AS pf_current_and_past_temperature_charts_available,
    NULL AS pf_current_and_past_temperature_charts_available_comment,
    NULL AS pf_records_stored_in_secure_storage_room,
    NULL AS pf_records_stored_in_secure_storage_room_comment,
    NULL AS pf_all_electronic_tools_password_protected,
    NULL AS pf_all_electronic_tools_password_protected_comment,
    NULL AS pf_score_denominator,
    NULL AS pf_score,
    NULL AS prf_total_15_and_above_received_hts,
    NULL AS prf_total_15_and_above_received_hts_comment,
    prf_total_clients_eligible,
    NULL AS prf_total_clients_eligible_comment,
    prf_total_clients_enrolled_for_rtri,
    NULL AS prf_total_clients_enrolled_for_rtri_comment,
    prf_total_clients_ineligible,
    NULL AS prf_total_clients_ineligible_comment,
    NULL AS prf_total_clients_enrolled_for_rtri_with_correct_consent_doc,
    NULL AS prf_total_clients_enrolled_for_rtri_with_correct_consent_doc_comment,
    prf_total_15_and_above_tested_recent,
    NULL AS prf_total_15_and_above_tested_recent_comment,
    prf_total_15_and_above_tested_long_term,
    NULL AS prf_total_15_and_above_tested_long_term_comment,
    NULL AS prf_total_clients_enrolled_for_rtri_repoering_adverse_events,
    NULL AS prf_total_clients_enrolled_for_rtri_repoering_adverse_events_comment,
    NULL AS prf_score_denominator,
    NULL AS prf_score,
    NULL AS site_supplies_asante_test_kits_available,
    NULL AS site_supplies_asante_test_kits_available_comment,
    NULL AS site_supplies_specimen_shipment_forms_available,
    NULL AS site_supplies_specimen_shipment_forms_available_comment,
    site_supplies_samples_shipped,
    NULL AS site_supplies_samples_shipped_comment,
    NULL AS site_supplies_samples_shipped_rejected,
    NULL AS site_supplies_samples_shipped_rejected_comment,
    NULL AS site_supplies_logbooks_available,
    NULL AS site_supplies_logbooks_available_comment,
    site_supplies_all_rtri_supplies_available,
    site_supplies_all_rtri_supplies_available_comment,
    NULL AS site_supplies_asante_test_kits_available_and_stocked,
    NULL AS site_supplies_asante_test_kits_available_and_stocked_comment,
    NULL AS site_supplies_ppt_edta_tubes_available,
    NULL AS site_supplies_ppt_edta_tubes_available_comment,
    NULL AS site_supplies_rtri_supplies_used_before_expiry,
    NULL AS site_supplies_rtri_supplies_used_before_expiry_comment,
    NULL AS site_supplies_score_denominator,
    NULL AS site_supplies_score,
    NULL AS visit_number,
    NULL AS reversed_visit_number,
    NULL AS is_latest_visit,
    ss_prop_of_trained_hts_providers,
    ss_prop_of_trained_hts_providers_available_during_visit,
    ss_prop_of_hts_providers_trained_on_hiv_rapid_testing,
    cx_procedures_score,
    cx_study_staff_score,
    sd_prop_of_complete_records_in_logbook,
    sd_prop_of_complete_records_with_kit_details,
    sd_prop_of_shipment_forms_completely_filled,
    cx_source_data_score,
    cx_physical_facility_score,
    prf_prop_of_enrolled_clients_in_rtri,
    prf_prop_of_enrolled_clients_in_rtri_with_consent_doc,
    cx_participant_recruitment_score,
    cx_site_supplies_score,
    facility_id
FROM 
    base.fact_cqi_shortened_assessment
    
-- $END

SELECT COUNT(*) num_records_cqi_assessment FROM base.fact_cqi_assessment;
SELECT COUNT(*) num_records_shortened_cqi_assessment FROM base.fact_cqi_shortened_assessment;
SELECT COUNT(*) num_records_cqi_assessment_merged FROM base.fact_cqi_assessment_merged;
SELECT * FROM base.fact_cqi_assessment_merged;