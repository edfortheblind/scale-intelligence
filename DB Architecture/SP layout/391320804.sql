/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_DWarehouseAlert01
	@RowsAffected int OUTPUT,
	@InternalAlertNum numeric(9)
AS
	DELETE FROM WAREHOUSE_ALERT
	 WHERE INTERNAL_ALERT_NUM = @InternalAlertNum

SET @RowsAffected = @@ROWCOUNT
