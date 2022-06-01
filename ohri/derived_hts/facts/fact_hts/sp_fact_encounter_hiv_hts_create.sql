USE analysis;

DROP TABLE IF EXISTS fact_encounter_hiv_hts;

-- $BEGIN
create table fact_encounter_hiv_hts
(
    id                        int auto_increment,
    encounter_id              int           null,
    client_id                 int           null,
    date_tested               date          null,
    consent                   nvarchar(7)   null,
    community_service_point   nvarchar(255) null,
    pop_type                  nvarchar(50)  null,
    keypop_category           nvarchar(50)  null,
    priority_pop              nvarchar(16)  null,
    test_setting              nvarchar(255) null,
    facility_service_point    nvarchar(255) null,
    hts_approach              nvarchar(255) null,
    pretest_counselling       nvarchar(255) null,
    type_pretest_counselling  nvarchar(255) null,
    reason_for_test           nvarchar(255) null,
    ever_tested_hiv           varchar(7)    null,
    duration_since_last_test  nvarchar(255) null,
    couple_result             nvarchar(50)  null,
    result_received_couple    nvarchar(255) null,
    test_conducted            nvarchar(255) null,
    initial_kit_name          nvarchar(255) null,
    initial_test_result       nvarchar(50)  null,
    confirmatory_kit_name     nvarchar(255) null,
    last_test_result          nvarchar(50)  null,
    final_test_result         nvarchar(50)  null,
    given_result              varchar(7)    null,
    date_given_result         date          null,
    tiebreaker_kit_name       nvarchar(255) null,
    tiebreaker_test_result    nvarchar(50)  null,
    sti_last_6mo              nvarchar(7)   null,
    sexually_active           nvarchar(255) null,
    syphilis_test_result      nvarchar(50)  null,
    unprotected_sex_last_12mo nvarchar(255) null,
    recency_consent           nvarchar(7)   null,
    recency_test_done         nvarchar(7)   null,
    recency_test_type         nvarchar(255) null,
    recency_vl_result         nvarchar(50)  null,
    recency_rtri_result       nvarchar(50)  null,
    PRIMARY KEY (id)
);
-- $END

