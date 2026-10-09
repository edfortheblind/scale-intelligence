/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/

	CREATE PROCEDURE wm_RWarehouse02
	@Warehouse nvarchar(25)
AS
	SELECT * 
     FROM WAREHOUSE
	 WHERE warehouse = @Warehouse
      AND active = N'Y'
