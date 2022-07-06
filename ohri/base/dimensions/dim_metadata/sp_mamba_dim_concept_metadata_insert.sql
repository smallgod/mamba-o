USE analysis;

-- $BEGIN
SET @form_data = LOAD_FILE('/Users/smallgod/srv/applications/mets/mamba-ohri/ohri/util/forms/covid-assessment-summary.json');
CALL sp_extract_metadata_from_form(@form_data, 'mamba_dim_concept_metadata');
-- $END