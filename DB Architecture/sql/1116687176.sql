-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */












-- [comment omitted]
CREATE procedure [dbo].[POPULATE_STAGING_ILC] (@stWarehouse nvarchar(25))
as 
begin

	declare @iRecordsAffected int;
	declare @iValidationError int;
	declare @iRecordsToProcess int;

	print N'<literal:1>' + @stWarehouse;
	print N'<literal:2>' + @stWarehouse;

	-- [comment omitted]

	
	-- [comment omitted]
	UPDATE Conversion_ILC SET ITEM = NULL WHERE ITEM in ('<literal:3>','<literal:4>','<literal:5>')
	UPDATE Conversion_ILC SET COMPANY = NULL WHERE COMPANY in ('<literal:6>','<literal:7>','<literal:8>')
	UPDATE Conversion_ILC SET LOCATION_TYPE = NULL WHERE LOCATION_TYPE in ('<literal:9>','<literal:10>','<literal:11>')
	
	UPDATE Conversion_ILC SET QUANTITY_UM = NULL WHERE QUANTITY_UM in ('<literal:12>','<literal:13>','<literal:14>')
	
	UPDATE Conversion_ILC SET USER_DEF1 = NULL WHERE USER_DEF1 in ('<literal:15>','<literal:16>','<literal:17>')
	UPDATE Conversion_ILC SET USER_DEF2 = NULL WHERE USER_DEF2 in ('<literal:18>','<literal:19>','<literal:20>')
	UPDATE Conversion_ILC SET USER_DEF3 = NULL WHERE USER_DEF3 in ('<literal:21>','<literal:22>','<literal:23>')
	UPDATE Conversion_ILC SET USER_DEF4 = NULL WHERE USER_DEF4 in ('<literal:24>','<literal:25>','<literal:26>')
	UPDATE Conversion_ILC SET USER_DEF5 = NULL WHERE USER_DEF5 in ('<literal:27>','<literal:28>','<literal:29>')
	UPDATE Conversion_ILC SET USER_DEF6 = NULL WHERE USER_DEF6 in ('<literal:30>','<literal:31>','<literal:32>')
	
	UPDATE Conversion_ILC SET USER_STAMP = NULL WHERE USER_STAMP in ('<literal:33>','<literal:34>','<literal:35>')
	UPDATE Conversion_ILC SET PROCESS_STAMP = NULL WHERE PROCESS_STAMP in ('<literal:36>','<literal:37>','<literal:38>')
	UPDATE Conversion_ILC SET DATE_TIME_STAMP = NULL WHERE DATE_TIME_STAMP in ('<literal:39>','<literal:40>');
	
	UPDATE Conversion_ILC SET warehouse = NULL WHERE warehouse in ('<literal:41>','<literal:42>','<literal:43>')
	UPDATE Conversion_ILC SET LOCATION = NULL WHERE LOCATION in ('<literal:44>','<literal:45>','<literal:46>')
	UPDATE Conversion_ILC SET ITEM_CLASS = NULL WHERE ITEM_CLASS in ('<literal:47>','<literal:48>','<literal:49>')
	
	
	UPDATE Conversion_ILC SET MAXIMUM_RPLN_FILL_PCT = 100 WHERE MAXIMUM_RPLN_FILL_PCT is null
	UPDATE Conversion_ILC SET MINIMUM_TOPOFF_RPLN_PCT = 33 WHERE MINIMUM_TOPOFF_RPLN_PCT is null
	UPDATE Conversion_ILC SET USER_DEF7 = 0 WHERE USER_DEF7 is null;
	UPDATE Conversion_ILC SET USER_DEF8 = 0 WHERE USER_DEF8 is null;
	
	print N'<literal:50>' + @stWarehouse;

	-- [comment omitted]
	delete from Conversion_ILC where MAXIMUM_QTY is null or MAXIMUM_QTY = 0
	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + '<literal:51>';
	
	-- [comment omitted]
	select @iRecordsAffected = count(*) from Conversion_ILC where warehouse = @stwarehouse 
		 and warehouse + N'<literal:52>' + LOCATION in (select warehouse + N'<literal:53>' + Location from
		Conversion_ILC where warehouse = @stwarehouse 
		group by item, company, warehouse, Location
			having COUNT(*) > 1 )
	-- [comment omitted]
	-- [comment omitted]

	if(@iRecordsAffected > 0)
	begin
		RAISERROR(N'<literal:54>', 10,1,@iRecordsAffected);
		select N'<literal:55>', * from Conversion_ILC where warehouse = @stwarehouse 
		 and warehouse + N'<literal:56>' + LOCATION in (select warehouse + N'<literal:57>' + Location from
		Conversion_ILC where warehouse = @stwarehouse 
		group by item, company, warehouse, Location
			having COUNT(*) > 1 )
		-- [comment omitted]

	end

	select @iRecordsAffected = count(*) from Conversion_ILC where location_type is not null group by item,COMPANY,ITEM_CLASS,LOCATION_TYPE
	having COUNT(*) > 1
	-- [comment omitted]
	-- [comment omitted]

	if(@iRecordsAffected > 0)
	begin
		RAISERROR(N'<literal:58>', 10,1,@iRecordsAffected);
		select N'<literal:59>', * from Conversion_ILC where 
		 item + N'<literal:60>' + isnull(Company,'<literal:61>') + N'<literal:62>' + LOCATION_TYPE in (select item + N'<literal:63>' + isnull(Company,'<literal:64>') + N'<literal:65>' + isnull(LOCATION_TYPE,'<literal:66>'+ N'<literal:67>' + isnull(ITEM_CLASS,'<literal:68>')) from
		Conversion_ILC -- [comment omitted]
		where location_type is not null
		group by Item, Company,ITEM_CLASS, LOCATION_TYPE
			having COUNT(*) > 1 )
		
		set @iValidationError = 1;
	end

	-- [comment omitted]
	select @iRecordsAffected = count(*) from Conversion_ILC where Location + N'<literal:69>' + warehouse in (select location + N'<literal:70>' + warehouse from ITEM_LOCATION_CAPACITY) and warehouse = @stwarehouse

	if(@iRecordsAffected >0)
	begin
		RAISERROR(N'<literal:71>',10,1,@iRecordsAffected);
		select N'<literal:72>',* 
		from Conversion_ILC where Location + N'<literal:73>' + warehouse in (select location + N'<literal:74>' + warehouse from ITEM_LOCATION_CAPACITY) and warehouse = @stwarehouse
		
		set @iValidationError = 1;
		-- [comment omitted]
	end

	select @iRecordsAffected = count(*) from Conversion_ILC where item + N'<literal:75>' + isnull(Company,'<literal:76>') + N'<literal:77>' + LOCATION_TYPE in (select item + N'<literal:78>' + isnull(Company,'<literal:79>') + N'<literal:80>' + LOCATION_TYPE from ITEM_LOCATION_CAPACITY)

	if(@iRecordsAffected >0)
	begin
		RAISERROR(N'<literal:81>',10,1,@iRecordsAffected);
		select N'<literal:82>',* 
		from Conversion_ILC where item + N'<literal:83>' + isnull(Company,'<literal:84>') + N'<literal:85>' + LOCATION_TYPE in (select item + N'<literal:86>' + isnull(Company,'<literal:87>') + N'<literal:88>' + LOCATION_TYPE from ITEM_LOCATION_CAPACITY)
		
		set @iValidationError = 1;
		-- [comment omitted]
	end


	-- [comment omitted]
	select @iRecordsAffected = COUNT(*) from Conversion_ILC where warehouse is null and location is not null;
	-- [comment omitted]
	-- [comment omitted]

	if(@iRecordsAffected > 0)
	begin
		RAISERROR(N'<literal:89>', 10,1,@iRecordsAffected);
		select N'<literal:90>', * 
		from Conversion_ILC 
		where location_type is not null 
		and (warehouse + N'<literal:91>' + location is not null
		or (warehouse is null and location is not null) 
		or (location is null and warehouse is not null));
		set @iValidationError = 1;
		-- [comment omitted]
	end

	-- [comment omitted]

	select @iRecordsAffected = COUNT(*) from Conversion_ILC 
	where location_type is not null 
		and (warehouse + N'<literal:92>' + location is not null
		or (warehouse is null and location is not null) 
		or (location is null and warehouse is not null));
	-- [comment omitted]
	-- [comment omitted]

	if(@iRecordsAffected > 0)
	begin
		RAISERROR(N'<literal:93>', 10,1,@iRecordsAffected);
		select N'<literal:94>', warehouse + N'<literal:95>' + location,(case 
																														when LOCATION_TYPE is not null and warehouse + N'<literal:96>' + location is not null 
																														then '<literal:97>'
																														when warehouse is null and location is not null
																														then '<literal:98>'
																														when location is null and warehouse is not null
																														then '<literal:99>'
																													end)
		,* 
		from Conversion_ILC 
		where location_type is not null 
		and (warehouse + N'<literal:100>' + location is not null
		or (warehouse is null and location is not null) 
		or (location is null and warehouse is not null));
		set @iValidationError = 1;
		-- [comment omitted]
	end

	-- [comment omitted]
	select @iRecordsAffected = COUNT(*) from Conversion_ILC where LOCATION_TYPE is not null 
	and LOCATION_TYPE not in (select location_type from location_type)

	-- [comment omitted]

	if(@iRecordsAffected > 0)
	begin
		RAISERROR(N'<literal:101>', 10,1,@iRecordsAffected);
		select distinct N'<literal:102>', LOCATION_TYPE  from Conversion_ILC where LOCATION_TYPE is not null 
			and LOCATION_TYPE not in (select location_type from location_type) order by LOCATION_TYPE
			
		set @iValidationError = 1;
		-- [comment omitted]
	end

	
	-- [comment omitted]
	select @iRecordsAffected = COUNT(distinct item) from Conversion_ILC where item + N'<literal:103>' + isnull(Company,'<literal:104>') not in (select item + N'<literal:105>' + isnull(Company,'<literal:106>')  from item)

	if(@iRecordsAffected > 0)
	begin
		raiserror('<literal:107>', 10, 1, @iRecordsAffected);
		select distinct '<literal:108>', ITEM, COMPANY
		from Conversion_ILC 
		where item + N'<literal:109>' + isnull(Company,'<literal:110>') not in (select item + N'<literal:111>' + isnull(Company,'<literal:112>')  from item) order by ITEM, COMPANY
		
	end

	-- [comment omitted]
	UPDATE Conversion_ILC
	SET PROCESS_STAMP = '<literal:113>'
	WHERE item + N'<literal:114>' + isnull(Company,'<literal:115>') not in (select item + N'<literal:116>' + isnull(Company,'<literal:117>')  from item)

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + '<literal:118>';

	-- [comment omitted]
	select @iRecordsAffected = COUNT(*) from Conversion_ILC where isnull(Company,'<literal:119>') not in (select Company  from Company) and company is not null

	if(@iRecordsAffected > 0)
	begin
		raiserror('<literal:120>', 10, 1, @iRecordsAffected);
		select distinct '<literal:121>', COMPANY
		from Conversion_ILC where isnull(Company,'<literal:122>') not in (select Company from Company) and company is not null order by COMPANY
		
	end

	-- [comment omitted]
	UPDATE Conversion_ILC
	SET USER_STAMP = '<literal:123>'
	WHERE isnull(Company,'<literal:124>') not in (select Company from Company) and company is not null

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + '<literal:125>';


	-- [comment omitted]

	select @iRecordsAffected = COUNT(*) from Conversion_ILC where QUANTITY_UM not in (select IDENTIFIER from GENERIC_CONFIG_DETAIL where RECORD_TYPE = '<literal:126>')

	if(@iRecordsAffected > 0)
	begin
		raiserror('<literal:127>', 10, 1, @iRecordsAffected);
		select '<literal:128>',* from Conversion_ILC where QUANTITY_UM not in (select IDENTIFIER from GENERIC_CONFIG_DETAIL where RECORD_TYPE = '<literal:129>')
			
			set @iValidationError = 1;
	end

	if(@iValidationError > 0)
	begin
		print N'<literal:130>';
		return;
	end;

	select @iRecordsToProcess = count(*) from Conversion_ILC;
	print cast(@iRecordsAffected as nvarchar(25)) + N'<literal:131>'
	

	-- [comment omitted]
	delete from Staging_ILC;

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + N'<literal:132>'
	
	
	-- [comment omitted]

