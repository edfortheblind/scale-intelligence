-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */











CREATE PROCEDURE ADT_IAuditLogValue(
	@internalId numeric(9),
	@fieldType numeric(9),
	@value nvarchar(max),
	@userStamp nvarchar(30),
	@dateTimeStamp datetime)
AS
	
	SET NOCOUNT ON;

	declare @maxFieldLength INT;
	declare @startPosition INT;
	declare @valueLength INT;
	declare @text nvarchar(2000);

	set @maxFieldLength = 1998;
	set @startPosition = 1;
	set @valueLength = LEN(@value);
	
	while(@startPosition < @valueLength)
	begin
		set @text = SUBSTRING(@value, @startPosition, @maxFieldLength);
		
		INSERT INTO AUDIT_LOG_VALUE
			(INTERNAL_ID,
			FIELD_TYPE,
			VALUE,
			USER_STAMP,
			DATE_TIME_STAMP)
		VALUES
			(@internalId,
			@fieldType,
			@text,
			@userStamp,
			@dateTimeStamp);
		
		set @startPosition = @startPosition + @maxFieldLength;
	end;

