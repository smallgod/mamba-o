USE analysis;

DROP TABLE IF EXISTS mamba_dim_concept_datatype;

-- $BEGIN
CREATE TABLE mamba_dim_concept_datatype
(
    id                  INT                             NOT NULL AUTO_INCREMENT,
    concept_datatype_id INT                             NOT NULL,
    name                CHAR(255) CHARACTER SET UTF8MB4 NULL,

    PRIMARY KEY (id)
);

CREATE INDEX index_concept_datatype_id
    ON mamba_dim_concept_datatype (concept_datatype_id);
-- $END
