-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





-- [comment omitted]

CREATE function fn_AuditLogValueReturnValue
(  
	@fieldtype numeric(9),
	@internalId numeric(9)
) 
RETURNS NVARCHAR(max) 
BEGIN
	declare @ColumnNameList NVARCHAR(MAX)
	declare @maxFieldLength int=30000;-- [comment omitted]
	select @ColumnNameList = STRING_AGG(CAST(VALUE as nvarchar(MAX)),N'<literal:1>') from AUDIT_LOG_VALUE where FIELD_TYPE = @fieldtype and INTERNAL_ID = @internalId
	set @ColumnNameList = LEFT(@ColumnNameList,@maxFieldLength)

	return @ColumnNameList
END