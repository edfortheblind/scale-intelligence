/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_RLocation01
    	@Location nvarchar(25),
	@Warehouse nvarchar(25)

AS
   SET NOCOUNT ON
   SELECT *
     FROM LOCATION
	WHERE LOCATION = @Location
	AND WAREHOUSE = @Warehouse

