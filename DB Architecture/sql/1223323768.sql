-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RLocation03
	@Warehouse nvarchar(25)

AS
   SET NOCOUNT ON
   SELECT *
     FROM LOCATION
	WHERE WAREHOUSE = @Warehouse
	AND LOCATION_CLASS = N'<literal:1>'

