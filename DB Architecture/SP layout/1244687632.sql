
/*
 Mod		 | Programmer| Date       | Modification Description
 --------------------------------------------------------------------
	AI0012	 | AG        | 09/01/2016 | Created
			 | AG		 | 09/23/2016 | Added logic to avoid error caused from attempting to insert blank LPN's/Pallet Types (User_Def4) into [GRBT_LPN_PALLET_TYPES] table.
			 | AG		 | 09/23/2016 | Added Add'l Print logic to display more results from import
			 | AG		 | 11/11/2016 | Updated Declare Variables to match column length of Inv_AdjustInv variable lenghts
			 | AG		 | 04/28/2017 | change format to datestring for expiration and manufacture dates so dates insert into lot table and LI tables w/ inv_adj exec
			 | AG		 | 07/20/2020 | Support Inventory Attribute Import
*/

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

	--Declare Variables for INV_AdjustInv
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
	declare @user_def3 nvarchar(50); -- conversion_inventory.reason_description
	declare @user_def4 nvarchar(50); -- conversion_invenoty.pallet_type
	declare @user_def5 nvarchar(50); -- conversion_inventory.reason_code
	declare @process_stamp nvarchar(25);
	declare @toLocInvAttributeId numeric(9,0);


	set @iInventoryRecordsLoaded = 0;
	set @iInventoryRecordsError = 0;
	set @iCurrentRecord = 0;
	set @iRecordsAffected = 0;
