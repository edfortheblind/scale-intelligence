/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/

	CREATE PROCEDURE wm_RUserProfile01
	@UserName nvarchar(30)
AS
	SELECT * FROM USER_PROFILE
	 WHERE USER_NAME = @UserName
