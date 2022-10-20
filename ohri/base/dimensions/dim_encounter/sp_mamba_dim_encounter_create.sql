USE iss;

DROP TABLE IF EXISTS mamba_dim_encounter;

-- $BEGIN
CREATE TABLE mamba_dim_encounter
(
    mamba_id           INT NOT NULL AUTO_INCREMENT,
    encounter_id       INT NOT NULL UNIQUE,
    encounter_type     INT NOT NULL,
--    encounter_type_uuid CHAR(38) NULL,
    encounter_datetime DATETIME,
    visit_id           INT,

    PRIMARY KEY (mamba_id)
);

CREATE INDEX index_encounter_id
    ON mamba_dim_encounter (encounter_id);

CREATE INDEX index_encounter_type
    ON mamba_dim_encounter (encounter_type);

-- CREATE INDEX index_encounter_type_uuid
--    ON mamba_dim_encounter (encounter_type_uuid);
-- $END
