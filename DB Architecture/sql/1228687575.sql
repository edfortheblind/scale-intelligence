-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */





















CREATE procedure [dbo].[POPULATE_INVENTORY_STAGING] (@stWarehouse nvarchar(25))
as 
begin

	declare @iRecordsAffected int;
	declare @iValidationError int;
	
	set @iRecordsAffected = -1;
	set @iValidationError = 0;


	print N'<literal:1>' + @stWarehouse;
	print N'<literal:2>' + @stWarehouse;

	-- [comment omitted]

	UPDATE conversion_inventory SET LPN = NULL WHERE LPN in ('<literal:3>','<literal:4>','<literal:5>');
	UPDATE conversion_inventory SET Item = NULL WHERE Item in ('<literal:6>','<literal:7>','<literal:8>');
	UPDATE conversion_inventory SET Inventory_sts = NULL WHERE Inventory_sts in ('<literal:9>','<literal:10>','<literal:11>');
	UPDATE conversion_inventory SET location = NULL WHERE location in ('<literal:12>','<literal:13>','<literal:14>');
	UPDATE conversion_inventory SET Warehouse = NULL WHERE Warehouse in ('<literal:15>','<literal:16>','<literal:17>');
	UPDATE conversion_inventory SET Serial_Number = NULL WHERE Serial_Number in ('<literal:18>','<literal:19>','<literal:20>');
	UPDATE conversion_inventory SET Company = NULL WHERE Company in ('<literal:21>','<literal:22>','<literal:23>');
	UPDATE conversion_inventory SET Lot = NULL WHERE Lot in ('<literal:24>','<literal:25>','<literal:26>');
	UPDATE conversion_inventory SET Parent_LPN = NULL WHERE Parent_LPN in ('<literal:27>','<literal:28>','<literal:29>');
	UPDATE conversion_inventory SET Received_date = NULL WHERE Received_date in ('<literal:30>','<literal:31>');
	UPDATE conversion_inventory SET old_location = NULL WHERE old_location in ('<literal:32>','<literal:33>','<literal:34>');
	UPDATE conversion_inventory SET internal_id = NULL WHERE internal_id in ('<literal:35>','<literal:36>','<literal:37>');
	UPDATE conversion_inventory SET user_stamp = NULL WHERE user_stamp in ('<literal:38>','<literal:39>','<literal:40>');
	UPDATE conversion_inventory SET process_stamp = NULL WHERE process_stamp in ('<literal:41>','<literal:42>','<literal:43>');
	UPDATE conversion_inventory SET date_time_stamp = NULL WHERE date_time_stamp in ('<literal:44>','<literal:45>');
	UPDATE conversion_inventory SET error = NULL WHERE error in ('<literal:46>','<literal:47>','<literal:48>');
	UPDATE conversion_inventory SET Quantity_UM = NULL WHERE Quantity_UM in ('<literal:49>','<literal:50>','<literal:51>');
	UPDATE conversion_inventory SET Weight = NULL WHERE Weight in ('<literal:52>','<literal:53>','<literal:54>');
	UPDATE conversion_inventory SET Weight_UM = NULL WHERE Weight_UM in ('<literal:55>','<literal:56>','<literal:57>');
	UPDATE conversion_inventory SET EXPIRY_DATE = NULL WHERE EXPIRY_DATE in ('<literal:58>','<literal:59>');
	UPDATE conversion_inventory SET Manufacture_date = NULL WHERE Manufacture_date in ('<literal:60>','<literal:61>');
	UPDATE conversion_inventory SET Pallet_type = NULL WHERE Pallet_type in ('<literal:62>','<literal:63>','<literal:64>');
	UPDATE conversion_inventory SET reason_code = NULL WHERE reason_code in ('<literal:65>','<literal:66>','<literal:67>');
	UPDATE conversion_inventory SET reason_description = NULL WHERE reason_description in ('<literal:68>','<literal:69>','<literal:70>');
	UPDATE conversion_inventory SET Position = NULL WHERE Position in ('<literal:71>','<literal:72>','<literal:73>');
	UPDATE conversion_inventory SET batch_number = NULL WHERE batch_number in ('<literal:74>','<literal:75>','<literal:76>');
	UPDATE conversion_inventory SET loc_inv_attribute_id = NULL WHERE loc_inv_attribute_id in ('<literal:77>','<literal:78>','<literal:79>');

	print N'<literal:80>' + @stWarehouse;

	-- [comment omitted]
	
	-- [comment omitted]

	set @iRecordsAffected = @@ROWCOUNT;

	print cast(@iRecordsAffected as nvarchar(25)) + '<literal:81>';

