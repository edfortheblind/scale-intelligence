/*
Mod Number | Programmer | Date     | Modification Description
--------------------------------------------------------------------
158153     | SP         | 03/16/15 | Created.

Function to return the next project instance value for the Configuration Coordinator toolbox utility

Parameters
String project_name
*/

CREATE FUNCTION GetNextProjectInstance (@project_name nvarchar(128))
RETURNS NVARCHAR(MAX)
WITH EXECUTE AS CALLER
AS
-- place the body of the function here
BEGIN
     RETURN (select isnull(max(project_instance),0)+1
			from (
				select distinct project_instance from CONFIG_DIR_COLLECTED_DATA where project_name=@project_name
				union
				select distinct project_instance from AR_CONFIG_DIR_COLLECTED_DATA where project_name=@project_name
			) t);
END