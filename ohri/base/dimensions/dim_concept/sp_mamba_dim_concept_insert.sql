USE analysis;

-- $BEGIN
INSERT INTO mamba_dim_concept (concept_id,
                               fk_form_question_id,
                               datatype_id,
                               uuid)
SELECT c.concept_id,
       fq.id,
       c.datatype_id,
       c.uuid
FROM concept c
         INNER JOIN mamba_dim_form_question fq
                    ON c.uuid = fq.concept_uuid
WHERE c.retired = 0;
-- $END