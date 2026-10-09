/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/

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

