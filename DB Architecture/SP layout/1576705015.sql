/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	12985		| VK			| 09/15/05	| Created
	19141		| VK			| 07/24/06	| License plate changes
	
	Updates the Total weight and Total Volume on Location Inventory .
	
	Parameters
		@internalLocationInv - internal location inv number of location inventory record
		@stUseOverride - use overrides or not
		@stUserName - user stamp
*/


CREATE PROCEDURE INV_UpdateTotalsonLocInv(
	@internalLocationInv numeric(9),
	@stUseOverride nchar(1),
	@stUserName nvarchar(30))
AS
	-- local variables 
	declare @dNewVolumePerItem numeric(28,5);
	declare @dNewWeightPerItem numeric(28,5);
	declare @stQuantityUm nvarchar(25);
	declare @stItem nvarchar(50);
	declare @stCompany nvarchar(25);
	
	--retrieve quantity um of location inventory that need to be updated
	select distinct @stItem = item, 
					@stCompany = company, 
					@stQuantityUm = quantity_um 
	from location_inventory
	where internal_location_inv = @internalLocationInv;

	if(@stUseOverride = N'Y')
	begin
	select @dNewWeightPerItem = location_unit_of_measure.weight, 
	       @dNewVolumePerItem = (location_unit_of_measure.length *  location_unit_of_measure.width * 
				location_unit_of_measure.height) 
		from location_unit_of_measure
		where location_unit_of_measure.internal_location_inv = @internalLocationInv
			  and quantity_um = @stQuantityUm;
	end
	else  --use Item UMs
	begin
		SELECT @dNewVolumePerItem = volumePerItem,  @dNewWeightPerItem = weightPerItem
		  FROM dbo.INVfn_RtrvItemInfo(@stItem, @stCompany, @stQuantityUm, null, null, null);
	end

	update location_inventory
	set TOTAL_VOLUME = @dNewVolumePerItem * On_Hand_Qty ,
	   TOTAL_WEIGHT = @dNewWeightPerItem * On_Hand_Qty,
	user_stamp = @stUserName,
	date_time_stamp = GETUTCDATE(),
	process_Stamp = N'INV_UpdateTotalsonLocInv'
	where internal_location_inv = @internalLocationInv;
-- end INV_UpdateTotalsonLocInv


