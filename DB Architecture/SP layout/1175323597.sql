/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_RLocatingRuleHeader01
    	@LocatingName nvarchar(25)

AS
   SET NOCOUNT ON
   SELECT *
     FROM LOCATING_RULE_HEADER
	WHERE LOCATING_NAME = @LocatingName

