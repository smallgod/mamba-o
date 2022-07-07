USE analysis;

-- $BEGIN
SET @form_data = LOAD_FILE('/Users/smallgod/srv/applications/mets/mamba-ohri/ohri/util/forms/POC_art_assessment.json');
CALL sp_extract_form_data(@form_data, 'mamba_dim_form_data');
-- $END