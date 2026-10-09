
/*
	Task	| By	| Date			| Modification Description
	---------------------------------------------------------------
	AI0018	| AG	| 12/12/2016	| Created.
	AI0018	| AG	| 05/16/2018	| Handle Null Company
	AI0018	| AG	| 07/14/2018	| Check Invalid Config Combinations
	AI0018	| AG	| 09/18/2020	| Location + WH ILC Exists needs to group by item company
	AI0018	| AG	| 1/17/2021		| revise duplicate ILC via location type calc
	

*/


-- exec POPULATE_STAGING_ILC '300'
CREATE procedure [dbo].[POPULATE_STAGING_ILC] (@stWarehouse nvarchar(25))
as 
begin

	declare @iRecordsAffected int;
	declare @iValidationError int;
	declare @iRecordsToProcess int;

	print N'Processing Warehouse: ' + @stWarehouse;
	print N'Scrubbing Data for Null and Blank Values Started: ' + @stWarehouse;

	-- scrub data for null and blank values

	
	--UPDATE Conversion_ILC SET INTERNAL_ITEM_CAPACITY_NUM = NULL WHERE INTERNAL_ITEM_CAPACITY_NUM in (' ','','Null')
	UPDATE Conversion_ILC SET ITEM = NULL WHERE ITEM in (' ','','Null')
	UPDATE Conversion_ILC SET COMPANY = NULL WHERE COMPANY in (' ','','Null')
	UPDATE Conversion_ILC SET LOCATION_TYPE = NULL WHERE LOCATION_TYPE in (' ','','Null')
	
	UPDATE Conversion_ILC SET QUANTITY_UM = NULL WHERE QUANTITY_UM in (' ','','Null')
	
	UPDATE Conversion_ILC SET USER_DEF1 = NULL WHERE USER_DEF1 in (' ','','Null')
	UPDATE Conversion_ILC SET USER_DEF2 = NULL WHERE USER_DEF2 in (' ','','Null')
	UPDATE Conversion_ILC SET USER_DEF3 = NULL WHERE USER_DEF3 in (' ','','Null')
	UPDATE Conversion_ILC SET USER_DEF4 = NULL WHERE USER_DEF4 in (' ','','Null')
	UPDATE Conversion_ILC SET USER_DEF5 = NULL WHERE USER_DEF5 in (' ','','Null')
	UPDATE Conversion_ILC SET USER_DEF6 = NULL WHERE USER_DEF6 in (' ','','Null')
	
	UPDATE Conversion_ILC SET USER_STAMP = NULL WHERE USER_STAMP in (' ','','Null')
	UPDATE Conversion_ILC SET PROCESS_STAMP = NULL WHERE PROCESS_STAMP in (' ','','Null')
	UPDATE Conversion_ILC SET DATE_TIME_STAMP = NULL WHERE DATE_TIME_STAMP in (' ','');
	
	UPDATE Conversion_ILC SET warehouse = NULL WHERE warehouse in (' ','','Null')
	UPDATE Conversion_ILC SET LOCATION = NULL WHERE LOCATION in (' ','','Null')
	UPDATE Conversion_ILC SET ITEM_CLASS = NULL WHERE ITEM_CLASS in (' ','','Null')
	
	
	UPDATE Conversion_ILC SET MAXIMUM_RPLN_FILL_PCT = 100 WHERE MAXIMUM_RPLN_FILL_PCT is null
	UPDATE Conversion_ILC SET MINIMUM_TOPOFF_RPLN_PCT = 33 WHERE MINIMUM_TOPOFF_RPLN_PCT is null
	UPDATE Conversion_ILC SET USER_DEF7 = 0 WHERE USER_DEF7 is null;
	UPDATE Conversion_ILC SET USER_DEF8 = 0 WHERE USER_DEF8 is null;
	
	print N'Scrubbing Data for Null and Blank Values Completed: ' + @stWarehouse;

	-- delete null or 0 max qty records
	delete from Conversion_ILC where MAXIMUM_QTY is null or MAXIMUM_QTY = 0
	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' Records Delete with 0 or null Max Qty';
	
	--Verify that no duplicate records exist;
	select @iRecordsAffected = count(*) from Conversion_ILC where warehouse = @stwarehouse 
		 and warehouse + N' - ' + LOCATION in (select warehouse + N' - ' + Location from
		Conversion_ILC where warehouse = @stwarehouse 
		group by item, company, warehouse, Location
			having COUNT(*) > 1 )
	--set @iRecordsAffected = @@ROWCOUNT;
	--print cast(@iRecordsAffected as nvarchar(25))

	if(@iRecordsAffected > 0)
	begin
		RAISERROR(N'%d Duplicate Warehouse and Location Records Found', 10,1,@iRecordsAffected);
		select N'Duplicate Records: WH + Location', * from Conversion_ILC where warehouse = @stwarehouse 
		 and warehouse + N' - ' + LOCATION in (select warehouse + N' - ' + Location from
		Conversion_ILC where warehouse = @stwarehouse 
		group by item, company, warehouse, Location
			having COUNT(*) > 1 )
		--return;

	end

	select @iRecordsAffected = count(*) from Conversion_ILC where location_type is not null group by item,COMPANY,ITEM_CLASS,LOCATION_TYPE
	having COUNT(*) > 1
	--set @iRecordsAffected = @@ROWCOUNT;
	--print cast(@iRecordsAffected as nvarchar(25))

	if(@iRecordsAffected > 0)
	begin
		RAISERROR(N'%d Duplicate  Item, Company, Location Type Records Found', 10,1,@iRecordsAffected);
		select N'Duplicate Records: Item, Company, Location Type', * from Conversion_ILC where 
		 item + N' - ' + isnull(Company,'!') + N' - ' + LOCATION_TYPE in (select item + N' - ' + isnull(Company,'!') + N' - ' + isnull(LOCATION_TYPE,'!'+ N' - ' + isnull(ITEM_CLASS,'!')) from
		Conversion_ILC --where warehouse = @stwarehouse 
		where location_type is not null
		group by Item, Company,ITEM_CLASS, LOCATION_TYPE
			having COUNT(*) > 1 )
		
		set @iValidationError = 1;
	end

	--Verify Location Cap Records Doesn't already Exist in active table
	select @iRecordsAffected = count(*) from Conversion_ILC where Location + N'-' + warehouse in (select location + N'-' + warehouse from ITEM_LOCATION_CAPACITY) and warehouse = @stwarehouse

	if(@iRecordsAffected >0)
	begin
		RAISERROR(N'%d Location Already Exists in Warehouse',10,1,@iRecordsAffected);
		select N'Location Cap Record Already Exists in Warehouse',* 
		from Conversion_ILC where Location + N'-' + warehouse in (select location + N'-' + warehouse from ITEM_LOCATION_CAPACITY) and warehouse = @stwarehouse
		
		set @iValidationError = 1;
		--return;
	end

	select @iRecordsAffected = count(*) from Conversion_ILC where item + N' - ' + isnull(Company,'!') + N' - ' + LOCATION_TYPE in (select item + N' - ' + isnull(Company,'!') + N' - ' + LOCATION_TYPE from ITEM_LOCATION_CAPACITY)

	if(@iRecordsAffected >0)
	begin
		RAISERROR(N'%d Location Already Exists in Warehouse',10,1,@iRecordsAffected);
		select N'Location Cap Already Exists in Warehouse',* 
		from Conversion_ILC where item + N' - ' + isnull(Company,'!') + N' - ' + LOCATION_TYPE in (select item + N' - ' + isnull(Company,'!') + N' - ' + LOCATION_TYPE from ITEM_LOCATION_CAPACITY)
		
		set @iValidationError = 1;
		--return;
	end


	--Validate Missing Warehouse Records
	select @iRecordsAffected = COUNT(*) from Conversion_ILC where warehouse is null and location is not null;
	--set @iRecordsAffected;
	--print cast(@iRecordsAffected as nvarchar(25))

	if(@iRecordsAffected > 0)
	begin
		RAISERROR(N'%d Missing Warehouse', 10,1,@iRecordsAffected);
		select N'Missing Warehouse Records', * 
		from Conversion_ILC 
		where location_type is not null 
		and (warehouse + N'-' + location is not null
		or (warehouse is null and location is not null) 
		or (location is null and warehouse is not null));
		set @iValidationError = 1;
		--return;
	end

	-- Check Invalid Configuration Combintations Location Type + (WH or Location)

	select @iRecordsAffected = COUNT(*) from Conversion_ILC 
	where location_type is not null 
		and (warehouse + N'-' + location is not null
		or (warehouse is null and location is not null) 
		or (location is null and warehouse is not null));
	--set @iRecordsAffected;
	--print cast(@iRecordsAffected as nvarchar(25))

	if(@iRecordsAffected > 0)
	begin
		RAISERROR(N'%d Invalid Config. Select Either Location Type or Warehouse + Location', 10,1,@iRecordsAffected);
		select N'Invalid Config. Select Either Location Type or Warehouse + Location', warehouse + N'-' + location,(case 
																														when LOCATION_TYPE is not null and warehouse + N'-' + location is not null 
																														then 'Location Type & (WH/Location) on same record'
																														when warehouse is null and location is not null
																														then 'Location Type + (WH Null / Location not Null)'
																														when location is null and warehouse is not null
																														then 'Location Type + (Location null / WH not null)'
																													end)
		,* 
		from Conversion_ILC 
		where location_type is not null 
		and (warehouse + N'-' + location is not null
		or (warehouse is null and location is not null) 
		or (location is null and warehouse is not null));
		set @iValidationError = 1;
		--return;
	end

	--Invalid Location Type
	select @iRecordsAffected = COUNT(*) from Conversion_ILC where LOCATION_TYPE is not null 
	and LOCATION_TYPE not in (select location_type from location_type)

	--print cast(@iRecordsAffected as nvarchar(25))

	if(@iRecordsAffected > 0)
	begin
		RAISERROR(N'%d Invalid Location Type Records', 10,1,@iRecordsAffected);
		select distinct N'Invalid Location Type', LOCATION_TYPE  from Conversion_ILC where LOCATION_TYPE is not null 
			and LOCATION_TYPE not in (select location_type from location_type) order by LOCATION_TYPE
			
		set @iValidationError = 1;
		--return;
	end

	
	--Check for items that are not in the item master
	select @iRecordsAffected = COUNT(distinct item) from Conversion_ILC where item + N' - ' + isnull(Company,'!') not in (select item + N' - ' + isnull(Company,'!')  from item)

	if(@iRecordsAffected > 0)
	begin
		raiserror('%d Records found with items that do not exist in the item master', 10, 1, @iRecordsAffected);
		select distinct 'Item Does Not Exist', ITEM, COMPANY
		from Conversion_ILC 
		where item + N' - ' + isnull(Company,'!') not in (select item + N' - ' + isnull(Company,'!')  from item) order by ITEM, COMPANY
		
	end

	--Stamp items that don't exist
	UPDATE Conversion_ILC
	SET PROCESS_STAMP = 'ITEM DNE'
	WHERE item + N' - ' + isnull(Company,'!') not in (select item + N' - ' + isnull(Company,'!')  from item)

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' ITEM DNE';

	-- check for Companies that are not in Company Table
	select @iRecordsAffected = COUNT(*) from Conversion_ILC where isnull(Company,'!') not in (select Company  from Company) and company is not null

	if(@iRecordsAffected > 0)
	begin
		raiserror('%d Records found with Companies that do not exist in Company Table', 10, 1, @iRecordsAffected);
		select distinct 'Company Does Not Exist', COMPANY
		from Conversion_ILC where isnull(Company,'!') not in (select Company from Company) and company is not null order by COMPANY
		
	end

	--Stamp Company that don't exist
	UPDATE Conversion_ILC
	SET USER_STAMP = 'Company DNE'
	WHERE isnull(Company,'!') not in (select Company from Company) and company is not null

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' Company DNE';


	-- Records have invalid Quantity UM

	select @iRecordsAffected = COUNT(*) from Conversion_ILC where QUANTITY_UM not in (select IDENTIFIER from GENERIC_CONFIG_DETAIL where RECORD_TYPE = 'UMQUANTITY')

	if(@iRecordsAffected > 0)
	begin
		raiserror('%d Records with Invalid Quantity UM', 10, 1, @iRecordsAffected);
		select 'Invalid Quantity_UM',* from Conversion_ILC where QUANTITY_UM not in (select IDENTIFIER from GENERIC_CONFIG_DETAIL where RECORD_TYPE = 'UMQUANTITY')
			
			set @iValidationError = 1;
	end

	if(@iValidationError > 0)
	begin
		print N'Validation Errors Occured.  No Item Location Cap Records Loaded';
		return;
	end;

	select @iRecordsToProcess = count(*) from Conversion_ILC;
	print cast(@iRecordsAffected as nvarchar(25)) + N' Records to be imported into Staging_ILC Table'
	

	--Delete Warehouse records in CONV_INVENTORY
	delete from Staging_ILC;

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + N' Records Cleared for Staging_ILC'
	
	
	--Load Values into Staging_ILC