/*GR Specific*/	
	set @iPalInsert = 0;
	set @iPalIneligble = 0;

	declare loadInventoryCursor CURSOR LOCAL STATIC READ_ONLY FORWARD_ONLY 
	FOR
	select item, company, location, quantity, quantity_um, status, lot,  
	item_description, received_date, LPN, N'SYSTEM', object_id,user_def5,user_def3,user_def4, process_stamp
	, replace(convert(varchar(8), EXP_DATE_LOTDATETIME, 112)+convert(varchar(8), EXP_DATE_LOTDATETIME, 114), ':','') ADJ_EXPDateString
	, replace(convert(varchar(8), manufacture_date, 112)+convert(varchar(8), manufacture_date, 114), ':','') ADJ_ManDateString
	, loc_inv_attribute_id

	from INVENTORY_STAGING 
	where warehouse =  @stWarehouse 
	and user_def1 is null and quantity > 0 --and user_def2 <> 'NO'
	--and object_id = 1 
	ORDER BY LOCATION DESC
	;

	open loadInventoryCursor;

	FETCH NEXT FROM loadInventoryCursor INTO @stItem, @stCompany, @stLocation, @dQuantity, @stQtyUm, @stInvSts, @stLot, @stItemDescription, @receiveddate, @stLPN, @stUserName, @iObjectID,  @user_def5,@user_def3,@user_def4, @process_stamp, @stExpDateLot, @manufacturedate, @toLocInvAttributeId

	WHILE @@FETCH_STATUS = 0 
	BEGIN   
      
			--Parameters for INV_AdjustInv
			/*
			1 - @cFromAllocEffect nchar(1)
			2 - @cFromInTransEffect nchar(1)
			3 - @cFromOnHandEffect nchar(1)
			4 - @cFromSuspEffect nchar(1)
			5 - @cReversal nchar(1)
			6 - @cToAllocEffect nchar(1)
			7 - @cToInTransEffect nchar(1)
			8 - @cToOnHandEffect nchar(1)
			9 - @cToSuspEffect nchar(1)
			10 - @dFromContQty numeric(19,5)
			11 - @dQuantity numeric(19,5)
			12 - @dReferenceLine numeric(19,5)
			13 - @iInternalNum numeric(9,0)
			14 - @stCompany nvarchar(25)
			15 - @stEquipmentType nvarchar(25)
			16 - @stExpDate nvarchar(50)
			17 - @cForceOnHandZero nchar(1)
			18 - @stFromContId nvarchar(50)
			19 - @stFromLoc nvarchar(25)
			20 - @stFromWhs nvarchar(25)
			21 - @stInventorySts nvarchar(50)
			22 - @stItem nvarchar(50)
			23 - @stItemDesc nvarchar(100)
			24 - @stLot nvarchar(25)
			25 - @stManDate nvarchar(50)
			26 - @stQuantityUM nvarchar(25)
			27 - @stRecContID nvarchar(25)
			28 - @FromParentLogisticsUnit nvarchar(50)
			29 - @ToParentLogisticsUnit nvarchar(50)
			30 - @stReferenceID nvarchar(25)
			31 - @stReferenceType nvarchar(50)
			32 - @stTeam nvarchar(50)
			33 - @stToContId nvarchar(50)
			34 - @stToLoc nvarchar(25)
			35 - @stToWhs nvarchar(25)
			36 - @stTransType nvarchar(50)
			37 - @stUserDef1 nvarchar(50)
			38 - @stUserDef2 nvarchar(50)
			39 - @stUserDef3 nvarchar(50)
			40 - @stUserDef4 nvarchar(50)
			41 - @stUserDef5 nvarchar(50)
			42 - @stUserDef6 nvarchar(50)
			43 - @dUserDef7 numeric(19,5)
			44 - @dUserDef8 numeric(19,5)
			45 - @stUserName nvarchar(30)
			46 - @stWorkGroup nvarchar(25)
			47 - @stWorkType nvarchar(25)
			48 - @stWorkUnit nvarchar(50)
			49 - @argumentGroupId nvarchar(32)
			50 - @fromLocInvAttributeId numeric(9,0)
			51 - @toLocInvAttributeId numeric(9,0)
			52 - @isNegativeAvailableAllowed bit */
       
     
			begin transaction;


		exec @iError = INV_AdjustInv N'', N'', N'', N'', null, N'', N'', N'+', N'', 0.0, @dQuantity, 0, 0, @stCompany, null,@stExpDateLot, N'N', -- 1 to 17
			null, null, null, @stInvSts, @stItem, @stItemDescription, @stLot, @manufacturedate, @stQtyUm, null, null, null, -- 18 to 29
			null, @stAdjustmentType, -- 30 to 31
			null, @stLPN, @stLocation, @stWarehouse, N'40', @user_def3, null, null, null, @user_def4, @user_def5, 0.0, 0.0, @stUserName,  null, --32 to 46
			null, null, N'', null, @toLocInvAttributeId, 0 -- 47 to 52



			if(@iError = 0)
			begin	
				commit;
		
				update INVENTORY_STAGING set USER_DEF1 = N'Loaded' 
				where
				object_id = @iObjectID;
			
				update LOCATION_INVENTORY set RECEIVED_DATE = isnull(@receiveddate, getdate())
											, date_time_stamp =  isnull(@receiveddate, getdate())
												
				where
				ITEM = @stItem and LOCATION = @stLocation and warehouse = @stWarehouse and isnull(lot, '!')  = isnull(@stLot, '!') 
				and isnull(LOGISTICS_UNIT, '!') = isnull(@stLPN, '!') and isnull(company, '!') = isnull(@stCompany, '!') ;
				
				set @iRecordsAffected = @iRecordsAffected + 1;
				
				
				--if (@stLPN is not null and @user_def4 is not null)
				--begin
				--	INSERT INTO [dbo].[GRBT_LPN_PALLET_TYPES]
				--		([LOGISTICS_UNIT],[COMPANY],[WAREHOUSE],[PALLET_TYPE],[USER_STAMP],[PROCESS_STAMP],[DATE_TIME_STAMP] )
				--		values
				--		(@stlpn,@stcompany,@stwarehouse,@user_def4,@stUserName,@process_stamp, getdate());

				--	set @iPalInsert = @iPalInsert +1;
				--end

				set @iInventoryRecordsLoaded = @iInventoryRecordsLoaded + 1;
			end
			else
			begin
				rollback;
				update INVENTORY_STAGING set USER_DEF1 = N'Error' 
				where OBJECT_ID = @iObjectID;
			
				set @iInventoryRecordsError = @iInventoryRecordsError + 1;
			end

			set @iCurrentRecord = @iCurrentRecord + 1;
       
			FETCH NEXT FROM loadInventoryCursor INTO @stItem, @stCompany, @stLocation, @dQuantity, @stQtyUm, @stInvSts, @stLot, @stItemDescription, @receiveddate, @stLPN, @stUserName, @iObjectID,  @user_def5,@user_def3,@user_def4, @process_stamp, @stExpDateLot, @manufacturedate, @toLocInvAttributeId
	END  

	print cast(@iInventoryRecordsLoaded as nvarchar(25)) + N' Records Loaded';
	print cast(@iInventoryRecordsError as nvarchar(25)) + N' Errors';
	raiserror(N'%d Records Loaded', 10, 1, @iInventoryRecordsLoaded);
	raiserror(N'%d Errors', 10, 1, @iInventoryRecordsError);

	--print cast(@iRecordsAffected as nvarchar(25)) + N' Location_Inventory Records Updated';
	--print cast(@iPalInsert as nvarchar(25)) + N' Pallet Inserted into GRBT_LPN_PALLET_TYPES Table';
	--set @iPalIneligble = (select count(*) from INVENTORY_STAGING where lpn is null or USER_DEF4 is null);
	--print cast(@iPalIneligble as nvarchar(25)) + N' Records Not eligible for GRBT_LPN_PALLET_TYPES record insert';

	close loadInventoryCursor;
	deallocate loadInventoryCursor;


end


