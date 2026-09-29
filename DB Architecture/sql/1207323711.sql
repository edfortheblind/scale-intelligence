-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RLocation02
    	@Location nvarchar(25),
	@Warehouse nvarchar(25)

AS
   SET NOCOUNT ON
   SELECT *
     FROM LOCATION
	WHERE LOCATION = @Location
	AND WAREHOUSE = @Warehouse
	AND LOCATION_CLASS = N'<literal:1>'

