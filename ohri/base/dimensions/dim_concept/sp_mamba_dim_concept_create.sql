USE analysis;

DROP TABLE IF EXISTS mamba_dim_concept;

-- $BEGIN
CREATE TABLE mamba_dim_concept
(
    id            INT                             NOT NULL AUTO_INCREMENT,
    concept_id    INT                             NOT NULL,
    datatype_id   INT                             NOT NULL,
    datatype_name CHAR(255) CHARACTER SET UTF8MB4 NULL,
    uuid          CHAR(38)                        NOT NULL,

    PRIMARY KEY (id)
);

CREATE INDEX index_concept_id
    ON mamba_dim_concept (concept_id);

CREATE INDEX index_datatype_id
    ON mamba_dim_concept (datatype_id);

ALTER TABLE `mamba_dim_concept`
    ADD COLUMN `fk_form_question_id` INT NOT NULL AFTER `id`,
    ADD CONSTRAINT `fk_form_question_id_constraint` FOREIGN KEY (`fk_form_question_id`)
        REFERENCES `mamba_dim_form_question` (`id`);
-- $END
