USE analysis;

DROP TABLE IF EXISTS mamba_dim_person_name;

-- $BEGIN
CREATE TABLE mamba_dim_person_name
(
    id             INT                            NOT NULL AUTO_INCREMENT,
    person_name_id INT                            NOT NULL,
    person_id      INT                            NOT NULL,
    given_name     CHAR(50) CHARACTER SET UTF8MB4 NULL,
    middle_name    CHAR(50) CHARACTER SET UTF8MB4 NULL,

    PRIMARY KEY (id)
);

CREATE INDEX index_person_name_id
    ON mamba_dim_person_name (person_name_id);

CREATE INDEX index_person_id
    ON mamba_dim_person_name (person_id);
-- $END
