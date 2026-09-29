-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RAppIdentifier01
	@AppIdentifier nvarchar(10)
AS
	SELECT *
	  FROM APP_IDENTIFIER
	 WHERE APP_IDENTIFIER = @AppIdentifier



