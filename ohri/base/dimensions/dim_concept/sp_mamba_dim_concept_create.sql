USE analysis;
DROP TABLE IF EXISTS mamba_dim_concept;

-- $BEGIN
CREATE TABLE mamba_dim_concept
(
    mamba_id      INT           NOT NULL AUTO_INCREMENT,
    concept_id    INT           NOT NULL,
    datatype_id   INT           NOT NULL,
    datatype_name NVARCHAR(255) NULL,
    uuid          CHAR(38)      NOT NULL,

    PRIMARY KEY (mamba_id)
);

CREATE INDEX index_concept_id
    ON mamba_dim_concept (concept_id);

CREATE INDEX index_datatype_id
    ON mamba_dim_concept (datatype_id);

ALTER TABLE `mamba_dim_concept`
    ADD COLUMN `form_question_id` INT NOT NULL AFTER `concept_id`,
    ADD CONSTRAINT `fk_form_question_id` FOREIGN KEY (`form_question_id`)
        REFERENCES `mamba_dim_form_question` (`mamba_id`);
-- $END
