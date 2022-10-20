USE iss;

-- $BEGIN
INSERT INTO mamba_dim_concept (concept_id,
                               fk_form_question_id,
                               datatype_id,
                               uuid)
SELECT c.concept_id,
       fd.mamba_id,
       c.datatype_id,
       c.uuid
FROM concept c
         INNER JOIN mamba_dim_form_question fd
                    ON c.uuid = fd.concept_uuid
WHERE c.retired = 0;
-- WHERE c.retired = 0 and c.uuid='dca1f717-30ab-102d-86b0-7a5022ba4115';
-- $END