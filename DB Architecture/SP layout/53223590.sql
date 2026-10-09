/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	44271	| VK	| 02/12/24	| Created.
	Parameters:
		INTERNAL_LOCATION_INV  The internal location inventory.
	Returns:
		Rowset used for location inventory label. 
*/

CREATE PROCEDURE LBL_LocationInventory (
	@INTERNAL_LOCATION_INV numeric(9))
AS
BEGIN

	SET NOCOUNT ON;

	
SELECT ITEM_DESC,
	   CAST(ON_HAND_QTY AS INT) AS ON_HAND_QTY,
	   QUANTITY_UM , 
	   ITEM ,
	   LOCATION ,
	   LOGISTICS_UNIT, 
	   LOT ,
	   CONVERT(CHAR(10),EXPIRATION_DATE,101) EXPIRATION_DATE,
	   C.COMPANY ,
	   C.NAME COMPANY_NAME
FROM LOCATION_INVENTORY LI WITH(NOLOCK) 
LEFT JOIN  COMPANY C WITH(NOLOCK) 
ON C.COMPANY = LI.COMPANY
WHERE INTERNAL_LOCATION_INV=@INTERNAL_LOCATION_INV

END  




