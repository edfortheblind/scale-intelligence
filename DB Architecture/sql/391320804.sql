-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_DWarehouseAlert01
	@RowsAffected int OUTPUT,
	@InternalAlertNum numeric(9)
AS
	DELETE FROM WAREHOUSE_ALERT
	 WHERE INTERNAL_ALERT_NUM = @InternalAlertNum

SET @RowsAffected = @@ROWCOUNT
