-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */


















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
	WHERE INTERNAL_PLAN_NUM = @PlanNum AND WAREHOUSE = @Whs AND CONDITION = N'<literal:1>');

	open curDetails;
	
	-- [comment omitted]
	FETCH NEXT FROM curDetails INTO
		@Location,@Item,@Company,@ItemDesc,@Lot,@Warehouse,@ContID,@locInvAttributesId,@Quantity;
		
	-- [comment omitted]
	while (@@FETCH_STATUS = 0)
	begin
		-- [comment omitted]
		-- [comment omitted]
		if exists (SELECT N'<literal:2>' FROM CYCLE_COUNT_REQUEST
			   WHERE LOCATION = @Location AND WAREHOUSE = @Warehouse AND 
		           INTERNAL_PLAN_NUM <> @PlanNum AND CONDITION = N'<literal:3>') -- [comment omitted]
		exec @Error = CCP_CheckToUpdateCCRequest @Item, @ItemDesc, @Company, @Lot,
				   @Location, @Warehouse, @ContID, @locInvAttributesId, @Quantity ,@UserName, @CCAction output; 
		
	-- [comment omitted]
	FETCH NEXT FROM curDetails INTO
		@Location,@Item,@Company,@ItemDesc,@Lot,@Warehouse,@ContID,@locInvAttributesId,@Quantity ;
		
	end;

	-- [comment omitted]
	CLOSE curDetails;
	DEALLOCATE curDetails;
if (@@ERROR <> 0) return -1; else if (@Error <> 0) return @Error;