/* [comment omitted] */























































	-- [comment omitted]
	delete from INVENTORY_STAGING; 
	set @iRecordsAffected = @@ROWCOUNT;

	print cast(@iRecordsAffected as nvarchar(25)) + '<literal:82>';


	-- [comment omitted]
	insert into INVENTORY_STAGING (warehouse, item, COMPANY, location, quantity, QUANTITY_UM,
	lpn, lot, received_date, exp_date_lotdatetime, manufacture_date, status, user_stamp, process_stamp, date_time_stamp, user_def5,user_def3,user_def4,loc_inv_attribute_id)
	(select
		Warehouse,Item,company,Location,Quantity, quantity_um,LPN,Lot,received_date,EXPIRY_DATE,Manufacture_date,inventory_sts,'<literal:83>', '<literal:84>', GETDATE(),reason_code,reason_description,pallet_type, loc_inv_attribute_id

		-- [comment omitted]
	 from CONVERSION_INVENTORY where warehouse = @stWarehouse);

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + '<literal:85>';


	-- [comment omitted]

	select @iRecordsAffected = isnull((select distinct COUNT(*) 
	from INVENTORY_STAGING ii
	left join Warehouse c
	on c.Warehouse = ii.Warehouse
	where c.Warehouse is null),0)

	if(@iRecordsAffected > 0)
	begin
		raiserror('<literal:86>', 10, 1, @iRecordsAffected);
		select distinct N'<literal:87>', ii.company 
		from INVENTORY_STAGING ii
		left join Warehouse c
		on c.Warehouse = ii.Warehouse
		where c.Warehouse is null

		set @iValidationError = @iValidationError + 1;

	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + '<literal:88>';

	-- [comment omitted]

	select @iRecordsAffected = isnull((select COUNT(distinct ii.company) 
	from INVENTORY_STAGING ii
	left join company c
	on isnull(c.company,'<literal:89>') = isnull(ii.company,'<literal:90>')
	where c.company is null),0)

	if(@iRecordsAffected > 0)
	begin
		raiserror('<literal:91>', 10, 1, @iRecordsAffected);
		select distinct N'<literal:92>', ii.company 
		from INVENTORY_STAGING ii
		left join company c
		on isnull(c.company,'<literal:93>') = isnull(ii.company,'<literal:94>')
		where c.company is null

		set @iValidationError = @iValidationError + 1;

	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + '<literal:95>';


	-- [comment omitted]
	update ii 
	set ii.ITEM_DESCRIPTION = i.description, 
	ii.lot_tracked = i.LOT_CONTROLLED

	from inventory_staging ii
	inner join item i
	on ii.item = i.item 
	and isnull(ii.COMPANY,'<literal:96>') = isnull(i.COMPANY,'<literal:97>')
	;

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + '<literal:98>';

	-- [comment omitted]
	select @iRecordsAffected = isnull((select count(*)
	from INVENTORY_STAGING ii
	where isnull(II.STATUS,'<literal:99>') not in (select identifier from GENERIC_CONFIG_DETAIL g where record_type = '<literal:100>')),0)

	if(@iRecordsAffected > 0)
	begin
		raiserror('<literal:101>', 10, 1, @iRecordsAffected);
		select '<literal:102>',* 
		from INVENTORY_STAGING ii
		where isnull(II.STATUS,'<literal:103>') not in (select identifier from GENERIC_CONFIG_DETAIL g where record_type = '<literal:104>')
		order by ii.STATUS,ii.location

		set @iValidationError = @iValidationError + 1;
	end 

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + '<literal:105>';
	
	-- [comment omitted]
	select @iRecordsAffected = isnull((select COUNT(*) 
	from INVENTORY_STAGING ii
	inner join item i
	on ii.item = i.item
	and isnull(ii.COMPANY,'<literal:106>') = isnull(i.COMPANY,'<literal:107>')
	inner join ITEM_UNIT_OF_MEASURE ium
	on ii.item = ium.item and ium.sequence = 1 
	and isnull(ii.quantity_um,'<literal:108>') <> ium.quantity_um
	and isnull(ii.company, '<literal:109>') = isnull(ium.company, '<literal:110>')),0);

	if(@iRecordsAffected > 0)
	begin
		raiserror('<literal:111>', 10, 1, @iRecordsAffected);
		select '<literal:112>', ii.item, ii.company, ii.location, ii.quantity_um as LocationInventoryUM, ium.quantity_um as ItemUnitOfMeasureUM, ii.QUANTITY,ii.DATE_TIME_STAMP, i.LOT_CONTROLLED,i.STORAGE_TEMPLATE, ii.LPN
		from INVENTORY_STAGING ii
		inner join item i
		on ii.item = i.item
		and isnull(ii.COMPANY,'<literal:113>') = isnull(i.COMPANY,'<literal:114>')
		inner join ITEM_UNIT_OF_MEASURE ium
		on ii.item = ium.item and ium.sequence = 1 
		and isnull(ii.quantity_um,'<literal:115>') <> ium.quantity_um
		and isnull(ii.company, '<literal:116>') = isnull(ium.company, '<literal:117>')

		order by ii.item,ii.COMPANY,ii.location,ii.lpn

		set @iValidationError = @iValidationError + 1;
	end
	
	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + '<literal:118>';


	-- [comment omitted]
	select @iRecordsAffected = isnull((select COUNT(*) from INVENTORY_STAGING where LOT_TRACKED = '<literal:119>' and LOT is null 
	and LOCATION in (SELECT LOCATION FROM LOCATION WHERE TRACK_CONTAINERS = '<literal:120>')),0);

	if(@iRecordsAffected > 0)
	begin
		raiserror('<literal:121>', 10, 1, @iRecordsAffected);
		select '<literal:122>', ITEM, LOCATION, LOT, LOT_TRACKED, LPN from INVENTORY_STAGING where LOT_TRACKED = '<literal:123>' and LOT is null and LOCATION in (SELECT LOCATION from LOCATION where TRACK_CONTAINERS = '<literal:124>') order by LOCATION, ITEM

		set @iValidationError = @iValidationError + 1;	
	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + '<literal:125>' ;

	-- [comment omitted]
	select @iRecordsAffected = isnull((select COUNT(*) from INVENTORY_STAGING where LOT_TRACKED = '<literal:126>' and LOT is not null),0);

	if(@iRecordsAffected > 0)
	begin
		raiserror('<literal:127>', 10, 1, @iRecordsAffected);
		select '<literal:128>', ITEM,COMPANY, LOCATION, LOT, LOT_TRACKED, LPN from INVENTORY_STAGING where LOT_TRACKED = '<literal:129>' and LOT is not null order by LOCATION, ITEM
		
		set @iValidationError = @iValidationError + 1;
	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + '<literal:130>';

	-- [comment omitted]
	select @iRecordsAffected = isnull((select COUNT(*) from INVENTORY_STAGING where LOCATION not in (select location from LOCATION where warehouse = @stWarehouse)),0)

	if(@iRecordsAffected > 0)
	begin
		raiserror('<literal:131>', 10, 1, @iRecordsAffected);
		select '<literal:132>', ITEM, LOCATION, -- [comment omitted]
		LPN from INVENTORY_STAGING where LOCATION not in (select location from LOCATION where warehouse = @stWarehouse) order by LOCATION, ITEM
		
		set @iValidationError = @iValidationError + 1;
	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + '<literal:133>';

	-- [comment omitted]
	select @iRecordsAffected = isnull((select COUNT(*) from INVENTORY_STAGING where LOCATION in (select location from LOCATION where active = '<literal:134>' and warehouse = @stWarehouse)),0)

	if(@iRecordsAffected > 0)
	begin
		raiserror('<literal:135>', 10, 1, @iRecordsAffected);
		select '<literal:136>', ITEM, LOCATION, -- [comment omitted]
		LPN from INVENTORY_STAGING where LOCATION in (select location from LOCATION where active = '<literal:137>' and warehouse = @stWarehouse) order by LOCATION, ITEM
		
		set @iValidationError = @iValidationError + 1;
	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + '<literal:138>';


	-- [comment omitted]
	-- [comment omitted]

	-- [comment omitted]

	-- [comment omitted]
	-- [comment omitted]

	-- [comment omitted]
	-- [comment omitted]

	-- [comment omitted]
	-- [comment omitted]


	-- [comment omitted]
	select @iRecordsAffected = isnull((select COUNT(*) from INVENTORY_STAGING where LPN is null and location in (select location from LOCATION where warehouse = @stWarehouse and track_containers = '<literal:139>')),0)

	if(@iRecordsAffected > 0)
	begin
		raiserror('<literal:140>', 10, 1, @iRecordsAffected);
		select '<literal:141>', ITEM, LOCATION, LPN, LOT, LOT_TRACKED 
		from INVENTORY_STAGING where LPN is null and location in (select location from LOCATION where warehouse = @stWarehouse	 and track_containers = '<literal:142>') order by LOCATION, ITEM
		
		set @iValidationError = @iValidationError + 1;
	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + '<literal:143>';


	-- [comment omitted]
	select @iRecordsAffected = isnull((select COUNT(*) from INVENTORY_STAGING where LPN is not null and location in (select location from LOCATION where warehouse = @stWarehouse and track_containers = '<literal:144>')),0)

	if(@iRecordsAffected > 0)
	begin
		raiserror('<literal:145>', 10, 1, @iRecordsAffected);
		select '<literal:146>', ITEM, LOCATION, LPN, LOT, LOT_TRACKED 
		from INVENTORY_STAGING where LPN is not null and location in (select location from LOCATION where warehouse = @stWarehouse and track_containers = '<literal:147>') order by LOCATION, ITEM
		
		set @iValidationError = @iValidationError + 1;
	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + '<literal:148>';

	-- [comment omitted]
	select @iRecordsAffected = isnull((select COUNT(*) 	
	from INVENTORY_STAGING ii
	left join item i
	on ii.item = i.item
	and isnull(ii.COMPANY,'<literal:149>') = isnull(i.COMPANY,'<literal:150>')
	where i.item is null),0)

	if(@iRecordsAffected > 0)
	begin
		raiserror('<literal:151>', 10, 1, @iRecordsAffected);
		select '<literal:152>', ii.ITEM, ii.COMPANY, ii.LOCATION, ii.LPN, ii.LOT, ii.LOT_TRACKED 
		from INVENTORY_STAGING ii
		left join item i
		on ii.item = i.item
		and isnull(ii.COMPANY,'<literal:153>') = isnull(i.COMPANY,'<literal:154>')
		where i.item is null
		order by ii.LOCATION, ii.ITEM
		
		set @iValidationError = @iValidationError + 1;

		-- [comment omitted]
		UPDATE ii
		SET USER_DEF2 = '<literal:155>'
		from INVENTORY_STAGING ii
		left join item i
		on ii.item = i.item
		and isnull(ii.COMPANY,'<literal:156>') = isnull(i.COMPANY,'<literal:157>')
		where i.item is null

		-- [comment omitted]
		UPDATE ii
		SET ERROR = '<literal:158>'
		from CONVERSION_INVENTORY ii
		left join item i
		on ii.item = i.item
		and isnull(ii.COMPANY,'<literal:159>') = isnull(i.COMPANY,'<literal:160>')
		where i.item is null
		
		set @iRecordsAffected = @@ROWCOUNT;
		print cast(@iRecordsAffected as nvarchar(25)) + '<literal:161>';
	end

	set @iRecordsAffected = 0;
	
	-- [comment omitted]
	select @iRecordsAffected = isnull(sum(count_item),0)
	from (select isnull(count(distinct item),0) count_item,location 
		  from INVENTORY_STAGING where warehouse = @stWarehouse and location in (select location from location where location.warehouse = @stWarehouse and multi_item = '<literal:162>') group by location having count(distinct item) > 1) MISIL

	if(@iRecordsAffected > 0)
	begin
		raiserror('<literal:163>', 10, 1, @iRecordsAffected);
		select '<literal:164>', ITEM, LOCATION, LOT, LPN,*
		from INVENTORY_STAGING where location in (select location from inventory_staging where warehouse = @stWarehouse and location in (select location from location where location.warehouse = @stWarehouse and multi_item = '<literal:165>') group by location having count(distinct item) > 1) 
		ORDER BY 2,3
		
		set @iValidationError = @iValidationError + 1;
	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + '<literal:166>';


	-- [comment omitted]
	select @iRecordsAffected = isnull(sum(count_lpn),0)
	-- [comment omitted]
	from ( select (select count(distinct location)
					from inventory_staging 
					where warehouse = @stWarehouse
					and lpn is not null 
					group by lpn 
					having count(distinct location) > 1) count_lpn) SLIML

	if(@iRecordsAffected > 0)
	begin
		raiserror('<literal:167>', 10, 1, @iRecordsAffected);
		select '<literal:168>', ITEM, LOCATION, LOT, LPN
		 from INVENTORY_STAGING where LPN is not null and LPN in (select LPN from inventory_staging where warehouse = @stWarehouse group by lpn having count(distinct location) > 1) 	
		 ORDER BY LPN,LOCATION

		 set @iValidationError = @iValidationError + 1;
	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + '<literal:169>';

	-- [comment omitted]
	select @iRecordsAffected = isnull((select count(*) from INVENTORY_STAGING ii 
		where ii.lpn in (select ii.lpn from INVENTORY_STAGING ii WHERE LPN IS NOT NULL group by ii.lpn,ii.item,ii.warehouse,ii.COMPANY,ii.LOT having count(*)>1)
		OR ISNULL(II.LPN,'<literal:170>') + N'<literal:171>'+ ii.item + N'<literal:172>'+ ii.warehouse + N'<literal:173>'+ isnull(ii.COMPANY,'<literal:174>') + N'<literal:175>'+ ISNULL(ii.LOT,'<literal:176>') + N'<literal:177>'+ location in 
			(select ISNULL(II.LPN,'<literal:178>') + N'<literal:179>'+ ii.item + N'<literal:180>'+ ii.warehouse + N'<literal:181>'+ ISNULL(ii.COMPANY,'<literal:182>') + N'<literal:183>'+ ISNULL(ii.LOT,'<literal:184>') + N'<literal:185>'+ location
			from INVENTORY_STAGING ii 
			group by ii.lpn,ii.item,ii.warehouse,ii.COMPANY,ii.LOT, location,loc_inv_attribute_id having count(*)>1)),0)

	if(@iRecordsAffected > 0)
	begin
		raiserror('<literal:186>', 10, 1, @iRecordsAffected);
		select '<literal:187>', ii.warehouse,ii.Location,ii.lpn,ii.item,ii.company,ii.lot,ii.Quantity,ii.Quantity_UM
		from INVENTORY_STAGING ii
		where ii.lpn in (select ii.lpn from INVENTORY_STAGING ii WHERE LPN IS NOT NULL group by ii.lpn,ii.item,ii.warehouse,ii.COMPANY,ii.LOT having count(*)>1)
		OR ISNULL(II.LPN,'<literal:188>') + N'<literal:189>'+ ii.item + N'<literal:190>'+ ii.warehouse + N'<literal:191>'+ ISNULL(ii.COMPANY,'<literal:192>') + N'<literal:193>'+ ISNULL(ii.LOT,'<literal:194>') + N'<literal:195>'+ location in 
			(select ISNULL(II.LPN,'<literal:196>') + N'<literal:197>'+ ii.item + N'<literal:198>'+ ii.warehouse + N'<literal:199>'+ ISNULL(ii.COMPANY,'<literal:200>') + N'<literal:201>'+ ISNULL(ii.LOT,'<literal:202>') + N'<literal:203>'+ location
			from INVENTORY_STAGING ii 
			group by ii.lpn,ii.item,ii.warehouse,ii.COMPANY,ii.LOT, location having count(*)>1)
		order by ii.location,ii.LPN, ii.item, ii.LOT,loc_inv_attribute_id

		set @iValidationError = @iValidationError + 1;
	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + '<literal:204>';

	-- [comment omitted]
	select @iRecordsAffected = isnull((select COUNT(*) from INVENTORY_STAGING i
	where i.lpn in( select ii.lpn from INVENTORY_STAGING II WHERE II.LOT_TRACKED = '<literal:205>' AND II.LPN IS NOT NULL GROUP BY II.LPN HAVING COUNT(DISTINCT LOT)>1)),0)

	if(@iRecordsAffected>0)
	begin 
		raiserror('<literal:206>', 10, 1, @iRecordsAffected);
		select '<literal:207>', ii.warehouse,ii.item, ii.lpn,ii.item,ii.company,ii.lot,ii. Location,ii.Quantity_UM,ii.Quantity
		from INVENTORY_STAGING ii
		where ii.lpn in (select ii.lpn FROM INVENTORY_STAGING II WHERE II.LOT_TRACKED = '<literal:208>' AND II.LPN IS NOT NULL GROUP BY II.LPN HAVING COUNT(DISTINCT LOT)>1)
		order by ii.location,ii.LPN

		set @iValidationError = @iValidationError + 1;
	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + '<literal:209>';

	-- [comment omitted]
	select @iRecordsAffected = isnull((select COUNT(*)
										from INVENTORY_STAGING LI
										join location l 
										on l.LOCATION = li.LOCATION
										and l.warehouse = li.WAREHOUSE
										-- [comment omitted]
										JOIN item_location_assignment ila 
										ON ila.allocation_loc = LI.location 
										and ila.warehouse = LI.WAREHOUSE
										where LI.item <> ILA.ITEM
										and isnull(li.company,'<literal:210>') = ISNULL(ila.COMPANY,'<literal:211>')
										and l.MULTI_ITEM = '<literal:212>'
										and li.WAREHOUSE = @stWarehouse),0)

	if(@iRecordsAffected > 0)
	begin
		raiserror(N'<literal:213>', 10, 1, @iRecordsAffected);
		
		select N'<literal:214>', 
		-- [comment omitted]
		ila.ITEM, ila.ALLOCATION_LOC, ila.warehouse, li.*
		-- [comment omitted]

		from INVENTORY_STAGING LI
		join location l 
		on l.LOCATION = li.LOCATION
		and l.warehouse = li.WAREHOUSE
		-- [comment omitted]
		JOIN item_location_assignment ila 
		ON ila.allocation_loc = LI.location 
		and ila.warehouse = LI.WAREHOUSE
		where LI.item <> ILA.ITEM
		and isnull(li.company,'<literal:215>') = ISNULL(ila.COMPANY,'<literal:216>')
		and l.MULTI_ITEM = '<literal:217>'
		and li.WAREHOUSE = @stWarehouse
		
		ORDER BY 2



		set @iValidationError = @iValidationError + 1;
	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + '<literal:218>';

	-- [comment omitted]
	select distinct @iRecordsAffected = isnull((select count(*) FROM INVENTORY_STAGING I LEFT JOIN LOCATION_INVENTORY LI ON I.WAREHOUSE = LI.warehouse	and i.LOCATION = li.LOCATION left join location l	on l.LOCATION = li.LOCATION	where li.item + '<literal:219>' + ISNULL(li.COMPANY,'<literal:220>') != i.ITEM + '<literal:221>' + ISNULL(i.COMPANY,'<literal:222>') and l.MULTI_ITEM = '<literal:223>'	and li.PERMANENT = '<literal:224>'	and li.warehouse = @stWarehouse),0)

	if(@iRecordsAffected > 0)
	begin
		raiserror('<literal:225>', 10, 1, @iRecordsAffected);
		select distinct '<literal:226>', I.WAREHOUSE,I.LOCATION, i.item + '<literal:227>' + ISNULL(i.COMPANY,'<literal:228>') [Staging_Inventory.Item/Company], li.ITEM + '<literal:229>' + isnull(li.COMPANY,'<literal:230>') [location_inventory.Item/Company]
		FROM INVENTORY_STAGING I 
		LEFT JOIN LOCATION_INVENTORY LI
		ON I.WAREHOUSE = LI.warehouse
		and i.LOCATION = li.LOCATION
		left join location l
		on l.LOCATION = li.LOCATION
		where li.item + '<literal:231>' + isnull(li.COMPANY,'<literal:232>') != i.ITEM + '<literal:233>' + isnull(i.COMPANY,'<literal:234>')
		and l.MULTI_ITEM = '<literal:235>'
		and li.PERMANENT = '<literal:236>'
		and li.warehouse = @stWarehouse

		order by I.LOCATION,4,5

		set @iValidationError = @iValidationError + 1;
	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + '<literal:237>';

	-- [comment omitted]
	select @iRecordsAffected = isnull((select count(*) 
										from INVENTORY_STAGING ii 
										where loc_inv_attribute_id is not null
										group by loc_inv_attribute_id
										having count(*)>1),0)

	if(@iRecordsAffected > 0)
	begin
		raiserror('<literal:238>', 10, 1, @iRecordsAffected);
		select '<literal:239>', *
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
	print cast(@iRecordsAffected as nvarchar(25)) + '<literal:240>';

	-- [comment omitted]
	select @iRecordsAffected = isnull((select count(*) 
										from INVENTORY_STAGING ii 
										join location l 
										on ii.LOCATION = l.LOCATION
										and ii.WAREHOUSE = l.warehouse
										where loc_inv_attribute_id is not null
										and l.TRACK_CONTAINERS = '<literal:241>'
										group by loc_inv_attribute_id
										having count(*)>1),0)

	if(@iRecordsAffected > 0)
	begin
		raiserror('<literal:242>', 10, 1, @iRecordsAffected);
		select '<literal:243>', *
		from INVENTORY_STAGING ii
		where loc_inv_attribute_id in (select count(*) 
									   from INVENTORY_STAGING ii 
									   join location l 
									   on ii.LOCATION = l.LOCATION
									   and ii.WAREHOUSE = l.warehouse
									   where loc_inv_attribute_id is not null
									   and l.TRACK_CONTAINERS = '<literal:244>'
									   group by loc_inv_attribute_id
									   having count(*)>1)
		order by 2 asc

		set @iValidationError = @iValidationError + 1;
	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + '<literal:245>';


	if(@iValidationError >0)
	begin 
		update inventory_staging 
		set user_Def1 = '<literal:246>'


		-- [comment omitted]
		print cast(@iValidationError as nvarchar(25)) + '<literal:247>';
	end

end;
