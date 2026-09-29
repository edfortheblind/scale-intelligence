-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





	


CREATE PROCEDURE INV_LaunchCancelWithReplenish(
	@LaunchNum numeric(9))
AS
	-- [comment omitted]
	declare @LaunchItem nvarchar(50);
	declare @LaunchLocation nvarchar(25);
	declare @MinInternalLocInv numeric(9);
	declare @LaunchWarehouse nvarchar(25);
		
	-- [comment omitted]
	DECLARE curDetails CURSOR READ_ONLY FOR
		(SELECT LI.LOCATION,LI.ITEM,LI.WAREHOUSE From LOCATION_INVENTORY LI,
		REPLENISHMENT_REQUEST RR Where RR.LAUNCH_NUM = @LaunchNum AND 
		RR.TO_WHS = LI.WAREHOUSE AND RR.TO_LOC
		 = LI.LOCATION AND RR.ITEM = LI.ITEM 
		AND LI.PERMANENT = N'<literal:1>' 
		AND ((RR.LOT is null  AND LI.LOT is null ) OR (RR.LOT = LI.LOT)) 
		AND ((RR.COMPANY is null  AND LI.COMPANY is null ) OR (RR.COMPANY = LI.COMPANY)) 		
		AND ((RR.TO_LOC_INV_ATTRIBUTES_ID is null  AND LI.LOC_INV_ATTRIBUTES_ID is null ) OR (RR.TO_LOC_INV_ATTRIBUTES_ID = LI.LOC_INV_ATTRIBUTES_ID)) 
		GROUP BY LI.LOCATION,LI.ITEM,LI.WAREHOUSE);
		 
	open curDetails;
	
	-- [comment omitted]
	FETCH NEXT FROM curDetails INTO
		@LaunchLocation,@LaunchItem,@LaunchWarehouse ;
		
	-- [comment omitted]
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
			PROCESS_STAMP = N'<literal:2>',
			DATE_TIME_STAMP = GETUTCDATE()
		 WHERE IN_TRANSIT_QTY = 0 AND ALLOCATED_QTY = 0
			AND SUSPENSE_QTY = 0 AND ON_HAND_QTY = 0 AND INTERNAL_LOCATION_INV = @MinInternalLocInv;

		-- [comment omitted]
		FETCH NEXT FROM curDetails INTO
			@LaunchLocation,@LaunchItem,@LaunchWarehouse ;

	end -- [comment omitted]
	
	-- [comment omitted]
	CLOSE curDetails;
	DEALLOCATE curDetails;

	if (@@ERROR <> 0) return -1;
-- [comment omitted]
