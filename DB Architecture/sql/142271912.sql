-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
CREATE PROCEDURE TranHist_RepDeallocation(
@internalLocInvNum numeric(9),
@userStamp nvarchar(30),
@replenishedQuantity numeric(19,5),
@beforeOnHandQty numeric(19,5),
@beforeAllocatedQty numeric(19,5),
@beforeInTransitQty numeric(19,5),
@beforeSuspenseQty numeric(19,5),
@direction nvarchar(25))
AS
BEGIN

	declare @error int;
	declare @warehouse nvarchar(25); 
	declare @company nvarchar(25); 
	declare @item nvarchar(50);
	declare @location nvarchar(25);
	declare @lot nvarchar(25);
	declare @expirationDate datetime;
	declare @quantityUM nvarchar(25);
	declare @afterOnHandQty numeric(19,5);
	declare @afterAllocQty numeric(19,5);
	declare @afterInTransitQty numeric(19,5);
	declare @afterSuspenseQty numeric(19,5);
	declare @logisticsUnit nvarchar(50);
	declare @locInvAttributesId numeric(9);
	declare @invStatus nvarchar(50);
	declare	@userDef1 nvarchar(25);
	declare	@userDef2 nvarchar(25);
	declare	@userDef3 nvarchar(25);
	declare	@userDef4 nvarchar(25);
	declare	@userDef5 nvarchar(25);
	declare	@userDef6 nvarchar(25);
	declare	@userDef7 numeric(19,5);
	declare	@userDef8 numeric(19,5);

	select @warehouse=LI.Warehouse,
		   @company=LI.Company,
		   @item=LI.Item,
		   @location=LI.Location,
		   @lot=LI.Lot,
		   @expirationDate=LI.EXPIRATION_DATE,
		   @quantityUM=LI.Quantity_Um,
		   @afterOnHandQty=LI.On_Hand_Qty,
		   @afterAllocQty=LI.Allocated_Qty,
		   @afterInTransitQty=LI.In_Transit_Qty,
		   @afterSuspenseQty=LI.Suspense_Qty,
		   @logisticsUnit=LI.LOGISTICS_UNIT,
		   @invStatus=LI.INVENTORY_STS,
		   @userDef1=LI.USER_DEF1,
		   @userDef2=LI.USER_DEF2,
		   @userDef3=LI.USER_DEF3,
		   @userDef4=LI.USER_DEF4,
		   @userDef5=LI.USER_DEF5,
		   @userDef6=LI.USER_DEF6,
		   @userDef7=LI.USER_DEF7,
		   @userDef8=LI.USER_DEF8		  
	from Location_Inventory LI
	where
	LI.INTERNAL_LOCATION_INV=@internalLocInvNum;

	exec @error = HIST_SaveTransHist
			@afterAllocQty,@afterInTransitQty,@afterOnHandQty,@invStatus, @afterSuspenseQty,
			@beforeAllocatedQty, @beforeInTransitQty,@beforeOnHandQty,@invStatus,@beforeSuspenseQty,
			@company,@logisticsUnit,@direction,null,null,@item,@location,@lot,N'<literal:1>',@replenishedQuantity,
			@quantityUM,null,null,null,null,null,N'<literal:2>',@userDef1,@userDef2,@userDef3,@userDef4,@userDef5,@userDef6,@userDef7,@userDef8,
			@userStamp,@warehouse,null,null,null,null,null,@expirationDate,@expirationDate,@locInvAttributesId,null,null;

	if (@@ERROR <> 0) return -1; else if (@error <> 0) return @error;
END