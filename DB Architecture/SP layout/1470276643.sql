/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	139653  | KSS   | 04/04/14  | Created
	236116  | MHM   | 06/17/19  | Get the inventory attributes from the archive Inventory table if not exists in Inventory table.
*/

CREATE PROCEDURE wm_RLocationInventoryAttributes04
	@ObjectId numeric(9)
AS
 IF EXISTS(select 1 from LOCATION_INVENTORY_ATTRIBUTES WHERE OBJECT_ID = @ObjectId)
	SELECT * FROM LOCATION_INVENTORY_ATTRIBUTES	 WHERE OBJECT_ID = @ObjectId
ELSE 
    SELECT * FROM AR_LOCATION_INVENTORY_ATTRIBUTES WHERE OBJECT_ID = @ObjectId