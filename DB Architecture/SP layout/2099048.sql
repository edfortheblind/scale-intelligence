CREATE procedure AddViewerActionRules(
@formId numeric(5),
@actionName nvarchar(50),
@andOr nvarchar(3),
@columnName nvarchar(100),
@literalValue nvarchar(200),
@operand nvarchar(15),
@processStamp nvarchar(100)
) as

begin

	declare @tableName nvarchar(100);
	
	select @tableName = HEADER_DATA_SOURCE from VIEWER_TEMPLATE where FORM_ID = @formId;
	
	exec dbc_IDynamicActionRule		
		@actionName,
		@andOr,
		@columnName,
		@literalValue,
		@operand,
		@processStamp,
		@tableName,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		null;		
	
end