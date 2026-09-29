-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */










CREATE PROCEDURE [dbo].[LOAD_INVENTORY] (@stWarehouse nvarchar(25), @stAdjustmentType nvarchar(25))
as
begin

	SET NOCOUNT ON 

	declare @iCurrentRecord int;
	declare @iInventoryRecordsLoaded int;
	declare @iInventoryRecordsError int;
	declare @iError int;
	declare @iRecordsAffected int;
	declare @iPalInsert int;
	declare @iPalIneligble int;

	-- [comment omitted]
	declare @stItem nvarchar(50);
	declare @stCompany nvarchar(25);
	declare @stLocation nvarchar(25);
	declare @dQuantity numeric(19,5);
	declare @stQtyUm nvarchar(25);
	declare @stInvSts nvarchar(50);
	declare @stLot nvarchar(25);
	declare @stExpDateLot nvarchar(50);
	declare @manufacturedate nvarchar(50);
	declare @receiveddate datetime;
	declare @stLPN nvarchar(50);
	declare @stItemDescription nvarchar(100);
	declare @stUserName nvarchar(30);
	declare @iObjectID int; 
	declare @user_def3 nvarchar(50); -- [comment omitted]
	declare @user_def4 nvarchar(50); -- [comment omitted]
	declare @user_def5 nvarchar(50); -- [comment omitted]
	declare @process_stamp nvarchar(25);
	declare @toLocInvAttributeId numeric(9,0);


	set @iInventoryRecordsLoaded = 0;
	set @iInventoryRecordsError = 0;
	set @iCurrentRecord = 0;
	set @iRecordsAffected = 0;
/* [comment omitted] */	
	set @iPalInsert = 0;
	set @iPalIneligble = 0;

	declare loadInventoryCursor CURSOR LOCAL STATIC READ_ONLY FORWARD_ONLY 
	FOR
	select item, company, location, quantity, quantity_um, status, lot,  
	item_description, received_date, LPN, N'<literal:1>', object_id,user_def5,user_def3,user_def4, process_stamp
	, replace(convert(varchar(8), EXP_DATE_LOTDATETIME, 112)+convert(varchar(8), EXP_DATE_LOTDATETIME, 114), '<literal:2>','<literal:3>') ADJ_EXPDateString
	, replace(convert(varchar(8), manufacture_date, 112)+convert(varchar(8), manufacture_date, 114), '<literal:4>','<literal:5>') ADJ_ManDateString
	, loc_inv_attribute_id

	from INVENTORY_STAGING 
	where warehouse =  @stWarehouse 
	and user_def1 is null and quantity > 0 -- [comment omitted]
	-- [comment omitted]
	ORDER BY LOCATION DESC
	;

	open loadInventoryCursor;

	FETCH NEXT FROM loadInventoryCursor INTO @stItem, @stCompany, @stLocation, @dQuantity, @stQtyUm, @stInvSts, @stLot, @stItemDescription, @receiveddate, @stLPN, @stUserName, @iObjectID,  @user_def5,@user_def3,@user_def4, @process_stamp, @stExpDateLot, @manufacturedate, @toLocInvAttributeId

	WHILE @@FETCH_STATUS = 0 
	BEGIN   
      
			-- [comment omitted]
			/* [comment omitted] */




















































       
     
			begin transaction;


		exec @iError = INV_AdjustInv N'<literal:6>', N'<literal:7>', N'<literal:8>', N'<literal:9>', null, N'<literal:10>', N'<literal:11>', N'<literal:12>', N'<literal:13>', 0.0, @dQuantity, 0, 0, @stCompany, null,@stExpDateLot, N'<literal:14>', -- [comment omitted]
			null, null, null, @stInvSts, @stItem, @stItemDescription, @stLot, @manufacturedate, @stQtyUm, null, null, null, -- [comment omitted]
			null, @stAdjustmentType, -- [comment omitted]
			null, @stLPN, @stLocation, @stWarehouse, N'<literal:15>', @user_def3, null, null, null, @user_def4, @user_def5, 0.0, 0.0, @stUserName,  null, -- [comment omitted]
			null, null, N'<literal:16>', null, @toLocInvAttributeId, 0 -- [comment omitted]



			if(@iError = 0)
			begin	
				commit;
		
				update INVENTORY_STAGING set USER_DEF1 = N'<literal:17>' 
				where
				object_id = @iObjectID;
			
				update LOCATION_INVENTORY set RECEIVED_DATE = isnull(@receiveddate, getdate())
											, date_time_stamp =  isnull(@receiveddate, getdate())
												
				where
				ITEM = @stItem and LOCATION = @stLocation and warehouse = @stWarehouse and isnull(lot, '<literal:18>')  = isnull(@stLot, '<literal:19>') 
				and isnull(LOGISTICS_UNIT, '<literal:20>') = isnull(@stLPN, '<literal:21>') and isnull(company, '<literal:22>') = isnull(@stCompany, '<literal:23>') ;
				
				set @iRecordsAffected = @iRecordsAffected + 1;
				
				
				-- [comment omitted]
				-- [comment omitted]
				-- [comment omitted]
				-- [comment omitted]
				-- [comment omitted]
				-- [comment omitted]

				-- [comment omitted]
				-- [comment omitted]

				set @iInventoryRecordsLoaded = @iInventoryRecordsLoaded + 1;
			end
			else
			begin
				rollback;
				update INVENTORY_STAGING set USER_DEF1 = N'<literal:24>' 
				where OBJECT_ID = @iObjectID;
			
				set @iInventoryRecordsError = @iInventoryRecordsError + 1;
			end

			set @iCurrentRecord = @iCurrentRecord + 1;
       
			FETCH NEXT FROM loadInventoryCursor INTO @stItem, @stCompany, @stLocation, @dQuantity, @stQtyUm, @stInvSts, @stLot, @stItemDescription, @receiveddate, @stLPN, @stUserName, @iObjectID,  @user_def5,@user_def3,@user_def4, @process_stamp, @stExpDateLot, @manufacturedate, @toLocInvAttributeId
	END  

	print cast(@iInventoryRecordsLoaded as nvarchar(25)) + N'<literal:25>';
	print cast(@iInventoryRecordsError as nvarchar(25)) + N'<literal:26>';
	raiserror(N'<literal:27>', 10, 1, @iInventoryRecordsLoaded);
	raiserror(N'<literal:28>', 10, 1, @iInventoryRecordsError);

	-- [comment omitted]
	-- [comment omitted]
	-- [comment omitted]
	-- [comment omitted]

	close loadInventoryCursor;
	deallocate loadInventoryCursor;


end


