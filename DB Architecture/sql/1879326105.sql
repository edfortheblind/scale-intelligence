-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






	CREATE PROCEDURE wm_RWarehouseAlert01
	@InternalAlertNum numeric(9)
AS
	SELECT * FROM WAREHOUSE_ALERT
	 WHERE INTERNAL_ALERT_NUM = @InternalAlertNum
