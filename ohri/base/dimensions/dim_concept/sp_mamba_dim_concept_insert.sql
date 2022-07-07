USE analysis;

-- $BEGIN
INSERT INTO mamba_dim_concept (concept_id,
                               form_data_id,
                               datatype_id,
                               uuid)
SELECT c.concept_id,
       fd.mamba_id,
       c.datatype_id,
       c.uuid
FROM concept c
         INNER JOIN mamba_dim_form_data fd
                    ON c.uuid = fd.concept_uuid
WHERE c.retired = 0;
-- $END
