USE analysis;

-- $BEGIN
SET @form_version = '1.0';
SET @save_questions = false;
SET @form = LOAD_FILE('/Users/smallgod/srv/applications/mets/mamba-ohri/ohri/util/forms/POC_art_assessment.json');

CALL sp_extract_form_questions(@save_questions, @form, @form_version);
-- $END