USE analysis;
DROP TABLE IF EXISTS mamba_dim_encounter_type;

-- $BEGIN
CREATE TABLE mamba_dim_encounter_type
(
    mamba_id          INT                            NOT NULL AUTO_INCREMENT,
    encounter_type_id INT                            NOT NULL,
    name              CHAR(50) CHARACTER SET UTF8MB4 NULL,
    uuid              CHAR(38)                       NOT NULL,

    PRIMARY KEY (mamba_id)
);

CREATE INDEX index_encounter_type_id
    ON mamba_dim_encounter_type (encounter_type_id);

CREATE INDEX index_uuid
    ON mamba_dim_encounter_type (uuid);
-- $END
