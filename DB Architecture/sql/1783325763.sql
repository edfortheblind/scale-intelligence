-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






	CREATE PROCEDURE wm_RUserProfile01
	@UserName nvarchar(30)
AS
	SELECT * FROM USER_PROFILE
	 WHERE USER_NAME = @UserName
