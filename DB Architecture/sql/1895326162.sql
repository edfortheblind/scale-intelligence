-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






	CREATE PROCEDURE wm_RWarehouseAlert02
	@AlertType nvarchar(25)
AS
   SET NOCOUNT ON
	SELECT * 
     FROM WAREHOUSE_ALERT
	 WHERE alert_type = @AlertType
      AND active = N'<literal:1>'