INSERT INTO Staging_ILC([Processed],[ITEM],[COMPANY],[LOCATION_TYPE],[MAXIMUM_QTY]
           ,[QUANTITY_UM],[MINIMUM_RPLN_PCT],[USER_DEF1],[USER_DEF2],[USER_DEF3],[USER_DEF4],[USER_DEF5],[USER_DEF6],[USER_DEF7],[USER_DEF8],[USER_STAMP],[PROCESS_STAMP],[DATE_TIME_STAMP],[MAXIMUM_RPLN_FILL_PCT],[warehouse],[LOCATION],[ITEM_CLASS],[MINIMUM_TOPOFF_RPLN_PCT])
  
	(select N'<literal:133>' as processed, [ITEM],[COMPANY],[LOCATION_TYPE],[MAXIMUM_QTY]
           ,[QUANTITY_UM],[MINIMUM_RPLN_PCT],[USER_DEF1],[USER_DEF2],[USER_DEF3],[USER_DEF4],[USER_DEF5],[USER_DEF6],[USER_DEF7],[USER_DEF8],[USER_STAMP],[PROCESS_STAMP],getdate(),[MAXIMUM_RPLN_FILL_PCT],[warehouse],[LOCATION],[ITEM_CLASS],[MINIMUM_TOPOFF_RPLN_PCT] 
	from Conversion_ILC);

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + N'<literal:134>'

	-- [comment omitted]

	print N'<literal:135>' + @stWarehouse;

	update Staging_ILC
	set PROCESS_STAMP = '<literal:136>' + cast(convert(date,getdate())as nvarchar)
	where PROCESS_STAMP is null;
	-- [comment omitted]

	update Staging_ILC
	set USER_STAMP = '<literal:137>'
	where USER_STAMP is null;
	-- [comment omitted]
	
	print N'<literal:138>' + @stWarehouse;
end
