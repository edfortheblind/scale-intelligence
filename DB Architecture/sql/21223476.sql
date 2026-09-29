-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */













CREATE PROCEDURE LBL_GS1AILabelDetail (
	-- [comment omitted]
	@INTERNAL_CONTAINER_NUM numeric(9))
AS
BEGIN
	-- [comment omitted]
	-- [comment omitted]
	SET NOCOUNT ON;
	
	declare @item nvarchar(50);
	declare @item_cross_reference nvarchar(50);
	declare @company nvarchar(25);
	declare @quantity numeric(19,5);
	declare @lot nvarchar(25);
	declare @expdate datetime;
	declare @serialnum nvarchar(50);
	declare @quantity_um nvarchar(25);
	declare @errormsg nvarchar(50);
	declare @itemerrormsg nvarchar(50);

	declare @AI_item nvarchar(10);
	declare @AI_xref nvarchar(10);
	declare @rowCount int;
	declare @prevItem nvarchar(50);
	declare @prevCompany nvarchar(25);
	declare @prevLot nvarchar(25);

	-- [comment omitted]
	select @item = ITEM, @company=COMPANY, @quantity=1, @lot=LOT, @quantity_um=CONTAINER_TYPE
	from shipping_container sc WITH (nolock)
	where 
		(sc.internal_container_num = @INTERNAL_CONTAINER_NUM and container_id is not null and item is not null);

	if (@@ROWCOUNT <> 1)
	begin
		-- [comment omitted]
		DECLARE cur CURSOR FOR 
		select sc.item, sc.company, sum(quantity), sc.lot
		from 
		   shipping_container sc WITH (nolock)
		where
		   ((sc.internal_container_num = @INTERNAL_CONTAINER_NUM and container_id is not null)
			 or sc.parent = @INTERNAL_CONTAINER_NUM 
			 or sc.parent in (
				  select
					 internal_container_num
				  from
					 shipping_Container sc1 WITH (nolock)
				  where
					 sc1.parent = @INTERNAL_CONTAINER_NUM or sc1.parent in (
						select
						   internal_container_num
						from
						   shipping_Container sc2 WITH (nolock)
						where
						   sc2.parent = @INTERNAL_CONTAINER_NUM
					 )
		   ))
		   and item is not null
		group by
			item,
			company,
			lot
		order by
			item,
			company,
			lot;

		open cur;

		if (@@CURSOR_ROWS < 1)
		begin
			SET @errormsg = N'<literal:1>'; -- [comment omitted]
			SET @item = N'<literal:2>';
			SET @itemerrormsg = N'<literal:3>'; 
			SET @company = null;
			SET @quantity = 0;
		end
		else
		begin
			FETCH NEXT FROM cur INTO @item, @company, @quantity, @lot;
			
			SET @prevItem = @item;
			SET @prevCompany = @company;
			SET @prevLot = @lot;	
			
			while (@@FETCH_STATUS = 0)
			begin
				if (@prevItem <> @item OR ISNULL(@prevCompany ,N'<literal:4>') <> ISNULL(@company,N'<literal:5>'))
				begin
				   SET @errormsg = N'<literal:6>'; -- [comment omitted]
				   SET @item = N'<literal:7>';
				   SET @itemerrormsg = N'<literal:8>'; 
				   SET @company = null;
				   SET @quantity = 0;
				   break;
				end
				else
				begin
					if (@prevLot <> @lot)
					begin
						SET @errormsg = N'<literal:9>'; -- [comment omitted]
						SET @lot = N'<literal:10>';
						break;
					end;
				end;
				SET @prevItem = @item;
				SET @prevCompany = @company;
				SET @prevLot = @lot;
		
				FETCH NEXT FROM cur INTO @item, @company, @quantity, @lot;
			end;
		end;

		-- [comment omitted]
		CLOSE cur;
		DEALLOCATE cur;

		-- [comment omitted]
		select @quantity_um = quantityUm 
		from ITMfn_RtrvUnitOfMeasure(@item,@company,null,null,null,null,null,N'<literal:11>')
		where sequence = 1;
	end;

	-- [comment omitted]
	if (@errormsg is null or (@errormsg <> N'<literal:12>' and @errormsg <> N'<literal:13>'))
	begin
		-- [comment omitted]
		select @rowCount = COUNT(ITEM), @AI_item = APP_IDENTIFIER 
		from ITEM with (nolock)
		where 
			ITEM = @item 
			and ISNULL(COMPANY,N'<literal:14>') = ISNULL(@company,N'<literal:15>') 
			and GTIN_ENABLED = N'<literal:16>'
		group by ITEM,APP_IDENTIFIER;

		if (ISNULL(@rowCount,0) <= 0)
		begin
			SET @errormsg = N'<literal:17>'; -- [comment omitted]
			SET @itemerrormsg = N'<literal:18>'; 
		end;

		-- [comment omitted]
		select @item_cross_reference=X_REF_ITEM,
				@AI_xref = APP_IDENTIFIER
		from ITEM_CROSS_REFERENCE WITH (nolock)
		where 
			ITEM = @item and ISNULL(COMPANY,N'<literal:19>') = ISNULL(@company,N'<literal:20>')  
			and QUANTITY_UM = @quantity_um;

		if (@@ROWCOUNT > 1)
		begin
			SET @errormsg = N'<literal:21>'; -- [comment omitted]
			SET @item_cross_reference = N'<literal:22>';
		end
		else
		begin
			-- [comment omitted]
			if not exists (
				select 1 from ITEM_CROSS_REFERENCE WITH (nolock)
				where 
					ITEM = @item 
					and ISNULL(COMPANY,N'<literal:23>') = ISNULL(@company,N'<literal:24>') 
					and X_REF_ITEM = @item_cross_reference 
					and GTIN_ENABLED = N'<literal:25>')
				begin
					SET @errormsg = N'<literal:26>'; -- [comment omitted]
					SET @item_cross_reference = N'<literal:27>';
				end;		
		end;	-- [comment omitted]

		-- [comment omitted]
		if (@lot is not null and (@errormsg is null or @errormsg <> N'<literal:28>'))
		begin
			select @expdate = EXPIRATION_DATE
			from Lot WITH (nolock)
			where Lot = @lot and Item = @item 
			and ISNULL(COMPANY,N'<literal:29>') = ISNULL(@company,N'<literal:30>');
		end;

		select @serialnum = sn.SERIAL_NUMBER from (
		select SERIAL_NUMBER
		from SERIAL_NUMBER
		where ship_cont_num in 
		(select internal_container_num from shipping_container WITH (nolock)
			where internal_container_num = @INTERNAL_CONTAINER_NUM 
			or parent = @INTERNAL_CONTAINER_NUM
			or parent in (
				  select internal_container_num
				  from
					 shipping_Container sc1 WITH (nolock)
				  where
					 sc1.parent = @INTERNAL_CONTAINER_NUM or sc1.parent in (
						select
						   internal_container_num
						from
						   shipping_Container sc2 WITH (nolock)
						where
						   sc2.parent = @INTERNAL_CONTAINER_NUM
					 )))
		union all
		select
			SERIAL_NUMBER
		from
			ar_serial_number
		where ship_cont_num in 
		(select internal_container_num from shipping_container WITH (nolock)
			where internal_container_num = @INTERNAL_CONTAINER_NUM 
			or parent = @INTERNAL_CONTAINER_NUM
			or parent in (
				  select internal_container_num
				  from
					 shipping_Container sc1 WITH (nolock)
				  where
					 sc1.parent = @INTERNAL_CONTAINER_NUM or sc1.parent in (
						select
						   internal_container_num
						from
						   shipping_Container sc2 WITH (nolock)
						where
						   sc2.parent = @INTERNAL_CONTAINER_NUM
					 )))) as sn;
			
		if (@@ROWCOUNT > 1)
		begin
			SET @errormsg = N'<literal:31>'; -- [comment omitted]
			SET @serialnum = N'<literal:32>'; 
		end;
	end;

	 if @expdate=N'<literal:33>'  
        set @expdate=null 

	select 
		ISNULL(@itemerrormsg, @item) as ITEM,
		ISNULL(@item_cross_reference, @item) as ITEM_CROSS_REFERENCE,
		ISNULL(@quantity,0) as QUANTITY,
		ISNULL(@lot, N'<literal:34>') as LOT,
		@expdate as EXPIRATION_DATE,
		ISNULL(@serialnum, N'<literal:35>') as SERIAL_NUMBER,
		@AI_item as AI_ITEM,
		@AI_xref as AI_XREF,
		(case when substring(@item_cross_reference,1,1) = N'<literal:36>' then N'<literal:37>' else N'<literal:38>' end) as AI_QTY,
		N'<literal:39>' as AI_LOT,
		(case when @expdate is null then null else N'<literal:40>' end ) as AI_EXP,
		N'<literal:41>' as AI_SN,
		N'<literal:42>' as AI_LP;	
		
END -- [comment omitted]