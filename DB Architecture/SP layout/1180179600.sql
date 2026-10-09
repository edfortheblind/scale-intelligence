/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	14724		| MD			| 06/22/04	| Created.
	14724		| MD			| 08/20/04	| Changes across warehouse	
	17024		| SSG			| 07/27/05	| If SYSTEM_QUANTITY is null, 
								  set its value to -1 instead of 0			
	15829		| NNP			| 08/01/05	| Made SQLServer cursor Read_Only
	19165		| VK			| 08/08/06	| Licenseplate changes
	77170		| RJR			| 10/15/10	| Passed inventory attributes Id to CCP_CheckToUpdateCCRequest.
 
	Updates the existing cycle count requests based on new plan created. 
	
	Parameters
		int	iPlanNum		The CycleCountPlan to update.
		String	stUserName		The current user.
		String  warehouse		The Cycle Count Warehouse
*/

CREATE PROCEDURE CCP_UpdateCCRequest(
	@PlanNum numeric(9),
	@UserName nvarchar(30),
	@Whs nvarchar(25))
AS
	declare @CCAction int;
	declare @Company nvarchar(25);
	declare @ContID nvarchar(50);
	declare @locInvAttributesId  numeric(9);
	declare @Error int;
	declare @Item nvarchar(50);
	declare @ItemDesc nvarchar(100);
	declare @Location nvarchar(25);
	declare @Lot nvarchar(25);
	declare @Quantity numeric(19,5);
	declare @Warehouse nvarchar(25);

	
	DECLARE curDetails CURSOR  READ_ONLY FOR 
	(SELECT LOCATION, ITEM,COMPANY,ITEM_DESC,LOT,WAREHOUSE,LOGISTICS_UNIT, LOC_INV_ATTRIBUTES_ID, ISNULL(SYSTEM_QUANTITY,-1) FROM CYCLE_COUNT_REQUEST
	WHERE INTERNAL_PLAN_NUM = @PlanNum AND WAREHOUSE = @Whs AND CONDITION = N'Open');

	open curDetails;
	
	-- fetch the first record.
	FETCH NEXT FROM curDetails INTO
		@Location,@Item,@Company,@ItemDesc,@Lot,@Warehouse,@ContID,@locInvAttributesId,@Quantity;
		
	-- Loop through the records to delete the location inventory records from second.
	while (@@FETCH_STATUS = 0)
	begin
		-- if some open cycle counts exists for this location other than the current plan
		-- update the CC request.
		if exists (SELECT N'A' FROM CYCLE_COUNT_REQUEST
			   WHERE LOCATION = @Location AND WAREHOUSE = @Warehouse AND 
		           INTERNAL_PLAN_NUM <> @PlanNum AND CONDITION = N'Open') -- call update request to
		exec @Error = CCP_CheckToUpdateCCRequest @Item, @ItemDesc, @Company, @Lot,
				   @Location, @Warehouse, @ContID, @locInvAttributesId, @Quantity ,@UserName, @CCAction output; 
		
	-- fetch the next record.
	FETCH NEXT FROM curDetails INTO
		@Location,@Item,@Company,@ItemDesc,@Lot,@Warehouse,@ContID,@locInvAttributesId,@Quantity ;
		
	end;

	-- close and deallocate the cursor
	CLOSE curDetails;
	DEALLOCATE curDetails;
if (@@ERROR <> 0) return -1; else if (@Error <> 0) return @Error;
