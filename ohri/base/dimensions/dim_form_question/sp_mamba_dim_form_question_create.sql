USE analysis;

DROP TABLE IF EXISTS mamba_dim_form_question;

-- $BEGIN
CREATE TABLE mamba_dim_form_question
(
    mamba_id            INT           NOT NULL AUTO_INCREMENT,
    encounter_type_id   INT           NOT NULL,
    encounter_type_uuid CHAR(38)      NOT NULL,
    form_name           NVARCHAR(255) NOT NULL,
    form_id     NVARCHAR(255) NOT NULL,
    concept_rendering   NVARCHAR(255) NOT NULL,
    concept_uuid        CHAR(38)      NOT NULL,
    concept_label       TEXT          NULL,
    column_label        NVARCHAR(255) NULL

    PRIMARY KEY (mamba_id)
);

CREATE INDEX index_encounter_type_id
    ON mamba_dim_form_question (encounter_type_id);

CREATE INDEX index_encounter_type_uuid
    ON mamba_dim_form_question (encounter_type_uuid);

CREATE INDEX index_form_concept_id
    ON mamba_dim_form_question (form_concept_id);

CREATE INDEX index_concept_uuid
    ON mamba_dim_form_question (concept_uuid);

CREATE INDEX index_encounter_concept_uuid
    ON mamba_dim_form_question (concept_uuid, concept_parent_uuid, encounter_type_uuid);

-- $END
