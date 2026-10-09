/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_RCustomer03
	@Customer nvarchar(25),
	@ShipTo nvarchar(25),
	@Company nvarchar(25)
AS
	SELECT * FROM CUSTOMER
	WHERE CUSTOMER = @Customer
	AND ((SHIP_TO = @ShipTo) OR (SHIP_TO IS NULL AND @ShipTo IS NULL))
	AND ((COMPANY = @Company)
		OR COMPANY IS NULL)
	ORDER BY SHIP_TO DESC,COMPANY DESC