INSERT INTO Staging_ILC([Processed],[ITEM],[COMPANY],[LOCATION_TYPE],[MAXIMUM_QTY]
           ,[QUANTITY_UM],[MINIMUM_RPLN_PCT],[USER_DEF1],[USER_DEF2],[USER_DEF3],[USER_DEF4],[USER_DEF5],[USER_DEF6],[USER_DEF7],[USER_DEF8],[USER_STAMP],[PROCESS_STAMP],[DATE_TIME_STAMP],[MAXIMUM_RPLN_FILL_PCT],[warehouse],[LOCATION],[ITEM_CLASS],[MINIMUM_TOPOFF_RPLN_PCT])
  
	(select N'N' as processed, [ITEM],[COMPANY],[LOCATION_TYPE],[MAXIMUM_QTY]
           ,[QUANTITY_UM],[MINIMUM_RPLN_PCT],[USER_DEF1],[USER_DEF2],[USER_DEF3],[USER_DEF4],[USER_DEF5],[USER_DEF6],[USER_DEF7],[USER_DEF8],[USER_STAMP],[PROCESS_STAMP],getdate(),[MAXIMUM_RPLN_FILL_PCT],[warehouse],[LOCATION],[ITEM_CLASS],[MINIMUM_TOPOFF_RPLN_PCT] 
	from Conversion_ILC);

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + N' Records Inserted into Staging_ILC'

	-- UPDATE process_Stamp/user stamp w/ default values

	print N'Begin Update Staging Table Process Stamp / User Name w/ Default values for ' + @stWarehouse;

	update Staging_ILC
	set PROCESS_STAMP = 'Pop_ILC ' + cast(convert(date,getdate())as nvarchar)
	where PROCESS_STAMP is null;
	--and warehouse = @stWarehouse ;

	update Staging_ILC
	set USER_STAMP = 'System'
	where USER_STAMP is null;
	--and warehouse = @stWarehouse ;
	
	print N'Completed Update Staging Table Process Stamp / User Name w/ Default values for ' + @stWarehouse;
end
