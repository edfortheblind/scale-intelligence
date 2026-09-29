-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */











-- [comment omitted]

CREATE procedure [dbo].[POPULATE_Staging_ILA] (@stWarehouse nvarchar(25))
as 
begin

	declare @iRecordsAffected int;
	declare @iValidationError int;
	declare @iRecordsToProcess int;

	print N'<literal:1>' + @stWarehouse;
	print N'<literal:2>' + @stWarehouse;

	-- [comment omitted]

	
	-- [comment omitted]
	
	UPDATE Conversion_ILA SET warehouse = NULL WHERE warehouse in ('<literal:3>','<literal:4>','<literal:5>')
	UPDATE Conversion_ILA SET ITEM = NULL WHERE ITEM in ('<literal:6>','<literal:7>','<literal:8>')
	UPDATE Conversion_ILA SET COMPANY = NULL WHERE COMPANY in ('<literal:9>','<literal:10>','<literal:11>')
	UPDATE Conversion_ILA SET QUANTITY_UM = NULL WHERE QUANTITY_UM in ('<literal:12>','<literal:13>','<literal:14>')
	UPDATE Conversion_ILA SET ALLOCATION_LOC = NULL WHERE ALLOCATION_LOC in ('<literal:15>','<literal:16>','<literal:17>')
	UPDATE Conversion_ILA SET USER_DEF1 = NULL WHERE USER_DEF1 in ('<literal:18>','<literal:19>','<literal:20>')
	UPDATE Conversion_ILA SET USER_DEF2 = NULL WHERE USER_DEF2 in ('<literal:21>','<literal:22>','<literal:23>')
	UPDATE Conversion_ILA SET USER_DEF3 = NULL WHERE USER_DEF3 in ('<literal:24>','<literal:25>','<literal:26>')
	UPDATE Conversion_ILA SET USER_DEF4 = NULL WHERE USER_DEF4 in ('<literal:27>','<literal:28>','<literal:29>')
	UPDATE Conversion_ILA SET USER_DEF5 = NULL WHERE USER_DEF5 in ('<literal:30>','<literal:31>','<literal:32>')
	UPDATE Conversion_ILA SET USER_DEF6 = NULL WHERE USER_DEF6 in ('<literal:33>','<literal:34>','<literal:35>')
	
	UPDATE Conversion_ILA SET USER_STAMP = NULL WHERE USER_STAMP in ('<literal:36>','<literal:37>','<literal:38>')
	UPDATE Conversion_ILA SET PROCESS_STAMP = NULL WHERE PROCESS_STAMP in ('<literal:39>','<literal:40>','<literal:41>')
	
	UPDATE Conversion_ILA SET USER_DEF7 = 0 WHERE USER_DEF7 IS NULL
	UPDATE Conversion_ILA SET USER_DEF8 = 0 WHERE USER_DEF8 IS NULL

	print N'<literal:42>' + @stWarehouse;

	-- [comment omitted]
	delete from Conversion_ILA
	where warehouse is null
	and item is null 
	and allocation_loc is null

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + N'<literal:43>'


	-- [comment omitted]
	select @iRecordsAffected = count(*) 
		from Conversion_ILA 
		where WAREHOUSE = @stWarehouse
		group by warehouse, ALLOCATION_LOC, item, company,QUANTITY_UM
			having COUNT(*) > 1
	-- [comment omitted]
	-- [comment omitted]

	if(@iRecordsAffected > 0)
	begin
		RAISERROR(N'<literal:44>', 10,1,@iRecordsAffected);
		select N'<literal:45>' , item,allocation_loc,company, warehouse
		from Conversion_ILA 
		where WAREHOUSE = @stWarehouse
		group by warehouse, ALLOCATION_LOC, item, company
			having COUNT(*) > 1

			set @iValidationError = 1;
		-- [comment omitted]
	end

	-- [comment omitted]
	select @iRecordsAffected = count(*) from Conversion_ILA a 
	inner join item_location_assignment i 
	on a.allocation_loc = i.ALLOCATION_LOC
	and a.item = i.item
	and isnull(a.company,'<literal:46>') = isnull(i.COMPANY,'<literal:47>')
	where a.warehouse = @stWarehouse
	

	if(@iRecordsAffected >0)
	begin
		RAISERROR(N'<literal:48>',10,1,@iRecordsAffected);
		select N'<literal:49>',* 
		from Conversion_ILA a 
		inner join item_location_assignment i 
		on a.allocation_loc = i.ALLOCATION_LOC
		and a.item = i.item
		and isnull(a.company,'<literal:50>') = isnull(i.COMPANY,'<literal:51>')
		where a.warehouse = @stWarehouse

		set @iValidationError = 1;
		-- [comment omitted]
	end


	-- [comment omitted]

	select @iRecordsAffected = count(distinct item) from Conversion_ILA where warehouse = @stWarehouse and allocation_loc in (select location from location where location.warehouse = @stWarehouse and multi_item = '<literal:52>') group by allocation_loc having count(distinct item) > 1 

	if(@iRecordsAffected > 0)
	begin
		raiserror('<literal:53>', 10, 1, @iRecordsAffected);
		select '<literal:54>', ITEM, company, allocation_loc
		from Conversion_ILA where allocation_loc in (select allocation_loc from Conversion_ILA where warehouse = @stWarehouse and allocation_loc in (select location from location where location.warehouse = @stWarehouse and multi_item = '<literal:55>') group by allocation_loc having count(distinct item) > 1) 
		
		set @iValidationError = 1;
	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + '<literal:56>';


	-- [comment omitted]
	select @iRecordsAffected = COUNT(*) 
	-- [comment omitted]
	-- [comment omitted]
	-- [comment omitted]

	FROM Conversion_ILA CILA
	JOIN LOCATION L 
	ON CILA.ALLOCATION_LOC = L.LOCATION
	AND CILA.warehouse = L.warehouse
	LEFT JOIN ITEM_LOCATION_ASSIGNMENT ILA
	ON CILA.ALLOCATION_LOC = ILA.ALLOCATION_LOC
	AND CILA.warehouse = ILA.warehouse

	WHERE L.MULTI_ITEM = '<literal:57>'
	AND CILA.ITEM <> ILA.ITEM
	AND ISNULL(CILA.COMPANY,'<literal:58>') = ISNULL(ILA.COMPANY,'<literal:59>')
	AND CILA.warehouse = @stWarehouse


	if(@iRecordsAffected > 0)
	begin
		raiserror(N'<literal:60>', 10, 1, @iRecordsAffected);
		select N'<literal:61>'
		-- [comment omitted]
		-- [comment omitted]
		, ILA.ITEM AS assigned_item, ila.*
		FROM Conversion_ILA CILA
		JOIN LOCATION L 
		ON CILA.ALLOCATION_LOC = L.LOCATION
		AND CILA.warehouse = L.warehouse
		LEFT JOIN ITEM_LOCATION_ASSIGNMENT ILA
		ON CILA.ALLOCATION_LOC = ILA.ALLOCATION_LOC
		AND CILA.warehouse = ILA.warehouse

		WHERE L.MULTI_ITEM = '<literal:62>'
		AND CILA.ITEM <> ILA.ITEM
		AND ISNULL(CILA.COMPANY,'<literal:63>') = ISNULL(ILA.COMPANY,'<literal:64>')
		AND CILA.warehouse = @stWarehouse

		
		set @iValidationError = 1;
	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + '<literal:65>';

	-- [comment omitted]
	select distinct @iRecordsAffected = count(*) FROM Conversion_ILA I LEFT JOIN LOCATION_INVENTORY LI ON I.WAREHOUSE = LI.warehouse	and i.Allocation_loc = li.LOCATION left join location l	on l.LOCATION = li.LOCATION	where li.item + '<literal:66>' + isnull(li.COMPANY,'<literal:67>') != i.ITEM + '<literal:68>' + isnull(i.COMPANY,'<literal:69>') and l.MULTI_ITEM = '<literal:70>'	and li.PERMANENT = '<literal:71>'	and li.warehouse = @stWarehouse 

	if(@iRecordsAffected > 0)
	begin
		raiserror('<literal:72>', 10, 1, @iRecordsAffected);
		select distinct '<literal:73>', I.WAREHOUSE,I.allocation_loc, li.item + '<literal:74>' + isnull(li.COMPANY,'<literal:75>') [Location_Inventory.Item/Company], i.ITEM + '<literal:76>' + isnull(i.COMPANY,'<literal:77>') [Conversion_ILA.Item/Company]
		FROM Conversion_ILA I 
		LEFT JOIN LOCATION_INVENTORY LI
		ON I.WAREHOUSE = LI.warehouse
		and i.allocation_loc = li.LOCATION
		left join location l
		on l.LOCATION = li.LOCATION
		where li.item + '<literal:78>' + isnull(li.COMPANY,'<literal:79>') != i.ITEM + '<literal:80>' + isnull(i.COMPANY,'<literal:81>')
		and l.MULTI_ITEM = '<literal:82>'
		and li.PERMANENT = '<literal:83>'
		and li.warehouse = @stWarehouse

		set @iValidationError = 1;
	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + '<literal:84>';



	-- [comment omitted]
	select @iRecordsAffected = COUNT(*) from Conversion_ILA where warehouse is null and ALLOCATION_LOC is not null;
	-- [comment omitted]
	-- [comment omitted]

	if(@iRecordsAffected > 0)
	begin
		RAISERROR(N'<literal:85>', 10,1,@iRecordsAffected);
		select N'<literal:86>', * from Conversion_ILA where warehouse is null and ALLOCATION_LOC is not null;
		set @iValidationError = 1;
		-- [comment omitted]
	end

	
	-- [comment omitted]
	select @iRecordsAffected = COUNT(*) from Conversion_ILA where ALLOCATION_LOC not in (select location from location where warehouse = @stWarehouse)

	if(@iRecordsAffected > 0)
	begin
		raiserror('<literal:87>', 10, 1, @iRecordsAffected);
		select '<literal:88>', ITEM, company,ALLOCATION_LOC from Conversion_ILA where ALLOCATION_LOC not in (select location from LOCATION where warehouse = @stWarehouse) order by allocation_loc, ITEM
		
		set @iValidationError = 1;
	end

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + '<literal:89>';

	
	-- [comment omitted]
	select @iRecordsAffected = COUNT(distinct item) from Conversion_ILA where item + N'<literal:90>' + isnull(Company,'<literal:91>') not in (select item + N'<literal:92>' + isnull(Company,'<literal:93>')  from item)

	if(@iRecordsAffected > 0)
	begin
		raiserror('<literal:94>', 10, 1, @iRecordsAffected);
		select distinct '<literal:95>', ITEM, COMPANY
		from Conversion_ILA 
		where item + N'<literal:96>' + isnull(Company,'<literal:97>') not in (select item + N'<literal:98>' + isnull(Company,'<literal:99>')  from item) order by ITEM, COMPANY
		
	end

	-- [comment omitted]
	UPDATE Conversion_ILA
	SET PROCESS_STAMP = '<literal:100>'
	WHERE item + N'<literal:101>' + isnull(Company,'<literal:102>') not in (select item + N'<literal:103>' + isnull(Company,'<literal:104>')  from item)

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + '<literal:105>';

	-- [comment omitted]
	select @iRecordsAffected = COUNT(*) from Conversion_ILA where Company not in (select Company  from Company) and company is not null

	if(@iRecordsAffected > 0)
	begin
		raiserror('<literal:106>', 10, 1, @iRecordsAffected);
		select distinct '<literal:107>', COMPANY
		from Conversion_ILA where Company not in (select Company from Company) and company is not null order by COMPANY

		
	end

	-- [comment omitted]
	UPDATE Conversion_ILA
	SET USER_STAMP = '<literal:108>'
	WHERE Company not in (select Company from Company) and company is not null

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + '<literal:109>';


	-- [comment omitted]

	select @iRecordsAffected = COUNT(*) from Conversion_ILA where QUANTITY_UM not in (select IDENTIFIER from GENERIC_CONFIG_DETAIL where RECORD_TYPE = '<literal:110>')

	if(@iRecordsAffected > 0)
	begin
		raiserror('<literal:111>', 10, 1, @iRecordsAffected);
		select '<literal:112>',* from Conversion_ILA where QUANTITY_UM not in (select IDENTIFIER from GENERIC_CONFIG_DETAIL where RECORD_TYPE = '<literal:113>')

	end

	if(@iValidationError > 0)
	begin
		print N'<literal:114>';
		return;
	end;

	select @iRecordsToProcess = count(*) from Conversion_ILA;
	print cast(@iRecordsAffected as nvarchar(25)) + N'<literal:115>'
	

	-- [comment omitted]
	delete from Staging_ILA;

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + N'<literal:116>'
	
	
	-- [comment omitted]

