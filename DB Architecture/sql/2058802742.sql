-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE dbc_IResourceFileBase(
	@resourceLanguage nvarchar(25) = N'<literal:1>',
	@resourceGroup nvarchar(4),
	@resourceKey nvarchar(50),
	@text nvarchar(2000),
	@fieldLength numeric(4) = 0,
	@decimalPos numeric(4) = 0,
	@processStamp nvarchar(100))

AS
	SET NOCOUNT ON;

	declare @error nvarchar(2000);
	declare @existingPS nvarchar(100);
	declare @existingText nvarchar(2000);

	INSERT INTO RESOURCE_FILE_BASE 
		(RESOURCE_LANGUAGE,
		 RESOURCE_GROUP,
		 RESOURCE_KEY,
		 TEXT,
		 FIELD_LENGTH,
		 DECIMAL_POS,
		 USER_STAMP,
		 PROCESS_STAMP,
		 DATE_TIME_STAMP) 
	SELECT @resourceLanguage,
		   @resourceGroup,
		   @resourceKey,
		   @text,
		   @fieldLength,
		   @decimalPos,
		   N'<literal:2>',
		   @processStamp,
		   GETUTCDATE()
	 WHERE NOT EXISTS(SELECT * 
						FROM RESOURCE_FILE_BASE 
					   WHERE RESOURCE_LANGUAGE = @resourceLanguage
					     AND RESOURCE_GROUP = @resourceGroup
					     AND RESOURCE_KEY = @resourceKey);
	
	-- [comment omitted]
	if (@@rowcount <= 0)
	begin
		SELECT @existingText = TEXT,
			   @existingPS = PROCESS_STAMP
		  FROM RESOURCE_FILE_BASE
		 WHERE RESOURCE_LANGUAGE = @resourceLanguage
		   AND RESOURCE_GROUP = @resourceGroup
		   AND RESOURCE_KEY = @resourceKey;
		   
		if (@text <> @existingText)
		begin
			set @error = N'<literal:3>'+@resourceKey+
					N'<literal:4>'+
					@existingText+N'<literal:5>'+
					@existingPS+N'<literal:6>';
			RAISERROR(@error, 18, 1);
		end;
	end;
-- [comment omitted]
