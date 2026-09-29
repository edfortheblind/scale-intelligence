-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */






CREATE PROCEDURE MetaTrans_GetLocationInventory(
@internalLocationInv numeric(9), @culture nvarchar(10))

AS
	SET NOCOUNT ON;				

	Execute GET_SHIPMENT_SECURITY_INFO @internalLocationInv;
	
	SELECT N'<literal:1>' AS N'<literal:2>',
	N'<literal:3>' AS N'<literal:4>',	
	LI.ITEM AS N'<literal:5>',		
	LI.LOCATION AS N'<literal:6>',
	LI.ITEM_DESC AS N'<literal:7>',
	LI.COMPANY AS N'<literal:8>',
	LI.Warehouse AS N'<literal:9>'
	FROM  LOCATION_INVENTORY LI	
	WHERE LI.INTERNAL_LOCATION_INV =  @internalLocationInv;	

