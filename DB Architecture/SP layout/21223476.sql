/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	19023	| SP	| 06/16/06	| Created.
	93647   | MHM   | 01/13/12  | Assigning expiration date to null if expiration date is 12/31/4712 and 
                                  AI_EXP to null if expiration date is null else (17).
	143639  | AA    | 06/11/14  | Removed Serial_Number_View

	Parameters:
		INTERNAL_CONTAINER_NUM  The internal container number.
	Returns:
		Rowset used for the details of GS1-AI label. 
*/

CREATE PROCEDURE LBL_GS1AILabelDetail (
	-- Add the parameters for the stored procedure here
	@INTERNAL_CONTAINER_NUM numeric(9))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
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

	--check if "full case" 
	select @item = ITEM, @company=COMPANY, @quantity=1, @lot=LOT, @quantity_um=CONTAINER_TYPE
	from shipping_container sc WITH (nolock)
	where 
		(sc.internal_container_num = @INTERNAL_CONTAINER_NUM and container_id is not null and item is not null);

	if (@@ROWCOUNT <> 1)
	begin
		--this is a loose container (possibly nested) scenario
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
			SET @errormsg = N'MSG_GS1LBL01'; --Error - Invalid Item
			SET @item = N'MSG_GS1LBL01';
			SET @itemerrormsg = N'MSG_GS1LBL01'; 
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
				if (@prevItem <> @item OR ISNULL(@prevCompany ,N'!') <> ISNULL(@company,N'!'))
				begin
				   SET @errormsg = N'MSG_GS1LBL02'; --Error - More than 1 Item
				   SET @item = N'MSG_GS1LBL02';
				   SET @itemerrormsg = N'MSG_GS1LBL02'; 
				   SET @company = null;
				   SET @quantity = 0;
				   break;
				end
				else
				begin
					if (@prevLot <> @lot)
					begin
						SET @errormsg = N'MSG_GS1LBL04'; --Error - More than 1 lot
						SET @lot = N'MSG_GS1LBL04';
						break;
					end;
				end;
				SET @prevItem = @item;
				SET @prevCompany = @company;
				SET @prevLot = @lot;
		
				FETCH NEXT FROM cur INTO @item, @company, @quantity, @lot;
			end;
		end;

		-- close and deallocate the cursor
		CLOSE cur;
		DEALLOCATE cur;

		--fetch the base unit of measure for this item
		select @quantity_um = quantityUm 
		from ITMfn_RtrvUnitOfMeasure(@item,@company,null,null,null,null,null,N'N')
		where sequence = 1;
	end;

	--proceed with other validations if its not an item related error
	if (@errormsg is null or (@errormsg <> N'MSG_GS1LBL01' and @errormsg <> N'MSG_GS1LBL02'))
	begin
		--if the item is not GTIN enabled return an error
		select @rowCount = COUNT(ITEM), @AI_item = APP_IDENTIFIER 
		from ITEM with (nolock)
		where 
			ITEM = @item 
			and ISNULL(COMPANY,N'!') = ISNULL(@company,N'!') 
			and GTIN_ENABLED = N'Y'
		group by ITEM,APP_IDENTIFIER;

		if (ISNULL(@rowCount,0) <= 0)
		begin
			SET @errormsg = N'MSG_GS1LBL01'; --Error - Item not in GTIN format
			SET @itemerrormsg = N'MSG_GS1LBL01'; 
		end;

		-- Handle Cross Reference 
		select @item_cross_reference=X_REF_ITEM,
				@AI_xref = APP_IDENTIFIER
		from ITEM_CROSS_REFERENCE WITH (nolock)
		where 
			ITEM = @item and ISNULL(COMPANY,N'!') = ISNULL(@company,N'!')  
			and QUANTITY_UM = @quantity_um;

		if (@@ROWCOUNT > 1)
		begin
			SET @errormsg = N'MSG_GS1LBL05'; --Multiple cross reference exists for item
			SET @item_cross_reference = N'MSG_GS1LBL05';
		end
		else
		begin
			--if the item cross reference is not GTIN enabled return an error
			if not exists (
				select 1 from ITEM_CROSS_REFERENCE WITH (nolock)
				where 
					ITEM = @item 
					and ISNULL(COMPANY,N'!') = ISNULL(@company,N'!') 
					and X_REF_ITEM = @item_cross_reference 
					and GTIN_ENABLED = N'Y')
				begin
					SET @errormsg = N'MSG_GS1LBL05'; --Error - Item cross ref not in GTIN format
					SET @item_cross_reference = N'MSG_GS1LBL05';
				end;		
		end;	-- Cross Reference handling end

		--Query the Lot table only if Lot exists, and multiple Lots not present
		if (@lot is not null and (@errormsg is null or @errormsg <> N'MSG_GS1LBL04'))
		begin
			select @expdate = EXPIRATION_DATE
			from Lot WITH (nolock)
			where Lot = @lot and Item = @item 
			and ISNULL(COMPANY,N'!') = ISNULL(@company,N'!');
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
			SET @errormsg = N'MSG_GS1LBL03'; --Error - More than 1 Serial number
			SET @serialnum = N'MSG_GS1LBL03'; 
		end;
	end;

	 if @expdate=N'12/31/4712'  
        set @expdate=null 

	select 
		ISNULL(@itemerrormsg, @item) as ITEM,
		ISNULL(@item_cross_reference, @item) as ITEM_CROSS_REFERENCE,
		ISNULL(@quantity,0) as QUANTITY,
		ISNULL(@lot, N'MSG_GS1LBL06') as LOT,
		@expdate as EXPIRATION_DATE,
		ISNULL(@serialnum, N'MSG_GS1LBL03') as SERIAL_NUMBER,
		@AI_item as AI_ITEM,
		@AI_xref as AI_XREF,
		(case when substring(@item_cross_reference,1,1) = N'9' then N'30' else N'37' end) as AI_QTY,
		N'10' as AI_LOT,
		(case when @expdate is null then null else N'(17)' end ) as AI_EXP,
		N'21' as AI_SN,
		N'00' as AI_LP;	
		
END --LBL_GS1AILabelDetail