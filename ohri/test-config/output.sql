
-- $BEGIN

SET @report_data = '{"flat_report_metadata":[
{
  "report_name": "CT ART Therapy",
  "flat_table_name": "flat_encounter_arttherapy",
  "encounter_type_uuid": "74bf4fe6-8fdb-4228-be39-680a93a9cf6d",
  "table_columns": {
    "art_plan": "7557d77c-172b-4673-9335-67a38657dd01",
    "artstart_date": "159599AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
    "regimen": "dfbe256e-30ba-4033-837a-2e8477f2e7cd",
    "regimen_line": "164515AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
    "regimenline_switched_date": "164516AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
    "regimen_substituted_date": "164431AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
    "art_stop_reason": "1252AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
    "art_stop_date": "160739AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
    "art_restart_date": "160738AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
    "notes": "165095AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
  }
},
{
  "report_name": "CT Patient Enrolment",
  "flat_table_name": "flat_encounter_patientenrolment",
  "encounter_type_uuid": "7e54cd64-f9c3-11eb-8e6a-57478ce139b0",
  "table_columns": {
    "patient_type": "83e40f2c-c316-43e6-a12e-20a338100281",
    "pop_type": "166432AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
    "reenrolment_date": "20efadf9-86d3-4498-b3ab-7da4dad9c429",
    "reenrolment_reason": "14ae2dc9-5964-425a-87e8-9ca525cf055e",
    "date_enrolled": "160555AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
    "transferring_facility": "160535AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
    "artstart_date": "159599AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
    "current_regimen": "1257AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
    "transferin_documentation": "7962d0ed-0fb5-4580-8e46-6fd318091154",
    "date_confirmed_hiv_positive": "160554AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
    "test_type": "ca4953af-9ad4-4514-b54a-6832acd7cae9",
    "previous_haart_pep": "8bfdc328-1970-446c-9d7b-97d62703801b",
    "date_pep_last_used": "fbe937b6-a4ad-4ce5-9c43-002222fbabfb",
    "previous_haart_prep": "5d397775-0155-4033-95dc-edcec98e8190",
    "date_prep_last_used": "5af829e9-2427-4ed7-bb55-de4381610364",
    "previous_haart_hepatitis": "906ed69c-949b-47b5-b469-2205f0da473a",
    "date_hepatitis_last_used": "6a6cbda5-b155-4144-9ff9-ec3d1d1cd509",
    "nnrtis": "9064043b-5b18-4228-97ff-f0e20aaf9448",
    "nrtis": "54e7ff9b-4d93-41ba-ad0b-cb5f565785f2",
    "PIs": "77eed025-0f5c-4173-bf45-36e05a175aaf",
    "other_hivdrugs": "5424AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
    "treatmentsupporter_name": "160638AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
    "phone_number": "159635AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
    "treatmentsupporter_relationship": "160642AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
    "notes": "165095AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
  }
}]}';

CALL sp_extract_report_metadata(@report_data, 'mamba_dim_concept_metadata');

-- $END
