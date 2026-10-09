
/*
 Mod		 | Programmer| Date       | Modification Description
 --------------------------------------------------------------------
	AI0012	 | AG        | 09/01/2016 | Created
			 | AG		 | 09/23/2016 | Modified inventory_staging insert to include company. 
			 | AG		 | 09/23/2016 |	Modified item master details update stmt to join on company rather than update it from item master.
			 | AG		 | 09/23/2016 | Truncate Process stamp as causing column length issue when running load_inventory SP when inserting to GRBT_LPN_PALLET_TYPES table 
			 | AG		 | 11/07/2016 |	Update Data Scrub Logic to set all blank values to NULL for all columns in Conversion_inventory Table
			 | AG		 | 11/11/2016 | Added add'l Print messages for each query executed for easier progress tracking. 
			 | AG		 | 11/11/2016 | Added add'l join criteria to Base UM != IUOM query. [where ii.company = i.company]
			 | AG		 | 11/11/2016 | Added add'l query to check if incoming item != to location_inventory.item by location
			 | AG		 | 02/13/2017 | Revise "Check Duplicate LPN records" query to show Null LPN records as these may create unwanted add'l adjustments. Remove Nulls from "Check Multi Lot Same LPN"
			 | AG		 | 05/29/2017 | Add Logic to check Company and WH exists. Add logic to Count Validation Errors and update inventory_Staging.UDF1 to prevent Load_Inventory SP from executing
			 | AG		 | 03/26/2018 | Add Check for Invalid Inv Status instead of direct updates, handle null company scenario throughout
			 | AG		 | 07/14/2018 | Handle Null Quantity UM from initial File Import
			 | AG		 | 01/10/2019 | Rework Multi item Single Item location Eval Query
			 | AG		 | 10/04/2019 | Rework Same LPN in Multi Location Eval  Query
			 | AG		 | 07/20/2020 | Support Inventory Attribute Mapping and data validation (No Duplicates, LIA with No LP)
			 | AG		 | 01/17/2021 | revise ILA <> inv record check to omit multi item locations
*/


CREATE procedure [dbo].[POPULATE_INVENTORY_STAGING] (@stWarehouse nvarchar(25))
as 
begin

	declare @iRecordsAffected int;
	declare @iValidationError int;
	
	set @iRecordsAffected = -1;
	set @iValidationError = 0;


	print N'Processing Warehouse: ' + @stWarehouse;
	print N'Scrubbing Data for Null and Blank Values Started: ' + @stWarehouse;

	--Data Scrub all Conversion_Inventory Table Columns to set values to NULL if blank or contains spaces

	UPDATE conversion_inventory SET LPN = NULL WHERE LPN in (' ','','Null');
	UPDATE conversion_inventory SET Item = NULL WHERE Item in (' ','','Null');
	UPDATE conversion_inventory SET Inventory_sts = NULL WHERE Inventory_sts in (' ','','Null');
	UPDATE conversion_inventory SET location = NULL WHERE location in (' ','','Null');
	UPDATE conversion_inventory SET Warehouse = NULL WHERE Warehouse in (' ','','Null');
	UPDATE conversion_inventory SET Serial_Number = NULL WHERE Serial_Number in (' ','','Null');
	UPDATE conversion_inventory SET Company = NULL WHERE Company in (' ','','Null');
	UPDATE conversion_inventory SET Lot = NULL WHERE Lot in (' ','','Null');
	UPDATE conversion_inventory SET Parent_LPN = NULL WHERE Parent_LPN in (' ','','Null');
	UPDATE conversion_inventory SET Received_date = NULL WHERE Received_date in (' ','');
	UPDATE conversion_inventory SET old_location = NULL WHERE old_location in (' ','','Null');
	UPDATE conversion_inventory SET internal_id = NULL WHERE internal_id in (' ','','Null');
	UPDATE conversion_inventory SET user_stamp = NULL WHERE user_stamp in (' ','','Null');
	UPDATE conversion_inventory SET process_stamp = NULL WHERE process_stamp in (' ','','Null');
	UPDATE conversion_inventory SET date_time_stamp = NULL WHERE date_time_stamp in (' ','');
	UPDATE conversion_inventory SET error = NULL WHERE error in (' ','','Null');
	UPDATE conversion_inventory SET Quantity_UM = NULL WHERE Quantity_UM in (' ','','Null');
	UPDATE conversion_inventory SET Weight = NULL WHERE Weight in (' ','','Null');
	UPDATE conversion_inventory SET Weight_UM = NULL WHERE Weight_UM in (' ','','Null');
	UPDATE conversion_inventory SET EXPIRY_DATE = NULL WHERE EXPIRY_DATE in (' ','');
	UPDATE conversion_inventory SET Manufacture_date = NULL WHERE Manufacture_date in (' ','');
	UPDATE conversion_inventory SET Pallet_type = NULL WHERE Pallet_type in (' ','','Null');
	UPDATE conversion_inventory SET reason_code = NULL WHERE reason_code in (' ','','Null');
	UPDATE conversion_inventory SET reason_description = NULL WHERE reason_description in (' ','','Null');
	UPDATE conversion_inventory SET Position = NULL WHERE Position in (' ','','Null');
	UPDATE conversion_inventory SET batch_number = NULL WHERE batch_number in (' ','','Null');
	UPDATE conversion_inventory SET loc_inv_attribute_id = NULL WHERE loc_inv_attribute_id in (' ','','Null');

	print N'Scrubbing Data for Null and Blank Values Completed: ' + @stWarehouse;

	--Clear Records in CONVERSION_INVENTORY that do not have quantity.
	
	--delete from CONVERSION_INVENTORY where quantity is null or quantity <= 0;

	set @iRecordsAffected = @@ROWCOUNT;

	print cast(@iRecordsAffected as nvarchar(25)) + ' Records Deleted for table CONVERSION_INVENTORY with blank or zero quantity';

