-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */










CREATE FUNCTION GetNextProjectInstance (@project_name nvarchar(128))
RETURNS NVARCHAR(MAX)
WITH EXECUTE AS CALLER
AS
-- [comment omitted]
BEGIN
     RETURN (select isnull(max(project_instance),0)+1
			from (
				select distinct project_instance from CONFIG_DIR_COLLECTED_DATA where project_name=@project_name
				union
				select distinct project_instance from AR_CONFIG_DIR_COLLECTED_DATA where project_name=@project_name
			) t);
END