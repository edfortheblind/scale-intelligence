-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






	CREATE PROCEDURE wm_RVendor03
    	@SourceId nvarchar(25),
	@Company nvarchar(25)

AS
   SET NOCOUNT ON
   SELECT *
     FROM VENDOR
	WHERE VENDOR = @SourceId
	AND (COMPANY = @Company OR COMPANY IS NULL)
     ORDER BY COMPANY	