/*
	--Update Inventory Status on CONVERSION_INVENTORY Table to be Available if Active
	--SELECT COUNT(*) FROM CONVERSION_INVENTORY WHERE inventory_sts = 'AVA'
	update CONVERSION_INVENTORY set inventory_sts = 'AVA' where inventory_sts = 'AVA';

	set @iRecordsAffected = @@ROWCOUNT;

	print cast(@iRecordsAffected as nvarchar(25)) + ' Records IN AVA status for table CONVERSION_INVENTORY';

	--Update Inventory Status on CONVERSION_INVENTORY Table to be In Service if Hold
	
	update CONVERSION_INVENTORY set inventory_sts = 'HOL' where inventory_sts = 'HOL';
	--SELECT COUNT(*) FROM CONVERSION_INVENTORY WHERE inventory_sts = 'HOL';
	
	set @iRecordsAffected = @@ROWCOUNT;

	print cast(@iRecordsAffected as nvarchar(25)) + ' Records IN HOLD status for table CONVERSION_INVENTORY';

	--Update Inventory Status on CONVERSION_INVENTORY Table to be In Service if Hold

	update CONVERSION_INVENTORY set inventory_sts = 'DAM Supplier / Fournisseur' where inventory_sts = 'DAM Supplier / Fournisseur'
	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' RECORDS IN DAMAGED status for table CONVERSION_INVENTORY';

	update CONVERSION_INVENTORY set inventory_sts = 'DAM' where inventory_sts = 'DAM'
	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' RECORDS IN DAMAGED status for table CONVERSION_INVENTORY';

	update CONVERSION_INVENTORY set inventory_sts = 'DAM Carrier / Transporteur' where inventory_sts = 'DAM Carrier / Transporteur'
	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' RECORDS IN DAMAGED status for table CONVERSION_INVENTORY';

	update CONVERSION_INVENTORY set inventory_sts = 'DAM Handling / Manutention' where inventory_sts = 'DAM Handling / Manutention'
	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' RECORDS IN DAMAGED status for table CONVERSION_INVENTORY';

	update CONVERSION_INVENTORY set inventory_sts = 'DAM Packing / Emballage' where inventory_sts = 'DAM Packing / Emballage'

	--SELECT COUNT(*) FROM CONVERSION_INVENTORY WHERE inventory_sts IN ('DAM Supplier / Fournisseur','DAM','DAM Carrier / Transporteur','DAM Handling / Manutention','DAM Packing / Emballage');
	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' RECORDS IN DAMAGED status for table CONVERSION_INVENTORY';

	-- COUNT QUA STS
	--SELECT COUNT(*) FROM CONVERSION_INVENTORY WHERE inventory_sts = 'QUA'
	update CONVERSION_INVENTORY set inventory_sts = 'QUA' where inventory_sts = 'QUA'
	
	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' RECORDS QUA status for table CONVERSION_INVENTORY';

	-- COUNT DES STS
	--SELECT COUNT(*) FROM CONVERSION_INVENTORY WHERE inventory_sts = 'DES'
	update CONVERSION_INVENTORY set inventory_sts = 'DES' where inventory_sts = 'DES'
	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' RECORDS DES status for table CONVERSION_INVENTORY';
*/

	--Clear Records from the INVENTORY_STAGING
	delete from INVENTORY_STAGING; 
	set @iRecordsAffected = @@ROWCOUNT;

	print cast(@iRecordsAffected as nvarchar(25)) + ' Records Deleted for table INVENTORY_STAGING';


	--Insert into the INVENTORY_STAGING
	insert into INVENTORY_STAGING (warehouse, item, COMPANY, location, quantity, QUANTITY_UM,
	lpn, lot, received_date, exp_date_lotdatetime, manufacture_date, status, user_stamp, process_stamp, date_time_stamp, user_def5,user_def3,user_def4,loc_inv_attribute_id)
	(select
		Warehouse,Item,company,Location,Quantity, quantity_um,LPN,Lot,received_date,EXPIRY_DATE,Manufacture_date,inventory_sts,'SYSTEM', 'POP_INVENTORY_STAGING', GETDATE(),reason_code,reason_description,pallet_type, loc_inv_attribute_id

		--warehouse, item, location, qty, lpn, lot, exp_date_lot, exp_date_lpn, status, 'SYSTEM', 'POPULATE_INVENTORY_STAGING', GETDATE()
	 from CONVERSION_INVENTORY where warehouse = @stWarehouse);

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' Records Inserted into table INVENTORY_STAGING';


	-- Validate if Warehouse Exists

	select @iRecordsAffected = isnull((select distinct COUNT(*) 
	from INVENTORY_STAGING ii
	left join Warehouse c
	on c.Warehouse = ii.Warehouse
	where c.Warehouse is null),0)

	if(@iRecordsAffected > 0)
	begin
		raiserror('%d Warehouse DNE', 10, 1, @iRecordsAffected);
		select distinct N'Warehouse DNE', ii.company 
		from INVENTORY_STAGING ii
		left join Warehouse c
		on c.Warehouse = ii.Warehouse
		where c.Warehouse is null

		set @iValidationError = @iValidationError + 1;

	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' Warehouse DNE';

	-- Validate if Company Exists

	select @iRecordsAffected = isnull((select COUNT(distinct ii.company) 
	from INVENTORY_STAGING ii
	left join company c
	on isnull(c.company,'!') = isnull(ii.company,'!')
	where c.company is null),0)

	if(@iRecordsAffected > 0)
	begin
		raiserror('%d Company DNE', 10, 1, @iRecordsAffected);
		select distinct N'Company DNE', ii.company 
		from INVENTORY_STAGING ii
		left join company c
		on isnull(c.company,'!') = isnull(ii.company,'!')
		where c.company is null

		set @iValidationError = @iValidationError + 1;

	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' Company DNE';


	--Update with Item Master Fields
	update ii 
	set ii.ITEM_DESCRIPTION = i.description, 
	ii.lot_tracked = i.LOT_CONTROLLED

	from inventory_staging ii
	inner join item i
	on ii.item = i.item 
	and isnull(ii.COMPANY,'!') = isnull(i.COMPANY,'!')
	;

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' Records Item Master Records Update (Item_Desc, Company, Lot_Tracked) to table Inventory_Staging';

	-- Validate Inventory Status
	select @iRecordsAffected = isnull((select count(*)
	from INVENTORY_STAGING ii
	where isnull(II.STATUS,'!') not in (select identifier from GENERIC_CONFIG_DETAIL g where record_type = 'INVSTATUS')),0)

	if(@iRecordsAffected > 0)
	begin
		raiserror('%d Invalid Inventory Status', 10, 1, @iRecordsAffected);
		select 'Invalid Inventory Status',* 
		from INVENTORY_STAGING ii
		where isnull(II.STATUS,'!') not in (select identifier from GENERIC_CONFIG_DETAIL g where record_type = 'INVSTATUS')
		order by ii.STATUS,ii.location

		set @iValidationError = @iValidationError + 1;
	end 

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' Invalid Inventory Status';
	
	-- Validate if inventory Staging Base UM != Item Unit of Measure Base UM
	select @iRecordsAffected = isnull((select COUNT(*) 
	from INVENTORY_STAGING ii
	inner join item i
	on ii.item = i.item
	and isnull(ii.COMPANY,'!') = isnull(i.COMPANY,'!')
	inner join ITEM_UNIT_OF_MEASURE ium
	on ii.item = ium.item and ium.sequence = 1 
	and isnull(ii.quantity_um,'!') <> ium.quantity_um
	and isnull(ii.company, '!') = isnull(ium.company, '!')),0);

	if(@iRecordsAffected > 0)
	begin
		raiserror('%d Base UM != Item Unit of Measure Base UM', 10, 1, @iRecordsAffected);
		select 'Base UM != Item Unit of Measure Base UM', ii.item, ii.company, ii.location, ii.quantity_um as LocationInventoryUM, ium.quantity_um as ItemUnitOfMeasureUM, ii.QUANTITY,ii.DATE_TIME_STAMP, i.LOT_CONTROLLED,i.STORAGE_TEMPLATE, ii.LPN
		from INVENTORY_STAGING ii
		inner join item i
		on ii.item = i.item
		and isnull(ii.COMPANY,'!') = isnull(i.COMPANY,'!')
		inner join ITEM_UNIT_OF_MEASURE ium
		on ii.item = ium.item and ium.sequence = 1 
		and isnull(ii.quantity_um,'!') <> ium.quantity_um
		and isnull(ii.company, '!') = isnull(ium.company, '!')

		order by ii.item,ii.COMPANY,ii.location,ii.lpn

		set @iValidationError = @iValidationError + 1;
	end
	
	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' Base UM != Item Unit of Measure Base UM';


	--Verify that any Lot Tracked Items Have Lots - display item, location and lot for it.
	select @iRecordsAffected = isnull((select COUNT(*) from INVENTORY_STAGING where LOT_TRACKED = 'Y' and LOT is null 
	and LOCATION in (SELECT LOCATION FROM LOCATION WHERE TRACK_CONTAINERS = 'Y')),0);

	if(@iRecordsAffected > 0)
	begin
		raiserror('%d items found without lots but are lot tracked', 10, 1, @iRecordsAffected);
		select 'Lot Tracked without Lot in LP Tracked Location', ITEM, LOCATION, LOT, LOT_TRACKED, LPN from INVENTORY_STAGING where LOT_TRACKED = 'Y' and LOT is null and LOCATION in (SELECT LOCATION from LOCATION where TRACK_CONTAINERS = 'Y') order by LOCATION, ITEM

		set @iValidationError = @iValidationError + 1;	
	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' Lot Tracked without Lot in LP Tracked Location' ;

	--Verify that any Non Lot Tracked Items Do Not Have Lots - display item, location and lot for it.
	select @iRecordsAffected = isnull((select COUNT(*) from INVENTORY_STAGING where LOT_TRACKED = 'N' and LOT is not null),0);

	if(@iRecordsAffected > 0)
	begin
		raiserror('%d items found with lots but are not lot tracked', 10, 1, @iRecordsAffected);
		select 'Not Lot Tracked Item with Lot', ITEM,COMPANY, LOCATION, LOT, LOT_TRACKED, LPN from INVENTORY_STAGING where LOT_TRACKED = 'N' and LOT is not null order by LOCATION, ITEM
		
		set @iValidationError = @iValidationError + 1;
	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' Not Lot Tracked Item with Lot';

	--Verify that all locations exist
	select @iRecordsAffected = isnull((select COUNT(*) from INVENTORY_STAGING where LOCATION not in (select location from LOCATION where warehouse = @stWarehouse)),0)

	if(@iRecordsAffected > 0)
	begin
		raiserror('%d Records found without valid locations', 10, 1, @iRecordsAffected);
		select 'Location does not exist', ITEM, LOCATION, --LOT, LOT_TRACKED, 
		LPN from INVENTORY_STAGING where LOCATION not in (select location from LOCATION where warehouse = @stWarehouse) order by LOCATION, ITEM
		
		set @iValidationError = @iValidationError + 1;
	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' Location does not exist';

	--Verify that all locations are active
	select @iRecordsAffected = isnull((select COUNT(*) from INVENTORY_STAGING where LOCATION in (select location from LOCATION where active = 'N' and warehouse = @stWarehouse)),0)

	if(@iRecordsAffected > 0)
	begin
		raiserror('%d Records found with inactive locations', 10, 1, @iRecordsAffected);
		select 'Location is inactive', ITEM, LOCATION, --LOT, LOT_TRACKED, 
		LPN from INVENTORY_STAGING where LOCATION in (select location from LOCATION where active = 'N' and warehouse = @stWarehouse) order by LOCATION, ITEM
		
		set @iValidationError = @iValidationError + 1;
	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' Location is inactive';


	--Convert Expiration Date (4712-12-31 00:00:00)
	--update INVENTORY_STAGING set EXP_DATE_LPDATETIME = '47121231000000' where lot is not null and (exp_date_lpdatetime is null or exp_date_lpdatetime = '' or exp_date_lpdatetime = 'NULL');

	--select * from inventory_staging

	--set @iRecordsAffected = @@ROWCOUNT;
	--print cast(@iRecordsAffected as nvarchar(25)) + ' Records Updated with LP Expiration Date for table INVENTORY_STAGING';

	--Convert Lot Expiration Date (4712-12-31 00:00:00)
	--update INVENTORY_STAGING set EXP_DATE_LOTDATETIME = convert(datetime,EXP_DATE_LOTDATETIME) where exp_date_lotdatetime is not null and exp_date_lotdatetime != '' and exp_date_lotdatetime != 'NULL';

	--set @iRecordsAffected = @@ROWCOUNT;
	--print cast(@iRecordsAffected as nvarchar(25)) + ' Records Updated with Lot Expiration Date for table INVENTORY_STAGING';


	--Check for locations that are LPN tracked but do not have LPNS
	select @iRecordsAffected = isnull((select COUNT(*) from INVENTORY_STAGING where LPN is null and location in (select location from LOCATION where warehouse = @stWarehouse and track_containers = 'Y')),0)

	if(@iRecordsAffected > 0)
	begin
		raiserror('%d Records found that are LPN tracked but do not have LPNS', 10, 1, @iRecordsAffected);
		select 'LPN Tracked but no LPN', ITEM, LOCATION, LPN, LOT, LOT_TRACKED 
		from INVENTORY_STAGING where LPN is null and location in (select location from LOCATION where warehouse = @stWarehouse	 and track_containers = 'Y') order by LOCATION, ITEM
		
		set @iValidationError = @iValidationError + 1;
	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' LPN Tracked but no LPN';


	--Check for locations that are not LPN tracked but have LPNS
	select @iRecordsAffected = isnull((select COUNT(*) from INVENTORY_STAGING where LPN is not null and location in (select location from LOCATION where warehouse = @stWarehouse and track_containers = 'N')),0)

	if(@iRecordsAffected > 0)
	begin
		raiserror('%d Records found with LPNs but location is not LPN tracked', 10, 1, @iRecordsAffected);
		select 'Not LPN Tracked with LPN', ITEM, LOCATION, LPN, LOT, LOT_TRACKED 
		from INVENTORY_STAGING where LPN is not null and location in (select location from LOCATION where warehouse = @stWarehouse and track_containers = 'N') order by LOCATION, ITEM
		
		set @iValidationError = @iValidationError + 1;
	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' Not LPN Tracked with LPN';

	--Check for items that are not in the item master
	select @iRecordsAffected = isnull((select COUNT(*) 	
	from INVENTORY_STAGING ii
	left join item i
	on ii.item = i.item
	and isnull(ii.COMPANY,'!') = isnull(i.COMPANY,'!')
	where i.item is null),0)

	if(@iRecordsAffected > 0)
	begin
		raiserror('%d Records found with items that do not exist in the item master', 10, 1, @iRecordsAffected);
		select 'Item Does Not Exist', ii.ITEM, ii.COMPANY, ii.LOCATION, ii.LPN, ii.LOT, ii.LOT_TRACKED 
		from INVENTORY_STAGING ii
		left join item i
		on ii.item = i.item
		and isnull(ii.COMPANY,'!') = isnull(i.COMPANY,'!')
		where i.item is null
		order by ii.LOCATION, ii.ITEM
		
		set @iValidationError = @iValidationError + 1;

		--Stamp items that don't exist
		UPDATE ii
		SET USER_DEF2 = 'ITEM DNE'
		from INVENTORY_STAGING ii
		left join item i
		on ii.item = i.item
		and isnull(ii.COMPANY,'!') = isnull(i.COMPANY,'!')
		where i.item is null

		--Stamp items that don't exist
		UPDATE ii
		SET ERROR = 'ITEM DNE'
		from CONVERSION_INVENTORY ii
		left join item i
		on ii.item = i.item
		and isnull(ii.COMPANY,'!') = isnull(i.COMPANY,'!')
		where i.item is null
		
		set @iRecordsAffected = @@ROWCOUNT;
		print cast(@iRecordsAffected as nvarchar(25)) + ' ITEM DNE';
	end

	set @iRecordsAffected = 0;
	
	--Check for Multiple Items In Single Item Location
	select @iRecordsAffected = isnull(sum(count_item),0)
	from (select isnull(count(distinct item),0) count_item,location 
		  from INVENTORY_STAGING where warehouse = @stWarehouse and location in (select location from location where location.warehouse = @stWarehouse and multi_item = 'N') group by location having count(distinct item) > 1) MISIL

	if(@iRecordsAffected > 0)
	begin
		raiserror('%d Records found with more than one item in a single item location', 10, 1, @iRecordsAffected);
		select 'More than one item in a Single Item Location', ITEM, LOCATION, LOT, LPN,*
		from INVENTORY_STAGING where location in (select location from inventory_staging where warehouse = @stWarehouse and location in (select location from location where location.warehouse = @stWarehouse and multi_item = 'N') group by location having count(distinct item) > 1) 
		ORDER BY 2,3
		
		set @iValidationError = @iValidationError + 1;
	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' More than one item in a Single Item Location';


	--Check for Same LPN in Multiple Locations
	select @iRecordsAffected = isnull(sum(count_lpn),0)
	--select isnull(sum(count_lpn),0)
	from ( select (select count(distinct location)
					from inventory_staging 
					where warehouse = @stWarehouse
					and lpn is not null 
					group by lpn 
					having count(distinct location) > 1) count_lpn) SLIML

	if(@iRecordsAffected > 0)
	begin
		raiserror('%d Records found with LPN in more than one location', 10, 1, @iRecordsAffected);
		select 'Same LPN in More than One Location', ITEM, LOCATION, LOT, LPN
		 from INVENTORY_STAGING where LPN is not null and LPN in (select LPN from inventory_staging where warehouse = @stWarehouse group by lpn having count(distinct location) > 1) 	
		 ORDER BY LPN,LOCATION

		 set @iValidationError = @iValidationError + 1;
	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' Same LPN in More than One Location';

	--Check Duplicate LPN records
	select @iRecordsAffected = isnull((select count(*) from INVENTORY_STAGING ii 
		where ii.lpn in (select ii.lpn from INVENTORY_STAGING ii WHERE LPN IS NOT NULL group by ii.lpn,ii.item,ii.warehouse,ii.COMPANY,ii.LOT having count(*)>1)
		OR ISNULL(II.LPN,'NULL') + N' '+ ii.item + N' '+ ii.warehouse + N' '+ isnull(ii.COMPANY,'NULL') + N' '+ ISNULL(ii.LOT,'NULL') + N' '+ location in 
			(select ISNULL(II.LPN,'NULL') + N' '+ ii.item + N' '+ ii.warehouse + N' '+ ISNULL(ii.COMPANY,'NULL') + N' '+ ISNULL(ii.LOT,'NULL') + N' '+ location
			from INVENTORY_STAGING ii 
			group by ii.lpn,ii.item,ii.warehouse,ii.COMPANY,ii.LOT, location,loc_inv_attribute_id having count(*)>1)),0)

	if(@iRecordsAffected > 0)
	begin
		raiserror('%d Records Duplicate LPN record. Will create addtional adjustment. Remove or consolidate records as needed', 10, 1, @iRecordsAffected);
		select 'Duplicate LPN record. Will create addtional adjustment. Remove or consolidate records as needed', ii.warehouse,ii.Location,ii.lpn,ii.item,ii.company,ii.lot,ii.Quantity,ii.Quantity_UM
		from INVENTORY_STAGING ii
		where ii.lpn in (select ii.lpn from INVENTORY_STAGING ii WHERE LPN IS NOT NULL group by ii.lpn,ii.item,ii.warehouse,ii.COMPANY,ii.LOT having count(*)>1)
		OR ISNULL(II.LPN,'NULL') + N' '+ ii.item + N' '+ ii.warehouse + N' '+ ISNULL(ii.COMPANY,'NULL') + N' '+ ISNULL(ii.LOT,'NULL') + N' '+ location in 
			(select ISNULL(II.LPN,'NULL') + N' '+ ii.item + N' '+ ii.warehouse + N' '+ ISNULL(ii.COMPANY,'NULL') + N' '+ ISNULL(ii.LOT,'NULL') + N' '+ location
			from INVENTORY_STAGING ii 
			group by ii.lpn,ii.item,ii.warehouse,ii.COMPANY,ii.LOT, location having count(*)>1)
		order by ii.location,ii.LPN, ii.item, ii.LOT,loc_inv_attribute_id

		set @iValidationError = @iValidationError + 1;
	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' Duplicate LPN record. Will create addtional adjustment. Remove or consolidate records as needed';

	-- Check Multi Lot Same LPN
	select @iRecordsAffected = isnull((select COUNT(*) from INVENTORY_STAGING i
	where i.lpn in( select ii.lpn from INVENTORY_STAGING II WHERE II.LOT_TRACKED = 'Y' AND II.LPN IS NOT NULL GROUP BY II.LPN HAVING COUNT(DISTINCT LOT)>1)),0)

	if(@iRecordsAffected>0)
	begin 
		raiserror('%d Records Multi Lot Same LPN', 10, 1, @iRecordsAffected);
		select 'Multi Lot Same LPN', ii.warehouse,ii.item, ii.lpn,ii.item,ii.company,ii.lot,ii. Location,ii.Quantity_UM,ii.Quantity
		from INVENTORY_STAGING ii
		where ii.lpn in (select ii.lpn FROM INVENTORY_STAGING II WHERE II.LOT_TRACKED = 'Y' AND II.LPN IS NOT NULL GROUP BY II.LPN HAVING COUNT(DISTINCT LOT)>1)
		order by ii.location,ii.LPN

		set @iValidationError = @iValidationError + 1;
	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' Multi Lot Same LPN';

	--Check for items going to a location that is assigned to a different item (Perm Locn)
	select @iRecordsAffected = isnull((select COUNT(*)
										from INVENTORY_STAGING LI
										join location l 
										on l.LOCATION = li.LOCATION
										and l.warehouse = li.WAREHOUSE
										--where exists (select 'x' from ITEM_LOCATION_ASSIGNMENT ila lcoation l where li.LOCATION = ila.ALLOCATION_LOC and li.WAREHOUSE = ila.warehouse and li.ITEM <> ila.ITEM and isnull(li.COMPANY,'!') = isnull(ila.COMPANY,'!'))
										JOIN item_location_assignment ila 
										ON ila.allocation_loc = LI.location 
										and ila.warehouse = LI.WAREHOUSE
										where LI.item <> ILA.ITEM
										and isnull(li.company,'!') = ISNULL(ila.COMPANY,'!')
										and l.MULTI_ITEM = 'N'
										and li.WAREHOUSE = @stWarehouse),0)

	if(@iRecordsAffected > 0)
	begin
		raiserror(N'%d Records found with items going to a location assigned to a different item (Perm Locn)', 10, 1, @iRecordsAffected);
		
		select N'Different Item than Assigned to Location (Perm Locn)', 
		--(select top 1 item from item_location_assignment ila where ila.allocation_loc = li.location and ila.warehouse = 'LDC' /*and ila.allocation_loc <> 'OSR'*/) as assigned_item,
		ila.ITEM, ila.ALLOCATION_LOC, ila.warehouse, li.*
		--SELECT COUNT(*)

		from INVENTORY_STAGING LI
		join location l 
		on l.LOCATION = li.LOCATION
		and l.warehouse = li.WAREHOUSE
		--where exists (select 'x' from ITEM_LOCATION_ASSIGNMENT ila lcoation l where li.LOCATION = ila.ALLOCATION_LOC and li.WAREHOUSE = ila.warehouse and li.ITEM <> ila.ITEM and isnull(li.COMPANY,'!') = isnull(ila.COMPANY,'!'))
		JOIN item_location_assignment ila 
		ON ila.allocation_loc = LI.location 
		and ila.warehouse = LI.WAREHOUSE
		where LI.item <> ILA.ITEM
		and isnull(li.company,'!') = ISNULL(ila.COMPANY,'!')
		and l.MULTI_ITEM = 'N'
		and li.WAREHOUSE = @stWarehouse
		
		ORDER BY 2



		set @iValidationError = @iValidationError + 1;
	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' Different Item than Assigned to Location (Perm Locn)';

	--Check for Different Item than Currently in Single Item Location (Non-Perm Locn) 
	select distinct @iRecordsAffected = isnull((select count(*) FROM INVENTORY_STAGING I LEFT JOIN LOCATION_INVENTORY LI ON I.WAREHOUSE = LI.warehouse	and i.LOCATION = li.LOCATION left join location l	on l.LOCATION = li.LOCATION	where li.item + ' ' + ISNULL(li.COMPANY,'!') != i.ITEM + ' ' + ISNULL(i.COMPANY,'!') and l.MULTI_ITEM = 'N'	and li.PERMANENT = 'N'	and li.warehouse = @stWarehouse),0)

	if(@iRecordsAffected > 0)
	begin
		raiserror('%d Records found with Different Item than Currently in Single Item Location (Non-Perm Locn)', 10, 1, @iRecordsAffected);
		select distinct 'Different Item than Currently in Single Item Location (Non-Perm Locn)', I.WAREHOUSE,I.LOCATION, i.item + ' ' + ISNULL(i.COMPANY,'!') [Staging_Inventory.Item/Company], li.ITEM + ' ' + isnull(li.COMPANY,'!') [location_inventory.Item/Company]
		FROM INVENTORY_STAGING I 
		LEFT JOIN LOCATION_INVENTORY LI
		ON I.WAREHOUSE = LI.warehouse
		and i.LOCATION = li.LOCATION
		left join location l
		on l.LOCATION = li.LOCATION
		where li.item + ' ' + isnull(li.COMPANY,'!') != i.ITEM + ' ' + isnull(i.COMPANY,'!')
		and l.MULTI_ITEM = 'N'
		and li.PERMANENT = 'N'
		and li.warehouse = @stWarehouse

		order by I.LOCATION,4,5

		set @iValidationError = @iValidationError + 1;
	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' Different Item than Currently in Single Item Location (Non-Perm Locn)';

	--Check for duplicate Loc Inv Attr object_id
	select @iRecordsAffected = isnull((select count(*) 
										from INVENTORY_STAGING ii 
										where loc_inv_attribute_id is not null
										group by loc_inv_attribute_id
										having count(*)>1),0)

	if(@iRecordsAffected > 0)
	begin
		raiserror('%d Records duplicate Loc Inv Attr object_id. Please address the data discrepancy', 10, 1, @iRecordsAffected);
		select 'Duplicate Loc Inv Attr object_id. Please address the data discrepancy', *
		from INVENTORY_STAGING ii
		where loc_inv_attribute_id in (select count(*) 
									   from INVENTORY_STAGING ii 
									   where loc_inv_attribute_id is not null
									   group by loc_inv_attribute_id
									   having count(*)>1)
		order by 2 asc

		set @iValidationError = @iValidationError + 1;
	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' Duplicate Loc Inv Attr object_id. Please address the data discrepancy';

	--Check Loc Inv Attr object_id with non-LP tracked location
	select @iRecordsAffected = isnull((select count(*) 
										from INVENTORY_STAGING ii 
										join location l 
										on ii.LOCATION = l.LOCATION
										and ii.WAREHOUSE = l.warehouse
										where loc_inv_attribute_id is not null
										and l.TRACK_CONTAINERS = 'N'
										group by loc_inv_attribute_id
										having count(*)>1),0)

	if(@iRecordsAffected > 0)
	begin
		raiserror('%d Records Item has Inventory Attribute and No LPN. Location Must be LP Tracked if Using Inventory Attributes', 10, 1, @iRecordsAffected);
		select 'Item has Inventory Attribute and No LPN. Location Must be LP Tracked if Using Inventory Attributes', *
		from INVENTORY_STAGING ii
		where loc_inv_attribute_id in (select count(*) 
									   from INVENTORY_STAGING ii 
									   join location l 
									   on ii.LOCATION = l.LOCATION
									   and ii.WAREHOUSE = l.warehouse
									   where loc_inv_attribute_id is not null
									   and l.TRACK_CONTAINERS = 'N'
									   group by loc_inv_attribute_id
									   having count(*)>1)
		order by 2 asc

		set @iValidationError = @iValidationError + 1;
	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' Item using Loc Inv Attributes with No LP';


	if(@iValidationError >0)
	begin 
		update inventory_staging 
		set user_Def1 = 'Validation Errors Occured, Revise then Rerun SP'


		--set @iRecordsAffected = @@ROWCOUNT;
		print cast(@iValidationError as nvarchar(25)) + ' Validation Errors Incurred. Please Revise, then Rerun SP';
	end

end;
