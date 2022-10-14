USE analysis;

-- $BEGIN
INSERT INTO mamba_dim_concept (concept_id,
                               form_question_id,
                               datatype_id,
                               uuid)
SELECT c.concept_id,
       fd.form_question_id,
       c.datatype_id,
       c.uuid
FROM concept c
         INNER JOIN mamba_dim_form_question fd
                    ON c.uuid = fd.concept_uuid
WHERE c.retired = 0;
-- $END
