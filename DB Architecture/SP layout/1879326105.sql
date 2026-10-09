/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/

	CREATE PROCEDURE wm_RWarehouseAlert01
	@InternalAlertNum numeric(9)
AS
	SELECT * FROM WAREHOUSE_ALERT
	 WHERE INTERNAL_ALERT_NUM = @InternalAlertNum
