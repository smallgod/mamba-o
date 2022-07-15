DELIMITER //

DROP PROCEDURE IF EXISTS sp_split_string;

CREATE PROCEDURE sp_split_string(
    IN input_string text,
    IN delimiter_char CHAR(1)
)
BEGIN

    DROP TEMPORARY TABLE IF EXISTS temp_string;
    CREATE TEMPORARY TABLE temp_string
    (
        vals text
    );

    WHILE LOCATE(delimiter_char, input_string) > 1
        DO
            INSERT INTO temp_string SELECT SUBSTRING_INDEX(input_string, delimiter_char, 1);
            SET input_string =
                    REPLACE(input_string, (SELECT LEFT(input_string, LOCATE(delimiter_char, input_string))), '');
        END WHILE;
    INSERT INTO temp_string(vals) VALUES (input_string);
    SELECT TRIM(vals) FROM temp_string;

END //

DELIMITER ;