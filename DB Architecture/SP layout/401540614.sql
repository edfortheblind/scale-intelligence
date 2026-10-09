
/*
	Task	| By	| Date			| Modification Description
	---------------------------------------------------------------
	AI0018	| AG	| 12/13/2016	| Created.
	AI0018	| AG	| 09/19/2020	| Add Check for Null / Not Null ILA Qty UM Record. Group Dup Check by Qty UM 
	AI0018	| AG	| 01/17/2022	| revised Different Item than Assigned to Location (Perm Locn) to filer out multi item locations
	

*/



-- exec POPULATE_Staging_ILA '300'

CREATE procedure [dbo].[POPULATE_Staging_ILA] (@stWarehouse nvarchar(25))
as 
begin

	declare @iRecordsAffected int;
	declare @iValidationError int;
	declare @iRecordsToProcess int;

	print N'Processing Warehouse: ' + @stWarehouse;
	print N'Scrubbing Data for Null and Blank Values Started: ' + @stWarehouse;

	-- scrub data for null and blank values

	
	--UPDATE Conversion_ILA SET INTERNAL_ITEM_CAPACITY_NUM = NULL WHERE INTERNAL_ITEM_CAPACITY_NUM in (' ','','Null')
	
	UPDATE Conversion_ILA SET warehouse = NULL WHERE warehouse in (' ','','Null')
	UPDATE Conversion_ILA SET ITEM = NULL WHERE ITEM in (' ','','Null')
	UPDATE Conversion_ILA SET COMPANY = NULL WHERE COMPANY in (' ','','Null')
	UPDATE Conversion_ILA SET QUANTITY_UM = NULL WHERE QUANTITY_UM in (' ','','Null')
	UPDATE Conversion_ILA SET ALLOCATION_LOC = NULL WHERE ALLOCATION_LOC in (' ','','Null')
	UPDATE Conversion_ILA SET USER_DEF1 = NULL WHERE USER_DEF1 in (' ','','Null')
	UPDATE Conversion_ILA SET USER_DEF2 = NULL WHERE USER_DEF2 in (' ','','Null')
	UPDATE Conversion_ILA SET USER_DEF3 = NULL WHERE USER_DEF3 in (' ','','Null')
	UPDATE Conversion_ILA SET USER_DEF4 = NULL WHERE USER_DEF4 in (' ','','Null')
	UPDATE Conversion_ILA SET USER_DEF5 = NULL WHERE USER_DEF5 in (' ','','Null')
	UPDATE Conversion_ILA SET USER_DEF6 = NULL WHERE USER_DEF6 in (' ','','Null')
	
	UPDATE Conversion_ILA SET USER_STAMP = NULL WHERE USER_STAMP in (' ','','Null')
	UPDATE Conversion_ILA SET PROCESS_STAMP = NULL WHERE PROCESS_STAMP in (' ','','Null')
	
	UPDATE Conversion_ILA SET USER_DEF7 = 0 WHERE USER_DEF7 IS NULL
	UPDATE Conversion_ILA SET USER_DEF8 = 0 WHERE USER_DEF8 IS NULL

	print N'Scrubbing Data for Null and Blank Values Completed: ' + @stWarehouse;

	-- delete empty records where WH, Item, Company are null
	delete from Conversion_ILA
	where warehouse is null
	and item is null 
	and allocation_loc is null

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + N' deleted empty records where WH, Item, Company are null'


	--Verify that no duplicate records exist;
	select @iRecordsAffected = count(*) 
		from Conversion_ILA 
		where WAREHOUSE = @stWarehouse
		group by warehouse, ALLOCATION_LOC, item, company,QUANTITY_UM
			having COUNT(*) > 1
	--set @iRecordsAffected = @@ROWCOUNT;
	--print cast(@iRecordsAffected as nvarchar(25))

	if(@iRecordsAffected > 0)
	begin
		RAISERROR(N'%d Duplicate ILA Records Found', 10,1,@iRecordsAffected);
		select N'Duplicate Records: ILA' , item,allocation_loc,company, warehouse
		from Conversion_ILA 
		where WAREHOUSE = @stWarehouse
		group by warehouse, ALLOCATION_LOC, item, company
			having COUNT(*) > 1

			set @iValidationError = 1;
		--return;
	end

	--Verify ALLOCATION_LOC Records Doesn't already Exist in active table
	select @iRecordsAffected = count(*) from Conversion_ILA a 
	inner join item_location_assignment i 
	on a.allocation_loc = i.ALLOCATION_LOC
	and a.item = i.item
	and isnull(a.company,'!') = isnull(i.COMPANY,'!')
	where a.warehouse = @stWarehouse
	

	if(@iRecordsAffected >0)
	begin
		RAISERROR(N'%d ILA Record Already Exists in Warehouse',10,1,@iRecordsAffected);
		select N'ILA Record Already Exists in Warehouse',* 
		from Conversion_ILA a 
		inner join item_location_assignment i 
		on a.allocation_loc = i.ALLOCATION_LOC
		and a.item = i.item
		and isnull(a.company,'!') = isnull(i.COMPANY,'!')
		where a.warehouse = @stWarehouse

		set @iValidationError = 1;
		--return;
	end


	-- Validate if Multi ILA Items Single Item Location

	select @iRecordsAffected = count(distinct item) from Conversion_ILA where warehouse = @stWarehouse and allocation_loc in (select location from location where location.warehouse = @stWarehouse and multi_item = 'N') group by allocation_loc having count(distinct item) > 1 

	if(@iRecordsAffected > 0)
	begin
		raiserror('%d Records found with more than one item in a single item location', 10, 1, @iRecordsAffected);
		select 'More than one item in a Single Item Location', ITEM, company, allocation_loc
		from Conversion_ILA where allocation_loc in (select allocation_loc from Conversion_ILA where warehouse = @stWarehouse and allocation_loc in (select location from location where location.warehouse = @stWarehouse and multi_item = 'N') group by allocation_loc having count(distinct item) > 1) 
		
		set @iValidationError = 1;
	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' More than one item in a Single Item Location';


	--Check for items going to a location that is assigned to a different item (Perm Locn)
	select @iRecordsAffected = COUNT(*) 
	--from Conversion_ILA 
	--where item <> isnull((select ila.item from item_location_assignment ila where ila.allocation_loc = Conversion_ILA.allocation_loc and ila.warehouse =
	--@stWarehouse ), item)

	FROM Conversion_ILA CILA
	JOIN LOCATION L 
	ON CILA.ALLOCATION_LOC = L.LOCATION
	AND CILA.warehouse = L.warehouse
	LEFT JOIN ITEM_LOCATION_ASSIGNMENT ILA
	ON CILA.ALLOCATION_LOC = ILA.ALLOCATION_LOC
	AND CILA.warehouse = ILA.warehouse

	WHERE L.MULTI_ITEM = 'N'
	AND CILA.ITEM <> ILA.ITEM
	AND ISNULL(CILA.COMPANY,'!') = ISNULL(ILA.COMPANY,'!')
	AND CILA.warehouse = @stWarehouse


	if(@iRecordsAffected > 0)
	begin
		raiserror(N'%d Records found with items going to a location assigned to a different item (Perm Locn)', 10, 1, @iRecordsAffected);
		select N'Different Item than Assigned to Location (Perm Locn)'
		--, (select item from item_location_assignment ila 
		--where ila.allocation_loc = Conversion_ILA.allocation_loc and ila.warehouse = @stWarehouse /*and ila.allocation_loc <> 'OSR'*/) as assigned_item,* from Conversion_ILA where item <> isnull((select item from item_location_assignment ila where ila.allocation_loc = Conversion_ILA.allocation_loc and ila.warehouse = @stWarehouse ), item)
		, ILA.ITEM AS assigned_item, ila.*
		FROM Conversion_ILA CILA
		JOIN LOCATION L 
		ON CILA.ALLOCATION_LOC = L.LOCATION
		AND CILA.warehouse = L.warehouse
		LEFT JOIN ITEM_LOCATION_ASSIGNMENT ILA
		ON CILA.ALLOCATION_LOC = ILA.ALLOCATION_LOC
		AND CILA.warehouse = ILA.warehouse

		WHERE L.MULTI_ITEM = 'N'
		AND CILA.ITEM <> ILA.ITEM
		AND ISNULL(CILA.COMPANY,'!') = ISNULL(ILA.COMPANY,'!')
		AND CILA.warehouse = @stWarehouse

		
		set @iValidationError = 1;
	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' Different Item than Assigned to Location (Perm Locn)';

	--Check for Different Item than Currently in Single Item Location (Non-Perm Locn) 
	select distinct @iRecordsAffected = count(*) FROM Conversion_ILA I LEFT JOIN LOCATION_INVENTORY LI ON I.WAREHOUSE = LI.warehouse	and i.Allocation_loc = li.LOCATION left join location l	on l.LOCATION = li.LOCATION	where li.item + ' ' + isnull(li.COMPANY,'!') != i.ITEM + ' ' + isnull(i.COMPANY,'!') and l.MULTI_ITEM = 'N'	and li.PERMANENT = 'N'	and li.warehouse = @stWarehouse 

	if(@iRecordsAffected > 0)
	begin
		raiserror('%d Records found with Different Item than Currently in Single Item Location (Non-Perm Locn)', 10, 1, @iRecordsAffected);
		select distinct 'Different Item than Currently in Single Item Location (Non-Perm Locn)', I.WAREHOUSE,I.allocation_loc, li.item + ' ' + isnull(li.COMPANY,'!') [Location_Inventory.Item/Company], i.ITEM + ' ' + isnull(i.COMPANY,'!') [Conversion_ILA.Item/Company]
		FROM Conversion_ILA I 
		LEFT JOIN LOCATION_INVENTORY LI
		ON I.WAREHOUSE = LI.warehouse
		and i.allocation_loc = li.LOCATION
		left join location l
		on l.LOCATION = li.LOCATION
		where li.item + ' ' + isnull(li.COMPANY,'!') != i.ITEM + ' ' + isnull(i.COMPANY,'!')
		and l.MULTI_ITEM = 'N'
		and li.PERMANENT = 'N'
		and li.warehouse = @stWarehouse

		set @iValidationError = 1;
	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' Different Item than Currently in Single Item Location (Non-Perm Locn)';



	--Validate Missing Warehouse Records
	select @iRecordsAffected = COUNT(*) from Conversion_ILA where warehouse is null and ALLOCATION_LOC is not null;
	--set @iRecordsAffected;
	--print cast(@iRecordsAffected as nvarchar(25))

	if(@iRecordsAffected > 0)
	begin
		RAISERROR(N'%d Missing Warehouse', 10,1,@iRecordsAffected);
		select N'Missing Warehouse Records', * from Conversion_ILA where warehouse is null and ALLOCATION_LOC is not null;
		set @iValidationError = 1;
		--return;
	end

	
	-- Location DNE
	select @iRecordsAffected = COUNT(*) from Conversion_ILA where ALLOCATION_LOC not in (select location from location where warehouse = @stWarehouse)

	if(@iRecordsAffected > 0)
	begin
		raiserror('%d Records found without valid Locations', 10, 1, @iRecordsAffected);
		select 'Location does not exist', ITEM, company,ALLOCATION_LOC from Conversion_ILA where ALLOCATION_LOC not in (select location from LOCATION where warehouse = @stWarehouse) order by allocation_loc, ITEM
		
		set @iValidationError = 1;
	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' Location does not exist';

	
	--Check for items that are not in the item master
	select @iRecordsAffected = COUNT(distinct item) from Conversion_ILA where item + N' - ' + isnull(Company,'!') not in (select item + N' - ' + isnull(Company,'!')  from item)

	if(@iRecordsAffected > 0)
	begin
		raiserror('%d Records found with items that do not exist in the item master', 10, 1, @iRecordsAffected);
		select distinct 'Item Does Not Exist', ITEM, COMPANY
		from Conversion_ILA 
		where item + N' - ' + isnull(Company,'!') not in (select item + N' - ' + isnull(Company,'!')  from item) order by ITEM, COMPANY
		
	end

	--Stamp items that don't exist
	UPDATE Conversion_ILA
	SET PROCESS_STAMP = 'ITEM DNE'
	WHERE item + N' - ' + isnull(Company,'!') not in (select item + N' - ' + isnull(Company,'!')  from item)

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' ITEM DNE';

	-- check for Companies that are not in Company Table
	select @iRecordsAffected = COUNT(*) from Conversion_ILA where Company not in (select Company  from Company) and company is not null

	if(@iRecordsAffected > 0)
	begin
		raiserror('%d Records found with Companies that do not exist in Company Table', 10, 1, @iRecordsAffected);
		select distinct 'Company Does Not Exist', COMPANY
		from Conversion_ILA where Company not in (select Company from Company) and company is not null order by COMPANY

		
	end

	--Stamp Company that don't exist
	UPDATE Conversion_ILA
	SET USER_STAMP = 'Company DNE'
	WHERE Company not in (select Company from Company) and company is not null

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' Company DNE';


	-- Records have valid Quantity UM

	select @iRecordsAffected = COUNT(*) from Conversion_ILA where QUANTITY_UM not in (select IDENTIFIER from GENERIC_CONFIG_DETAIL where RECORD_TYPE = 'UMQUANTITY')

	if(@iRecordsAffected > 0)
	begin
		raiserror('%d Records with Invalid Quantity UM', 10, 1, @iRecordsAffected);
		select 'Invalid Quantity_UM',* from Conversion_ILA where QUANTITY_UM not in (select IDENTIFIER from GENERIC_CONFIG_DETAIL where RECORD_TYPE = 'UMQUANTITY')

	end

	if(@iValidationError > 0)
	begin
		print N'Validation Errors Occured.  No Item Location Assignment Records Loaded';
		return;
	end;

	select @iRecordsToProcess = count(*) from Conversion_ILA;
	print cast(@iRecordsAffected as nvarchar(25)) + N' Records to be imported into Staging_ILA Table'
	

	--Delete Warehouse records in CONV_INVENTORY
	delete from Staging_ILA;

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + N' Records Cleared for Staging_ILA'
	
	
	--Load Values into Staging_ILA

