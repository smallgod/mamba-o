DELIMITER //

DROP PROCEDURE IF EXISTS dbo.sp_xf_system_drop_all_objects_in_schema;

CREATE PROCEDURE dbo.sp_xf_system_drop_all_objects_in_schema(
    IN database_name NVARCHAR(255)
)
BEGIN

    CALL dbo.sp_xf_system_drop_all_stored_functions_in_schema(database_name);
    CALL dbo.sp_xf_system_drop_all_stored_procedures_in_schema (database_name);
    CALL dbo.sp_xf_system_drop_all_tables_in_schema(database_name);
    # CALL dbo.sp_xf_system_drop_all_views_in_schema (database_name);

END //

DELIMITER ;
