/*
	Mod Number	| Programmer	| Date   	| Modification Description
	-------------------------------------------------------------------- 
	193560		| RJR			| 12/16/16	| Created.
*/

-- do not change the name of this file. the function is used by the AUDIT_LOG_VIEW so must be run before script AuditLogView.sql

CREATE function fn_AuditLogValueReturnValue
(  
	@fieldtype numeric(9),
	@internalId numeric(9)
) 
RETURNS NVARCHAR(max) 
BEGIN
	declare @ColumnNameList NVARCHAR(MAX)
	declare @maxFieldLength int=30000;--set maxFieldLimit to 30k characters
	select @ColumnNameList = STRING_AGG(CAST(VALUE as nvarchar(MAX)),N'') from AUDIT_LOG_VALUE where FIELD_TYPE = @fieldtype and INTERNAL_ID = @internalId
	set @ColumnNameList = LEFT(@ColumnNameList,@maxFieldLength)

	return @ColumnNameList
END