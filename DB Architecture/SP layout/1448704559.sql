/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	16413           | KSP           | 08/30/05      | Created
	 2392           | YHR           | 06/12/07      | modified to archive lots before deleting
	24198			| KRG			| 04/15/08		| Prevented deletion of LOT record when same LOT 
													| exists in the same location in a different LP.
	34158			| BB			| 8/29/08		| Last change for license plate checking modified
													| to consider null value.
	69969			| DRK			| 07/09/10		| Fixed the check for lot items

	Deletes lot based on supplied information.
	
	Parameters
		lot,item,company,warehouse
*/

-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;


CREATE PROCEDURE INV_ProcessLotWhenEmptyingInv(
	@loc		nvarchar(25),
	@lot		nvarchar(25),
	@item		nvarchar(50),
	@company	nvarchar(25),
    @warehouse	nvarchar(25),
    @logisticsUnit	nvarchar(50) = NULL)		

AS
	SET NOCOUNT ON;

	declare @lotId numeric(9);
	
	-- get the lot objectId.  Note that we will not delete
	-- the lot if there exists other inventory for this lot.
	-- Exclude PRE-REC locations from the check as they are temporary locations.
	select
		@lotId = object_id
	from
		lot
	where
		lot = @lot
		and
		item = @item
		and 
		(COMPANY IS NULL OR (ISNULL(COMPANY,N'!') = ISNULL(@company,N'!')))
		and 
		warehouse = @warehouse
		and
		not exists (
			select
				*
			from
				location_inventory li
			inner join location l on li.location = l.location and li.warehouse = l.warehouse
			where
				li.lot = @lot 
			and
				li.item = @item
			and 
				(li.COMPANY IS NULL OR (ISNULL(li.COMPANY,N'!') = ISNULL(@company,N'!')))
			and
				li.warehouse = @warehouse 
			and
				l.location_class != N'Receiving Pre-Check In'  -- Exclude PRE-REC locations
			and
			(
				li.location <> @loc
				or 	
				(
					@logisticsUnit <> li.LOGISTICS_UNIT 
					or (@logisticsUnit is null and  li.LOGISTICS_UNIT is not null)
				)
			));

	if (@lotId is not null)
		begin

		-- Insert lot to be deleted into archive table for lots
		insert into ar_lot 
		(OBJECT_ID,
		LOT_TEMPLATE,
		INVENTORY_STS,
		LOT,
		ITEM,
		COMPANY,
		WAREHOUSE,
		EXPIRATION_DATE,
		FROZEN,
		USER_DEF1,
		USER_DEF2,
		USER_DEF3,
		USER_DEF4,
		USER_DEF5,
		USER_DEF6,
		USER_DEF7,
		USER_DEF8,
		USER_STAMP,
		PROCESS_STAMP,
		DATE_TIME_STAMP)   
		select
			OBJECT_ID, 
			LOT_TEMPLATE,
			INVENTORY_STS,
			LOT,
			ITEM,
			COMPANY,
			WAREHOUSE,
			EXPIRATION_DATE,
			FROZEN,
			USER_DEF1,
			USER_DEF2,
			USER_DEF3,
			USER_DEF4,
			USER_DEF5,
			USER_DEF6,
			USER_DEF7,
			USER_DEF8,
			USER_STAMP,
			N'INV_ProcessLotWhenEmptyingInv',
			DATE_TIME_STAMP  
		from lot 
		where object_id=@lotId
		
        -- Insert lot attribute to be deleted into archive table for lot attributes
		insert into ar_lot_attribute
		(   OBJECT_ID,
			LOT_ID,
			ATTRIBUTE_TEMPLATE_ID,
			VALUE,
			USER_DEF1,
			USER_DEF2,
			USER_DEF3,
			USER_DEF4,
			USER_DEF5,
			USER_DEF6,
			USER_DEF7,
			USER_DEF8,
			USER_STAMP,
			PROCESS_STAMP,
			DATE_TIME_STAMP
		)
		select
			OBJECT_ID,
			LOT_ID,
			ATTRIBUTE_TEMPLATE_ID,
			VALUE,
			USER_DEF1,
			USER_DEF2,
			USER_DEF3,
			USER_DEF4,
			USER_DEF5,
			USER_DEF6,
			USER_DEF7,
			USER_DEF8,
			USER_STAMP,
			N'INV_ProcessLotWhenEmptyingInv',
			DATE_TIME_STAMP  
		from
			lot_attribute
		where
			lot_id = @lotId;

		if (@@ERROR <> 0) return -1;

		delete from lot_attribute where lot_id = @lotId;
		if (@@ERROR <> 0) return -1;

		delete from lot where object_id = @lotId;
		if (@@ERROR <> 0) return -1;
		
	end;
-- end INV_ProcessLotWhenEmptyingInv

