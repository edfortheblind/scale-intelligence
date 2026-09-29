-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RCompany01
    	@Company nvarchar(25)

AS
   SET NOCOUNT ON
   SELECT *
     FROM COMPANY
	WHERE COMPANY LIKE @Company

