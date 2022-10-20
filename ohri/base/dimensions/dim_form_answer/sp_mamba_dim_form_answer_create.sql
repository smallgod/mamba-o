USE iss;

DROP TABLE IF EXISTS mamba_dim_form_answer;

-- $BEGIN
CREATE TABLE mamba_dim_form_answer
(
    mamba_id              INT      NOT NULL AUTO_INCREMENT,
    question_concept_uuid CHAR(38) NOT NULL,
    answer_concept_uuid   CHAR(38) NOT NULL,
    answer_concept_label  TEXT,

    PRIMARY KEY (mamba_id)
);

CREATE INDEX index_concept_uuid
    ON mamba_dim_form_answer (answer_concept_uuid);

ALTER TABLE `mamba_dim_form_answer`
    ADD COLUMN `fk_form_question_id` INT NOT NULL AFTER `mamba_id`,
    ADD CONSTRAINT `fk_form_question_id` FOREIGN KEY (`fk_form_question_id`)
        REFERENCES `mamba_dim_form_question` (`mamba_id`);

-- $END