USE iss;

-- $BEGIN
SET @form_data = LOAD_FILE('/Users/smallgod/srv/applications/mets/mamba-ohri/ohri/util/forms/POC_art_assessment.json');
CALL sp_extract_form_questions(true, @form_data, '1.0', 'mamba_dim_form_question');

-- $END