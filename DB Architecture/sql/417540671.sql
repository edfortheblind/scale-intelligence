-- DOCUMENTATION ONLY: literals/comments removed; do not execute.


/* [comment omitted] */










-- [comment omitted]
CREATE procedure [dbo].[LOAD_ILA] (@stWarehouse nvarchar(25))
as
begin

	SET NOCOUNT ON 

	print N'<literal:1>' + @stWarehouse;

	declare @iCurrentRecord int;
	declare @iInventoryRecordsLoaded int;
	declare @iInventoryRecordsError int;
	declare @iError int;

	-- [comment omitted]

	Declare @stITEM nvarchar(50)  ;
	Declare @stCOMPANY nvarchar(25) ;
	Declare @stQUANTITY_UM nvarchar(25) ;
	Declare @stALLOCATION_LOC  nvarchar(25)  ;
	Declare @stUSER_DEF1  nvarchar(25) ;
	Declare @stUSER_DEF2  nvarchar(25) ;
	Declare @stUSER_DEF3  nvarchar(25) ;
	Declare @stUSER_DEF4  nvarchar(25) ;
	Declare @stUSER_DEF5  nvarchar(25) ;
	Declare @stUSER_DEF6  nvarchar(25) ;
	Declare @stUSER_DEF7  numeric(19, 5) ;
	Declare @stUSER_DEF8  numeric(19, 5) ;
	Declare @stUSER_STAMP  nvarchar(30) ;
	Declare @stPROCESS_STAMP  nvarchar(100) ;
	Declare @stDATE_TIME_STAMP  datetime  ;
	declare @stobject_id numeric (9,0);


	set @iInventoryRecordsLoaded = 0;
	set @iInventoryRecordsError = 0;
	set @iCurrentRecord = 0;		

	
	declare loadILA  cursor for
	select [warehouse],[ITEM],[COMPANY],[QUANTITY_UM],[ALLOCATION_LOC],[USER_DEF1],[USER_DEF2],[USER_DEF3],[USER_DEF4],[USER_DEF5],[USER_DEF6],[USER_DEF7],[USER_DEF8],
           '<literal:2>','<literal:3>'+cast(convert(date,getdate()) as nvarchar),getdate(),[INTERNAL_ITEM_LOC_NUM]
	from Staging_ILA 
	Where user_stamp != N'<literal:4>'
	and PROCESSED != N'<literal:5>'
	order by Allocation_loc desc
	;

	
	open loadILA;

	fetch next from loadILA
	into @stwarehouse,@stITEM,@stCOMPANY,@stQUANTITY_UM,@stALLOCATION_LOC,@stUSER_DEF1,@stUSER_DEF2,@stUSER_DEF3,@stUSER_DEF4,@stUSER_DEF5,@stUSER_DEF6,@stUSER_DEF7,@stUSER_DEF8,
			@stUSER_STAMP,@stPROCESS_STAMP,@stDATE_TIME_STAMP, @stobject_id
	

	while @@FETCH_STATUS = 0
	begin 
		begin transaction;
		
	INSERT  INTO ITEM_LOCATION_Assignment
	           ([warehouse],[ITEM],[COMPANY],[QUANTITY_UM],[ALLOCATION_LOC],[USER_DEF1],[USER_DEF2],[USER_DEF3],[USER_DEF4],[USER_DEF5],[USER_DEF6],[USER_DEF7],[USER_DEF8],
           USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP)

	values
	(@stwarehouse,@stITEM,@stCOMPANY,@stQUANTITY_UM,@stALLOCATION_LOC,@stUSER_DEF1,@stUSER_DEF2,@stUSER_DEF3,@stUSER_DEF4,@stUSER_DEF5,@stUSER_DEF6,@stUSER_DEF7,@stUSER_DEF8,
			@stUSER_STAMP,@stPROCESS_STAMP,@stDATE_TIME_STAMP
	)

	set @iError = @@ERROR;

	if(@ierror = 0)
	begin 
		commit;

	
		-- [comment omitted]
		if not exists( select '<literal:6>' 
						from LOCATION_INVENTORY 
						where location = @stALLOCATION_LOC 
						and item = @stITEM 
						and isnull(company,'<literal:7>') = isnull(@stcompany,'<literal:8>')
						and warehouse = @stWarehouse)
			begin
				insert into LOCATION_INVENTORY
				(ITEM, COMPANY, PERMANENT,LOT, ON_HAND_QTY, IN_TRANSIT_QTY, ALLOCATED_QTY, SUSPENSE_QTY, 
				QUANTITY_UM
				, INVENTORY_STS, USER_STAMP, PROCESS_STAMP, DATE_TIME_STAMP, warehouse, LOCATION )
				values
				(@stITEM,	@stCOMPANY, '<literal:9>' ,null ,	0.00 ,	0.00 , 	0.00 ,	0.00 ,	

				(SELECT UNIT_OF_MEASURE 
				FROM STORAGE_TEMPLATE_DETAIL std1 
				WHERE SEQUENCE = (SELECT MIN(SEQUENCE) 
								  FROM STORAGE_TEMPLATE_DETAIL std2 
								  WHERE std1.STORAGE_TEMPLATE = std2.STORAGE_TEMPLATE) 
				AND STORAGE_TEMPLATE = (SELECT STORAGE_TEMPLATE 
										FROM ITEM 
										WHERE ITEM =  @stITEM 
										AND isnull(company,'<literal:10>') = isnull(@stcompany,'<literal:11>')))

				, '<literal:12>' ,@stUSER_STAMP,	@stPROCESS_STAMP,	@stDATE_TIME_STAMP, @stWarehouse,@stALLOCATION_LOC)
					
				-- [comment omitted]
				update  li
				set li.TEMPLATE_FIELD1 = a.template_field1,
				li.TEMPLATE_FIELD2 = a.template_field2, 
				li.TEMPLATE_FIELD3 = a.template_field3,
				li.TEMPLATE_FIELD4 = a.template_field4,
				li.TEMPLATE_FIELD5 = a.template_field5,
				li.LOCATION_TEMPLATE = a.location_template
				from LOCATION_INVENTORY li
				inner join	(select	LOCATION,	WAREHOUSE,	LOCATION_TEMPLATE,	template_field1,	template_field2,	template_field3,	template_field4,	template_field5	from LOCATION) a
				on li.LOCATION = a.LOCATION 
				and li.warehouse = a.warehouse
				inner join STAGING_ILA ila
				on li.ITEM = ila.ITEM
				and isnull(li.COMPANY,'<literal:13>') = isnull(ila.COMPANY,'<literal:14>')
				and li.LOCATION = ila.ALLOCATION_LOC
				and li.Warehouse = ila.Warehouse
				where ila.INTERNAL_ITEM_LOC_NUM = @stobject_id;


				-- [comment omitted]
				update li
				set 
					li.ITEM_DESC = a.description,
					li.ITEM_COLOR = a.item_color,
					li.ITEM_SIZE = a.item_size,
					li.ITEM_STYLE = a.item_style
				from location_inventory li
				inner join (select	item,COMPANY,ITEM_COLOR,ITEM_SIZE,ITEM_STYLE,DESCRIPTION from item) a
				on li.item = a.ITEM
				and isnull(li.COMPANY,'<literal:15>') = isnull(a.COMPANY,'<literal:16>')
				inner join STAGING_ILA ila
				on li.ITEM = ila.ITEM
				and isnull(li.COMPANY,'<literal:17>') = isnull(ila.COMPANY,'<literal:18>')
				and li.LOCATION = ila.ALLOCATION_LOC
				and li.Warehouse = ila.Warehouse
				where ila.INTERNAL_ITEM_LOC_NUM = @stobject_id;
			end

		if exists (select '<literal:19>' 
					from LOCATION_INVENTORY 
					where location = @stALLOCATION_LOC 
					and item = @stITEM 
					and isnull(company,'<literal:20>') = isnull(@stcompany,'<literal:21>')
					and warehouse = @stWarehouse)

			begin
				-- [comment omitted]
				update li
				set PERMANENT = '<literal:22>'
				from LOCATION_INVENTORY li
				where location = @stALLOCATION_LOC
				and warehouse = @stWarehouse
				and item = @stITEM
				and isnull(company,'<literal:23>') = isnull(@stcompany,'<literal:24>')	
			end
				

	-- [comment omitted]
		update Staging_ILA
		set Processed = N'<literal:25>'
		where INTERNAL_ITEM_LOC_NUM = @stobject_id;
	set @iInventoryRecordsLoaded = @iInventoryRecordsLoaded + 1;


	end



	else
	begin
		rollback;

		update Staging_ILA
		set USER_STAMP = N'<literal:26>'
		where INTERNAL_ITEM_LOC_NUM = @STOBJECT_ID;
	
	set @iInventoryRecordsError = @iInventoryRecordsError + 1;

	end
	
	set @iCurrentRecord = @iCurrentRecord + 1;



	fetch next from loadILA into @stwarehouse,@stITEM,@stCOMPANY,@stQUANTITY_UM,@stALLOCATION_LOC,@stUSER_DEF1,@stUSER_DEF2,@stUSER_DEF3,@stUSER_DEF4,@stUSER_DEF5,@stUSER_DEF6,@stUSER_DEF7,@stUSER_DEF8,
			@stUSER_STAMP,@stPROCESS_STAMP,@stDATE_TIME_STAMP, @stobject_id

	end

	print cast(@iInventoryRecordsLoaded as nvarchar(25)) + N'<literal:27>';
	-- [comment omitted]
	-- [comment omitted]
	raiserror(N'<literal:28>', 10, 1, @iInventoryRecordsError);
	
	close loadILA;
	deallocate loadILA;


end


