DELIMITER //

DROP FUNCTION IF EXISTS fn_extract_table_name;

CREATE FUNCTION fn_extract_table_name(input_string TEXT) RETURNS TEXT
    DETERMINISTIC
BEGIN
    DECLARE flat_table_name TEXT;

    SET flat_table_name = 'flat';
    SET input_string = LCASE(CONCAT(TRIM(input_string), ' ')); -- removing any preceding space, add trailing space

    WHILE LOCATE(' ', input_string) >= 1
        DO
            SET flat_table_name = CONCAT(flat_table_name, '_', SUBSTRING_INDEX(input_string, ' ', 1));
            SET input_string = REPLACE(input_string, LEFT(input_string, LOCATE(' ', input_string)), '');

        END WHILE;
    RETURN (flat_table_name);
END //

DELIMITER ;