-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RCustomer02
	@Customer nvarchar(25),
	@Company nvarchar(25)
AS
	SELECT * FROM CUSTOMER
	WHERE CUSTOMER = @Customer
	AND ((COMPANY = @Company)
		OR COMPANY IS NULL)
	ORDER BY COMPANY

