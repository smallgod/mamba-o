USE analysis;

DROP TABLE IF EXISTS dim_agegroup;

-- $BEGIN
CREATE TABLE dim_agegroup
(
    id              INT                            NOT NULL AUTO_INCREMENT,
    age             INT                            NULL,
    datim_agegroup  CHAR(50) CHARACTER SET UTF8MB4 NULL,
    normal_agegroup CHAR(50) CHARACTER SET UTF8MB4 NULL,

    PRIMARY KEY (id)
);
-- $END
