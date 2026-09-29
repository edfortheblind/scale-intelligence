-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE wm_RLocationInventoryAttributes04
	@ObjectId numeric(9)
AS
 IF EXISTS(select 1 from LOCATION_INVENTORY_ATTRIBUTES WHERE OBJECT_ID = @ObjectId)
	SELECT * FROM LOCATION_INVENTORY_ATTRIBUTES	 WHERE OBJECT_ID = @ObjectId
ELSE 
    SELECT * FROM AR_LOCATION_INVENTORY_ATTRIBUTES WHERE OBJECT_ID = @ObjectId