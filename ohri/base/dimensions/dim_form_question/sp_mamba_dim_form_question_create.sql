USE analysis;

DROP TABLE IF EXISTS mamba_dim_form_question;

-- $BEGIN
CREATE TABLE mamba_dim_form_question
(
    id                  INT                             NOT NULL AUTO_INCREMENT,
    form_name           CHAR(255) CHARACTER SET UTF8MB4 NOT NULL,
    form_version        CHAR(10) CHARACTER SET UTF8MB4  NOT NULL DEFAULT '1.0',
    encounter_type_id   INT                             NOT NULL,
    encounter_type_uuid CHAR(38)                        NOT NULL,
    concept_question_id CHAR(255) CHARACTER SET UTF8MB4 NOT NULL,
    concept_rendering   CHAR(255) CHARACTER SET UTF8MB4 NOT NULL,
    concept_uuid        CHAR(38)                        NOT NULL,
    concept_label       TEXT,

    PRIMARY KEY (id),
    CONSTRAINT uk_encounter_formversion_questionid
        UNIQUE (form_version, encounter_type_uuid, concept_question_id),
);

CREATE INDEX index_encounter_type_id
    ON mamba_dim_form_question (encounter_type_id);

CREATE INDEX index_encounter_type_uuid
    ON mamba_dim_form_question (encounter_type_uuid);

CREATE INDEX index_question_id
    ON mamba_dim_form_question (concept_question_id);

CREATE INDEX index_concept_uuid
    ON mamba_dim_form_question (concept_uuid);

-- $END
