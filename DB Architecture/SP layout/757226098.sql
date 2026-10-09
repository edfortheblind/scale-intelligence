
/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	201100	| RS	| 03/27/17	| Created.
*/


CREATE PROCEDURE MetaTrans_GetLocationInventory(
@internalLocationInv numeric(9), @culture nvarchar(10))

AS
	SET NOCOUNT ON;				

	Execute GET_SHIPMENT_SECURITY_INFO @internalLocationInv;
	
	SELECT N'SCALAR' AS N'EntityType',
	N'LocationInventory' AS N'EntityName',	
	LI.ITEM AS N'ITEM',		
	LI.LOCATION AS N'LOCATION',
	LI.ITEM_DESC AS N'DESCRIPTION',
	LI.COMPANY AS N'COMPANY',
	LI.Warehouse AS N'WAREHOUSE'
	FROM  LOCATION_INVENTORY LI	
	WHERE LI.INTERNAL_LOCATION_INV =  @internalLocationInv;	

