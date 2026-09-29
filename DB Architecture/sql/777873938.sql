-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

CREATE PROCEDURE [dbo].[PURGE_ARCHIVE_TABLES] AS
BEGIN 
    -- [comment omitted]
   
	IF ((SELECT @@SERVERNAME) IN (N'<literal:1>', N'<literal:2>', N'<literal:3>', N'<literal:4>')
	OR (SELECT DB_NAME()) IN (N'<literal:5>'))
   
    BEGIN
        DECLARE @TruncateCommands NVARCHAR(4000)
        SELECT @TruncateCommands = 
        STUFF(
                (SELECT '<literal:6>' + char(13) + char(10) + '<literal:7>' + QUOTENAME(SchemaName) + '<literal:8>' + QUOTENAME(TableName)
                  FROM
                  (select schema_name(schema_id) as SchemaName,object_name(object_id) as TableName
                  from sys.Tables
                  where name like '<literal:9>' and name not like '<literal:10>') t

                  FOR XML PATH('<literal:11>'), TYPE)
                  .value('<literal:12>', '<literal:13>')
            ,1,1,'<literal:14>')
        -- [comment omitted]
        EXEC sp_executesql @TruncateCommands  -- [comment omitted]
    END	
	ELSE
	BEGIN
        SELECT @@SERVERNAME AS SERVER_NAME, '<literal:15>' AS ERROR;
		-- [comment omitted]
        RETURN;
    END	
END
