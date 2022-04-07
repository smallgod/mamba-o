# ---------INSERT into table
USE analysis;

-- $BEGIN

INSERT INTO covid_fact_encounter (
    encounter_id ,
    client_id,
    covid_test,
    order_date,
    result_date,
    date_assessment,
    assessment_presentation,
    assessment_contact_case,
    assessment_entry_country,
    assessment_travel_out_country,
    assessment_follow_up,
    assessment_voluntary,
    assessment_quarantine,
    assessment_symptomatic,
    assessment_surveillance,
    assessment_health_worker,
    assessment_frontline_worker,
    assessment_rdt_confirmatory,
    assessment_post_mortem,
    assessment_other,
    date_onset_symptoms,
    symptom_cough,
    symptom_headache,
    symptom_red_eyes,
    symptom_sneezing,
    symptom_diarrhoea,
    symptom_sore_throat,
    symptom_tiredness,
    symptom_chest_pain,
    symptom_joint_pain,
    symptom_loss_smell,
    symptom_loss_taste,
    symptom_runny_nose,
    symptom_fever_chills,
    symptom_muscular_pain,
    symptom_general_weakness,
    symptom_shortness_breath,
    symptom_nausea_vomiting,
    symptom_abdominal_pain,
    symptom_irritability_confusion,
    symptom_disturbance_consciousness,
    symptom_other,
    comorbidity_present,
    comorbidity_tb,
    comorbidity_liver,
    comorbidity_renal,
    comorbidity_diabetes,
    comorbidity_hiv_aids,
    comorbidity_malignancy,
    comorbidity_chronic_lung,
    comorbidity_hypertension,
    comorbidity_former_smoker,
    comorbidity_cardiovascular,
    comorbidity_current_smoker,
    comorbidity_immunodeficiency,
    comorbidity_chronic_neurological,
    comorbidity_other,
    diagnostic_pcr_test,
    diagnostic_pcr_result,
    rapid_antigen_test,
    rapid_antigen_result,
    long_covid_description,
    patient_outcome,
    date_recovered,
    date_died
)
SELECT
    encounter_id,
    client_id,
    covid_test,
    cast(order_date as date)order_date,
    cast(result_date as date)result_date,
    cast(date_assessment as date)date_assessment,
    assessment_presentation,
    assessment_contact_case,
    assessment_entry_country,
    assessment_travel_out_country,
    assessment_follow_up,
    assessment_voluntary,
    assessment_quarantine,
    assessment_symptomatic,
    assessment_surveillance,
    assessment_health_worker,
    assessment_frontline_worker,
    assessment_rdt_confirmatory,
    assessment_post_mortem,
    assessment_other,
    cast(date_onset_symptoms as date)date_onset_symptoms,
    symptom_cough,
    symptom_headache,
    symptom_red_eyes,
    symptom_sneezing,
    symptom_diarrhoea,
    symptom_sore_throat,
    symptom_tiredness,
    symptom_chest_pain,
    symptom_joint_pain,
    symptom_loss_smell,
    symptom_loss_taste,
    symptom_runny_nose,
    symptom_fever_chills,
    symptom_muscular_pain,
    symptom_general_weakness,
    symptom_shortness_breath,
    symptom_nausea_vomiting,
    symptom_abdominal_pain,
    symptom_irritability_confusion,
    symptom_disturbance_consciousness,
    symptom_other,
           case
        when comorbidity_present in ('Yes', 'True') then 1
        when comorbidity_present in ('False','No') then 0
    end as comorbidity_present,
    comorbidity_tb,
    comorbidity_liver,
    comorbidity_renal,
    comorbidity_diabetes,
    comorbidity_hiv_aids,
    comorbidity_malignancy,
    comorbidity_chronic_lung,
    comorbidity_hypertension,
    comorbidity_former_smoker,
    comorbidity_cardiovascular,
    comorbidity_current_smoker,
    comorbidity_immunodeficiency,
    comorbidity_chronic_neurological,
    comorbidity_other,
    diagnostic_pcr_test,
    diagnostic_pcr_result,
    rapid_antigen_test,
    rapid_antigen_result,
    long_covid_description,
    patient_outcome,
    cast(date_recovered as date)date_recovered,
    cast(date_died as date)date_died
FROM encounter_covid;


-- $END