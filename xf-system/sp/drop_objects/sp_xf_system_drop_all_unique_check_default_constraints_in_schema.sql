
--
-- Drops Unique constraints, Check constraints and Default constraints from all tables in a given schema 
--
CREATE OR ALTER PROCEDURE dbo.sp_xf_system_drop_all_unique_check_default_constraints_in_schema(@schema AS NVARCHAR(255)) AS
BEGIN

    DECLARE @SQL NVARCHAR ( MAX );

    SET @SQL = N'';
    SELECT
        @SQL = @SQL + N'
    ALTER TABLE ' + @schema + '.' + QUOTENAME( t.name ) + ' DROP CONSTRAINT ' + QUOTENAME( c.name ) + ';' 
    FROM
        sys.objects AS c
        INNER JOIN sys.tables AS t ON c.parent_object_id = t.[object_id]
        INNER JOIN sys.schemas AS s ON t.[schema_id] = s.[schema_id] 
    WHERE
        c.[type] IN ('UQ', 'C', 'D')
        AND SCHEMA_NAME(t.schema_id) = @schema
    ORDER BY
    c.[type];

    EXEC(@SQL)
    PRINT @SQL
    PRINT N'Dropped all Unique constraints, Check constraints and Default constraints in schema: ' + @schema

END