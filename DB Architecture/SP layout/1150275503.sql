/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	18471	| SSG	| 01/09/06	| Created

*/
	



CREATE PROCEDURE wm_RCustomer04
	@Customer nvarchar(25),
	@ShipTo nvarchar(25),
	@Company nvarchar(25)
AS
	--We are interested only for a single record
	SET ROWCOUNT 1

	Select * From Customer
	Where Customer = @Customer
	And
	(Ship_to = @ShipTo OR Ship_to IS NULL)
	And
	(Company = @Company OR Company IS NULL) 
	--This is the business need of the evaluation order
	Order By (Case When Ship_to IS NOT NULL AND Company IS NOT NULL Then 1
	When Ship_to IS NOT NULL AND Company IS NULL Then 2
	When Ship_to IS NULL AND Company IS NOT NULL Then 3
	When Ship_to IS NULL AND Company IS NULL Then 4 End);




