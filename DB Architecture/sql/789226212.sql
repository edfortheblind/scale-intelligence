-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */




		

CREATE PROCEDURE MetaTrans_GetLotUpdateAffectedInventory
(
@item nvarchar(50) = null,
@company nvarchar(25) = null,
@lot nvarchar(25) = null,
@warehouse nvarchar(25) = null,
@affectedLocation nvarchar(25) = null,
@culture nvarchar(10)
)
AS
	SET NOCOUNT ON;

	IF(@affectedLocation IS NULL OR @affectedLocation=N'<literal:1>')
		BEGIN
			SELECT LI.LOCATION AS Location,
			LI.INVENTORY_STS AS InventoryStatus,
			LI.ON_HAND_QTY AS OnHandQty,
			LI.ALLOCATED_QTY AS AllocatedQty,
			LI.IN_TRANSIT_QTY AS IntransitQty,
			LI.QUANTITY_UM AS UM
			FROM LOCATION_INVENTORY LI WHERE 
			LI.ITEM = @item 
			AND ((LI.COMPANY IS NULL AND @company IS NULL) OR LI.COMPANY = @company)
			AND ((LI.LOT IS NULL AND @lot IS NULL) OR LI.LOT = @lot)
			AND LI.WAREHOUSE = @warehouse
		END
	ELSE
		BEGIN
			SELECT LI.LOCATION AS Location,
			LI.INVENTORY_STS AS InventoryStatus,
			LI.ON_HAND_QTY AS OnHandQty,
			LI.ALLOCATED_QTY AS AllocatedQty,
			LI.IN_TRANSIT_QTY AS IntransitQty,
			LI.QUANTITY_UM AS UM
			FROM LOCATION_INVENTORY LI WHERE 
			LI.ITEM = @item 
			AND ((LI.COMPANY IS NULL AND @company IS NULL) OR LI.COMPANY = @company)
			AND ((LI.LOT IS NULL AND @lot IS NULL) OR LI.LOT = @lot)
			AND LI.LOCATION = @affectedLocation
			AND LI.WAREHOUSE = @warehouse
		END

	