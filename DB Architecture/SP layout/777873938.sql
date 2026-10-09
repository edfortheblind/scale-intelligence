
CREATE PROCEDURE [dbo].[PURGE_ARCHIVE_TABLES] AS
BEGIN 
    --VALIDATE THE DB SERVER NAME
   
	IF ((SELECT @@SERVERNAME) IN (N'sqlservereastustlsft', N'sqlserveraustraliasoutheastfxivr', N'sqlserverwesteuropebsfns', N'sqlserverwestindiaudrde')
	OR (SELECT DB_NAME()) IN (N'awalstgtnvyi'))
   
    BEGIN
        DECLARE @TruncateCommands NVARCHAR(4000)
        SELECT @TruncateCommands = 
        STUFF(
                (SELECT ';' + char(13) + char(10) + 'TRUNCATE TABLE ' + QUOTENAME(SchemaName) + '.' + QUOTENAME(TableName)
                  FROM
                  (select schema_name(schema_id) as SchemaName,object_name(object_id) as TableName
                  from sys.Tables
                  where name like 'AR_%' and name not like '%ARCHIVE_%') t

                  FOR XML PATH(''), TYPE)
                  .value('.', 'NVARCHAR(MAX)')
            ,1,1,'')
        --PRINT @TruncateCommands
        EXEC sp_executesql @TruncateCommands  --uncomment to execute truncate commands
    END	
	ELSE
	BEGIN
        SELECT @@SERVERNAME AS SERVER_NAME, 'STORED PROCEDURE IS ONLY MEANT FOR NON-PROD!' AS ERROR;
		--SELECT DB_NAME() AS DATABSE_NAME, 'STORED PROCEDURE IS ONLY MEANT FOR NON-PROD!' AS ERROR;
        RETURN;
    END	
END
