/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	12039		| RAB			| 07/01/03	| Created.

	Inserts a record for dbChange scripts.
*/
CREATE PROCEDURE dbc_IResourceFileBase(
	@resourceLanguage nvarchar(25) = N'en-US',
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
		   N'System',
		   @processStamp,
		   GETUTCDATE()
	 WHERE NOT EXISTS(SELECT * 
						FROM RESOURCE_FILE_BASE 
					   WHERE RESOURCE_LANGUAGE = @resourceLanguage
					     AND RESOURCE_GROUP = @resourceGroup
					     AND RESOURCE_KEY = @resourceKey);
	
	-- if other record found, make sure it has the same text.
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
			set @error = N'The resource key '''+@resourceKey+
					N''' is already used for the text '''+
					@existingText+N''' with process stamp of '''+
					@existingPS+N'''.';
			RAISERROR(@error, 18, 1);
		end;
	end;
-- end dbc_IResourceFileBase
