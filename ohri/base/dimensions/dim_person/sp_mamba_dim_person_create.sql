USE analysis;

DROP TABLE IF EXISTS mamba_dim_person;

-- $BEGIN
CREATE TABLE mamba_dim_person
(
    id         INT NOT NULL AUTO_INCREMENT,
    person_id  INT NOT NULL,
    gender     CHAR(50) CHARACTER SET UTF8MB4,
    birthdate  DATE,
    dead       TINYINT,
    death_date DATETIME,

    PRIMARY KEY (id)
);

CREATE INDEX index_person_id
    ON mamba_dim_person (person_id);
-- $END