INSERT INTO Staging_ILA([Processed],[warehouse],[ITEM],[COMPANY],[QUANTITY_UM],[ALLOCATION_LOC],[USER_DEF1],[USER_DEF2],[USER_DEF3],[USER_DEF4],[USER_DEF5],[USER_DEF6],[USER_DEF7],[USER_DEF8],[USER_STAMP],[PROCESS_STAMP],[DATE_TIME_STAMP]
)
  
	(select N'N' as processed, [warehouse],[ITEM],[COMPANY],[QUANTITY_UM],[ALLOCATION_LOC],[USER_DEF1],[USER_DEF2],[USER_DEF3],[USER_DEF4],[USER_DEF5],[USER_DEF6],[USER_DEF7],[USER_DEF8],[USER_STAMP],[PROCESS_STAMP],getdate() 
	from Conversion_ILA
	where warehouse = @stWarehouse);

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + N' Records Inserted into Staging_ILA'

	-- UPDATE process_Stamp/user stamp w/ default values

	print N'Begin Update Staging Table Process Stamp / User Name w/ Default values for ' + @stWarehouse;

	update Staging_ILA
	set PROCESS_STAMP = 'Pop_ILA ' + cast(convert(date,getdate())as nvarchar)
	where PROCESS_STAMP is null
	and warehouse = @stWarehouse ;

	update Staging_ILA
	set USER_STAMP = 'System'
	where USER_STAMP is null
	and warehouse = @stWarehouse ;
	
	print N'Completed Update Staging Table Process Stamp / User Name w/ Default values for ' + @stWarehouse;
end
