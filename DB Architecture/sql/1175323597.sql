-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RLocatingRuleHeader01
    	@LocatingName nvarchar(25)

AS
   SET NOCOUNT ON
   SELECT *
     FROM LOCATING_RULE_HEADER
	WHERE LOCATING_NAME = @LocatingName

