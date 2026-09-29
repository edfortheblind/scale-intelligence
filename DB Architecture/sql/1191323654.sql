-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RLocation01
    	@Location nvarchar(25),
	@Warehouse nvarchar(25)

AS
   SET NOCOUNT ON
   SELECT *
     FROM LOCATION
	WHERE LOCATION = @Location
	AND WAREHOUSE = @Warehouse

