/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_RLocation03
	@Warehouse nvarchar(25)

AS
   SET NOCOUNT ON
   SELECT *
     FROM LOCATION
	WHERE WAREHOUSE = @Warehouse
	AND LOCATION_CLASS = N'Receiving Pre-Check In'

