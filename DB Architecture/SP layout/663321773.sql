/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_RCustomer02
	@Customer nvarchar(25),
	@Company nvarchar(25)
AS
	SELECT * FROM CUSTOMER
	WHERE CUSTOMER = @Customer
	AND ((COMPANY = @Company)
		OR COMPANY IS NULL)
	ORDER BY COMPANY

