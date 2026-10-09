/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	14714		| MD		| 06/20/04	| Created.
	15829		| NNP		| 08/01/05	| Made SQLServer cursor Read_Only
	71476       | DSK       | 07/14/10  | Added support for Location Inventory attributes for cancel wave with replenishment
*/	


CREATE PROCEDURE INV_LaunchCancelWithReplenish(
	@LaunchNum numeric(9))
AS
	-- local variables
	declare @LaunchItem nvarchar(50);
	declare @LaunchLocation nvarchar(25);
	declare @MinInternalLocInv numeric(9);
	declare @LaunchWarehouse nvarchar(25);
		
	-- retrieve internal location inventory number for the replenishment requests
	DECLARE curDetails CURSOR READ_ONLY FOR
		(SELECT LI.LOCATION,LI.ITEM,LI.WAREHOUSE From LOCATION_INVENTORY LI,
		REPLENISHMENT_REQUEST RR Where RR.LAUNCH_NUM = @LaunchNum AND 
		RR.TO_WHS = LI.WAREHOUSE AND RR.TO_LOC
		 = LI.LOCATION AND RR.ITEM = LI.ITEM 
		AND LI.PERMANENT = N'Y' 
		AND ((RR.LOT is null  AND LI.LOT is null ) OR (RR.LOT = LI.LOT)) 
		AND ((RR.COMPANY is null  AND LI.COMPANY is null ) OR (RR.COMPANY = LI.COMPANY)) 		
		AND ((RR.TO_LOC_INV_ATTRIBUTES_ID is null  AND LI.LOC_INV_ATTRIBUTES_ID is null ) OR (RR.TO_LOC_INV_ATTRIBUTES_ID = LI.LOC_INV_ATTRIBUTES_ID)) 
		GROUP BY LI.LOCATION,LI.ITEM,LI.WAREHOUSE);
		 
	open curDetails;
	
	-- fetch the first record.
	FETCH NEXT FROM curDetails INTO
		@LaunchLocation,@LaunchItem,@LaunchWarehouse ;
		
	-- Loop through the records to delete the location inventory records from second.
	while (@@FETCH_STATUS = 0)
	begin
		
		SELECT @MinInternalLocInv = ISNULL(MIN(INTERNAL_LOCATION_INV),0)
		FROM LOCATION_INVENTORY WHERE LOCATION = @LaunchLocation AND 
		ITEM = @LaunchItem AND WAREHOUSE = @LaunchWarehouse;
		
		DELETE FROM LOCATION_INVENTORY WHERE IN_TRANSIT_QTY = 0 AND ALLOCATED_QTY = 0
		AND SUSPENSE_QTY = 0 AND ON_HAND_QTY = 0 AND INTERNAL_LOCATION_INV IN 
		(SELECT INTERNAL_LOCATION_INV FROM LOCATION_INVENTORY WHERE LOCATION = @LaunchLocation AND 
		ITEM = @LaunchItem AND WAREHOUSE = @LaunchWarehouse AND INTERNAL_LOCATION_INV <> @MinInternalLocInv)
	
		
		UPDATE  LOCATION_INVENTORY 
		SET	LOT = null,
			LOC_INV_ATTRIBUTES_ID = null,
			PROCESS_STAMP = N'INV_LaunchCancelWithReplenish',
			DATE_TIME_STAMP = GETUTCDATE()
		 WHERE IN_TRANSIT_QTY = 0 AND ALLOCATED_QTY = 0
			AND SUSPENSE_QTY = 0 AND ON_HAND_QTY = 0 AND INTERNAL_LOCATION_INV = @MinInternalLocInv;

		-- fetch the next record since we want to skip the first record.
		FETCH NEXT FROM curDetails INTO
			@LaunchLocation,@LaunchItem,@LaunchWarehouse ;

	end -- end while 
	
	-- close and deallocate the cursor
	CLOSE curDetails;
	DEALLOCATE curDetails;

	if (@@ERROR <> 0) return -1;
-- end 
