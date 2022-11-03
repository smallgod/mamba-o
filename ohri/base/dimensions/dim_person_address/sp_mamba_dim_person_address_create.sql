USE analysis;

DROP TABLE IF EXISTS mamba_dim_person_address;

-- $BEGIN
CREATE TABLE mamba_dim_person_address
(
    id                INT                             NOT NULL AUTO_INCREMENT,
    person_address_id INT                             NOT NULL,
    person_id         INT,
    city_village      CHAR(255) CHARACTER SET UTF8MB4 NULL,
    county_district   CHAR(255) CHARACTER SET UTF8MB4 NULL,
    address1          CHAR(255) CHARACTER SET UTF8MB4 NULL,
    address2          CHAR(255) CHARACTER SET UTF8MB4 NULL,

    PRIMARY KEY (id)
);

CREATE INDEX index_person_address_id
    ON mamba_dim_person_address (person_address_id);

CREATE INDEX index_person_id
    ON mamba_dim_person_address (person_id);
-- $END
