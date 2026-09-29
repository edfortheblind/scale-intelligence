-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






	CREATE PROCEDURE wm_RWarehouse02
	@Warehouse nvarchar(25)
AS
	SELECT * 
     FROM WAREHOUSE
	 WHERE warehouse = @Warehouse
      AND active = N'<literal:1>'
