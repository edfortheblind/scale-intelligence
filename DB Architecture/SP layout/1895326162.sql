/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/

	CREATE PROCEDURE wm_RWarehouseAlert02
	@AlertType nvarchar(25)
AS
   SET NOCOUNT ON
	SELECT * 
     FROM WAREHOUSE_ALERT
	 WHERE alert_type = @AlertType
      AND active = N'Y'
