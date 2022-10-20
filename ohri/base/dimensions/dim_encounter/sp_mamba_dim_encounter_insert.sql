USE iss;

-- $BEGIN
INSERT INTO mamba_dim_encounter(encounter_id,
                                encounter_type,
                                encounter_datetime,
                                visit_id)
SELECT e.encounter_id,
       e.encounter_type,
       e.encounter_datetime,
       e.visit_id
FROM encounter e
    WHERE e.encounter_type
              IN (SELECT DISTINCT (fd.encounter_type_id) FROM mamba_dim_form_question fd);
-- $END