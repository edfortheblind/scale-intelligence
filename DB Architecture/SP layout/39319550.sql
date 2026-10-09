/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	149573		| SAM			| 12/22/14	| Created
	
	Updates the Lot status based on inventory.
	
	Parameters
		@item  item present in the inventory
		@lot   lot associagted with the item
		@company 
		@warehouse 
		@user  userstamp
*/

CREATE PROCEDURE INV_UpdateLotStatus(
	@item nvarchar(50),
	@lot nvarchar(25),
	@company nvarchar(25),
	@warehouse nvarchar(25),
	@user nvarchar(30))
AS
DECLARE @lotCount INTEGER; 
DECLARE @LOTINVENTORY TABLE ( 
								inventory_sts nvarchar(50)
							); 
DECLARE @lotStatus nvarchar(50); 
DECLARE @currentlotStatus nvarchar(50);

INSERT INTO @lotInventory 
	SELECT DISTINCT TOP 2 inventory_sts FROM location_inventory 
		WHERE  item = @item 
				AND  (company = @company OR (company IS NULL and @company IS NULL)) 
				AND  lot = @lot 
				AND  warehouse = @warehouse; 
   
SELECT @lotCount = count(*) FROM   @lotInventory; 
SET @lotStatus = null;

IF @lotCount = 1 
BEGIN 
		SELECT TOP 1 @lotStatus = inventory_sts  FROM   @lotInventory; 
END 
SELECT top 1 @currentlotStatus = inventory_sts from LOT
	WHERE  item = @item 
	AND    (company = @company OR (company IS NULL and @company IS NULL))
	AND    lot = @lot 
	AND    warehouse = @warehouse;      

if (isnull(@lotStatus, N'!') != isnull(@currentlotStatus, N'!'))
BEGIN
UPDATE lot 
	SET    inventory_sts = @lotStatus, 
			process_stamp = N'UpdateLotStatus', 
			date_time_stamp= GETUTCDATE(), 
			user_stamp = @user 
	WHERE  item = @item 
			AND    (company = @company OR (company IS NULL and @company IS NULL))
			AND    lot = @lot 
			AND    warehouse = @warehouse;      
END  