INSERT INTO Staging_ILA([Processed],[warehouse],[ITEM],[COMPANY],[QUANTITY_UM],[ALLOCATION_LOC],[USER_DEF1],[USER_DEF2],[USER_DEF3],[USER_DEF4],[USER_DEF5],[USER_DEF6],[USER_DEF7],[USER_DEF8],[USER_STAMP],[PROCESS_STAMP],[DATE_TIME_STAMP]
)
  
	(select N'<literal:117>' as processed, [warehouse],[ITEM],[COMPANY],[QUANTITY_UM],[ALLOCATION_LOC],[USER_DEF1],[USER_DEF2],[USER_DEF3],[USER_DEF4],[USER_DEF5],[USER_DEF6],[USER_DEF7],[USER_DEF8],[USER_STAMP],[PROCESS_STAMP],getdate() 
	from Conversion_ILA
	where warehouse = @stWarehouse);

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + N'<literal:118>'

	-- [comment omitted]

	print N'<literal:119>' + @stWarehouse;

	update Staging_ILA
	set PROCESS_STAMP = '<literal:120>' + cast(convert(date,getdate())as nvarchar)
	where PROCESS_STAMP is null
	and warehouse = @stWarehouse ;

	update Staging_ILA
	set USER_STAMP = '<literal:121>'
	where USER_STAMP is null
	and warehouse = @stWarehouse ;
	
	print N'<literal:122>' + @stWarehouse;
end
