-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






	CREATE PROCEDURE wm_RVendor02
    	@SourceId nvarchar(25),
	@ShipFrom nvarchar(25),
	@Company nvarchar(25)

AS
   SET NOCOUNT ON
   SELECT *
     FROM VENDOR
	WHERE VENDOR = @SourceId
	AND (SHIP_FROM = @ShipFrom OR SHIP_FROM IS NULL)
	AND (COMPANY = @Company OR COMPANY IS NULL)
     ORDER BY SHIP_FROM DESC,COMPANY	

