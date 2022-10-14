USE iss;

DROP TABLE IF EXISTS mamba_z_encounter_obs;

-- $BEGIN
CREATE TABLE mamba_z_encounter_obs
(
    mamba_id             INT      NOT NULL AUTO_INCREMENT,
    obs_question_uuid    CHAR(38) NULL,
    obs_value_coded_uuid CHAR(38) NULL,

    PRIMARY KEY (mamba_id)
    -- CONSTRAINT `fk_form_data_id`
    --   FOREIGN KEY (`form_data_id`) REFERENCES `mamba_dim_form_question` (`mamba_id`)
)
SELECT o.encounter_id,
       e.encounter_type AS encounter_type_id,
       o.person_id      AS client_id,
       o.obs_datetime,
       o.concept_id     AS obs_question_concept_id,
       o.value_text     AS obs_value_text,
       o.value_numeric  AS obs_value_numeric,
       o.value_coded    AS obs_value_coded,
       o.value_datetime AS obs_value_datetime,
       o.value_complex  AS obs_value_complex,
       o.value_drug     AS obs_value_drug,
       c.uuid           AS obs_question_uuid
FROM obs o
         INNER JOIN mamba_dim_encounter e
                    ON o.encounter_id = e.encounter_id
         INNER JOIN mamba_dim_concept c
                    ON o.concept_id = c.concept_id
WHERE e.encounter_type IN (SELECT DISTINCT (fd.encounter_type_id) FROM mamba_dim_form_question fd);

CREATE INDEX index_encounter_id
    ON mamba_z_encounter_obs (encounter_id);

CREATE INDEX index_encounter_type_id
    ON mamba_z_encounter_obs (encounter_type_id);

CREATE INDEX index_person_id
    ON mamba_z_encounter_obs (client_id);

CREATE INDEX index_obs_question_concept_id
    ON mamba_z_encounter_obs (obs_question_concept_id);

CREATE INDEX index_obs_question_uuid
    ON mamba_z_encounter_obs (obs_question_uuid);

CREATE INDEX index_obs_value_coded_uuid
    ON mamba_z_encounter_obs (obs_value_coded_uuid);

-- update obs_value_coded (UUIDs & values)
UPDATE mamba_z_encounter_obs z
    INNER JOIN mamba_dim_concept c
    ON z.obs_value_coded = c.concept_id
SET z.obs_value_coded_uuid = c.uuid
WHERE z.obs_value_coded IS NOT NULL;
