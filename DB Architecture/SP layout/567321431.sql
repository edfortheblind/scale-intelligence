/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_RCompany01
    	@Company nvarchar(25)

AS
   SET NOCOUNT ON
   SELECT *
     FROM COMPANY
	WHERE COMPANY LIKE @Company

