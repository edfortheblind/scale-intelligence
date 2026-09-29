-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */
















-- [comment omitted]


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
	
	-- [comment omitted]
	-- [comment omitted]
	-- [comment omitted]
	select
		@lotId = object_id
	from
		lot
	where
		lot = @lot
		and
		item = @item
		and 
		(COMPANY IS NULL OR (ISNULL(COMPANY,N'<literal:1>') = ISNULL(@company,N'<literal:2>')))
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
				(li.COMPANY IS NULL OR (ISNULL(li.COMPANY,N'<literal:3>') = ISNULL(@company,N'<literal:4>')))
			and
				li.warehouse = @warehouse 
			and
				l.location_class != N'<literal:5>'  -- [comment omitted]
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

		-- [comment omitted]
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
			N'<literal:6>',
			DATE_TIME_STAMP  
		from lot 
		where object_id=@lotId
		
        -- [comment omitted]
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
			N'<literal:7>',
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
-- [comment omitted]

