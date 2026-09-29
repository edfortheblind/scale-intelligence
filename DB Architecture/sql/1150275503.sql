-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





	



CREATE PROCEDURE wm_RCustomer04
	@Customer nvarchar(25),
	@ShipTo nvarchar(25),
	@Company nvarchar(25)
AS
	-- [comment omitted]
	SET ROWCOUNT 1

	Select * From Customer
	Where Customer = @Customer
	And
	(Ship_to = @ShipTo OR Ship_to IS NULL)
	And
	(Company = @Company OR Company IS NULL) 
	-- [comment omitted]
	Order By (Case When Ship_to IS NOT NULL AND Company IS NOT NULL Then 1
	When Ship_to IS NOT NULL AND Company IS NULL Then 2
	When Ship_to IS NULL AND Company IS NOT NULL Then 3
	When Ship_to IS NULL AND Company IS NULL Then 4 End);




