-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE dbc_IExitPointCategory(
	@exitPointCategory nvarchar(25),
	@description nvarchar(50),
	@processStamp nvarchar(100))

AS
	SET NOCOUNT ON;

	INSERT INTO EXIT_POINT_CATEGORY 
		(EXIT_POINT_CATEGORY, 
		 DESCRIPTION, 
		 SYSTEM_CREATED, 
		 USER_STAMP, 
		 PROCESS_STAMP, 
		 DATE_TIME_STAMP)
	SELECT @exitPointCategory,
		   @description,
		   N'<literal:1>',
		   N'<literal:2>',
		   @processStamp,
		   GETUTCDATE()
	 WHERE NOT EXISTS(SELECT * 
						FROM EXIT_POINT_CATEGORY 
					   WHERE EXIT_POINT_CATEGORY = @exitPointCategory);
-- [comment omitted]
