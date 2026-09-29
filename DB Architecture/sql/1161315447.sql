-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */








-- [comment omitted]

CREATE procedure POPULATE_Generic_Config_Dtl (@strecordtype nvarchar(25))
as 
begin

	declare @iRecordsAffected int;
	declare @iValidationError int;
	declare @iRecordsToProcess int;

	print N'<literal:1>' + @strecordtype;
	print N'<literal:2>' + @strecordtype;

	-- [comment omitted]
		
		UPDATE d_generic_config_detail SET IDENTIFIER = NULL WHERE IDENTIFIER in ('<literal:3>','<literal:4>','<literal:5>')
		UPDATE d_generic_config_detail SET DESCRIPTION = NULL WHERE DESCRIPTION in ('<literal:6>','<literal:7>','<literal:8>')
		UPDATE d_generic_config_detail SET SYS1VALUE = NULL WHERE SYS1VALUE in ('<literal:9>','<literal:10>','<literal:11>')
		UPDATE d_generic_config_detail SET SYS2VALUE = NULL WHERE SYS2VALUE in ('<literal:12>','<literal:13>','<literal:14>')
		UPDATE d_generic_config_detail SET SYS3VALUE = NULL WHERE SYS3VALUE in ('<literal:15>','<literal:16>','<literal:17>')
		UPDATE d_generic_config_detail SET SYS4VALUE = NULL WHERE SYS4VALUE in ('<literal:18>','<literal:19>','<literal:20>')
		UPDATE d_generic_config_detail SET SYS5VALUE = NULL WHERE SYS5VALUE in ('<literal:21>','<literal:22>','<literal:23>')
		UPDATE d_generic_config_detail SET USER1VALUE = NULL WHERE USER1VALUE in ('<literal:24>','<literal:25>','<literal:26>')
		UPDATE d_generic_config_detail SET USER2VALUE = NULL WHERE USER2VALUE in ('<literal:27>','<literal:28>','<literal:29>')
		UPDATE d_generic_config_detail SET USER3VALUE = NULL WHERE USER3VALUE in ('<literal:30>','<literal:31>','<literal:32>')
		UPDATE d_generic_config_detail SET USER4VALUE = NULL WHERE USER4VALUE in ('<literal:33>','<literal:34>','<literal:35>')
		UPDATE d_generic_config_detail SET USER5VALUE = NULL WHERE USER5VALUE in ('<literal:36>','<literal:37>','<literal:38>')
		UPDATE d_generic_config_detail SET USER6VALUE = NULL WHERE USER6VALUE in ('<literal:39>','<literal:40>','<literal:41>')
		UPDATE d_generic_config_detail SET USER7VALUE = NULL WHERE USER7VALUE in ('<literal:42>','<literal:43>','<literal:44>')
		UPDATE d_generic_config_detail SET USER8VALUE = NULL WHERE USER8VALUE in ('<literal:45>','<literal:46>','<literal:47>')
		UPDATE d_generic_config_detail SET USER_DEF1 = NULL WHERE USER_DEF1 in ('<literal:48>','<literal:49>','<literal:50>')
		UPDATE d_generic_config_detail SET USER_DEF2 = NULL WHERE USER_DEF2 in ('<literal:51>','<literal:52>','<literal:53>')
		UPDATE d_generic_config_detail SET USER_DEF3 = NULL WHERE USER_DEF3 in ('<literal:54>','<literal:55>','<literal:56>')
		UPDATE d_generic_config_detail SET USER_DEF4 = NULL WHERE USER_DEF4 in ('<literal:57>','<literal:58>','<literal:59>')
		UPDATE d_generic_config_detail SET USER_DEF5 = NULL WHERE USER_DEF5 in ('<literal:60>','<literal:61>','<literal:62>')
		UPDATE d_generic_config_detail SET USER_DEF6 = NULL WHERE USER_DEF6 in ('<literal:63>','<literal:64>','<literal:65>')
		
		UPDATE d_generic_config_detail SET USER_STAMP = NULL WHERE USER_STAMP in ('<literal:66>','<literal:67>','<literal:68>')
		UPDATE d_generic_config_detail SET PROCESS_STAMP = NULL WHERE PROCESS_STAMP in ('<literal:69>','<literal:70>','<literal:71>')
		
		UPDATE d_generic_config_detail SET USER_DEF7 = 0 WHERE USER_DEF7 is null;
		UPDATE d_generic_config_detail SET USER_DEF8 = 0 WHERE USER_DEF8 is null;

	print N'<literal:72>' + @strecordtype;


	-- [comment omitted]
	delete from d_generic_config_detail where RECORD_TYPE is null and identifier is null
	
	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + N'<literal:73>';

	-- [comment omitted]
	select @iRecordsAffected = count(*) 
	from d_generic_config_detail s 
	where s.record_type = @strecordtype
	and not exists (select '<literal:74>' from GENERIC_CONFIG_HEADER h where h.RECORD_TYPE = s.RECORD_TYPE)
	
	if(@iRecordsAffected > 0)
	begin
		RAISERROR(N'<literal:75>', 10,1,@iRecordsAffected);
		select N'<literal:76>', s.record_type, s.identifier, s.DESCRIPTION, *
		from d_generic_config_detail s 
		where s.record_type = @strecordtype
		and not exists (select '<literal:77>' from GENERIC_CONFIG_HEADER h where h.RECORD_TYPE = s.RECORD_TYPE)

		set @iValidationError = 1;
	end

	-- [comment omitted]
	select @iRecordsAffected = count(*) from d_generic_config_detail s 
		left join GENERIC_CONFIG_HEADER g with(Nolock)
		on s.record_type = g.RECORD_TYPE 
		where s.record_type = @strecordtype
		and (s.identifier is null 
		OR s.DESCRIPTION IS NULL 
		OR (g.SYS1_REQUIRED = '<literal:78>' and s.SYS1VALUE is null)
		OR (g.SYS2_REQUIRED = '<literal:79>' and s.SYS2VALUE is null)
		OR (g.SYS3_REQUIRED = '<literal:80>' and s.SYS3VALUE is null)
		OR (g.SYS4_REQUIRED = '<literal:81>' and s.SYS4VALUE is null)
		OR (g.SYS5_REQUIRED = '<literal:82>' and s.SYS5VALUE is null)
		OR (g.USER1_REQUIRED = '<literal:83>' and s.USER1VALUE is null)
		OR (g.USER2_REQUIRED = '<literal:84>' and s.USER2VALUE is null)
		OR (g.USER3_REQUIRED = '<literal:85>' and s.USER3VALUE is null)
		OR (g.USER4_REQUIRED = '<literal:86>' and s.USER4VALUE is null)
		OR (g.USER5_REQUIRED = '<literal:87>' and s.USER5VALUE is null)
		OR (g.USER6_REQUIRED = '<literal:88>' and s.USER6VALUE is null)
		OR (g.USER7_REQUIRED = '<literal:89>' and s.USER7VALUE is null)
		OR (g.USER8_REQUIRED = '<literal:90>' and s.USER8VALUE is null))


	if(@iRecordsAffected > 0)
	begin
		RAISERROR(N'<literal:91>', 10,1,@iRecordsAffected);
		select N'<literal:92>', s.identifier, s.DESCRIPTION,
		g.SYS1_REQUIRED, s.SYS1VALUE,
		g.SYS2_REQUIRED, s.SYS2VALUE,
		g.SYS3_REQUIRED, s.SYS3VALUE,
		g.SYS4_REQUIRED, s.SYS5VALUE,
		g.SYS5_REQUIRED, s.SYS5VALUE,
		g.USER1_REQUIRED, s.USER1VALUE,
		g.USER2_REQUIRED, s.USER2VALUE,
		g.USER3_REQUIRED, s.USER3VALUE,
		g.USER4_REQUIRED, s.USER4VALUE,
		g.USER5_REQUIRED, s.USER5VALUE,
		g.USER6_REQUIRED, s.USER6VALUE,
		g.USER7_REQUIRED, s.USER7VALUE,
		g.USER8_REQUIRED, s.USER8VALUE
		from d_generic_config_detail s 
		left join GENERIC_CONFIG_HEADER g with(nolock)
		on s.record_type = g.RECORD_TYPE 
		where s.record_type = @strecordtype
		and (s.identifier is null 
		OR s.DESCRIPTION IS NULL 
		OR (g.SYS1_REQUIRED = '<literal:93>' and s.SYS1VALUE is null)
		OR (g.SYS2_REQUIRED = '<literal:94>' and s.SYS2VALUE is null)
		OR (g.SYS3_REQUIRED = '<literal:95>' and s.SYS3VALUE is null)
		OR (g.SYS4_REQUIRED = '<literal:96>' and s.SYS4VALUE is null)
		OR (g.SYS5_REQUIRED = '<literal:97>' and s.SYS5VALUE is null)
		OR (g.USER1_REQUIRED = '<literal:98>' and s.USER1VALUE is null)
		OR (g.USER2_REQUIRED = '<literal:99>' and s.USER2VALUE is null)
		OR (g.USER3_REQUIRED = '<literal:100>' and s.USER3VALUE is null)
		OR (g.USER4_REQUIRED = '<literal:101>' and s.USER4VALUE is null)
		OR (g.USER5_REQUIRED = '<literal:102>' and s.USER5VALUE is null)
		OR (g.USER6_REQUIRED = '<literal:103>' and s.USER6VALUE is null)
		OR (g.USER7_REQUIRED = '<literal:104>' and s.USER7VALUE is null)
		OR (g.USER8_REQUIRED = '<literal:105>' and s.USER8VALUE is null))
	

		set @iValidationError = 1;
	end
	
	-- [comment omitted]
	select @iRecordsAffected = count(*) from d_generic_config_detail where record_type = @strecordtype
		group by identifier,description
			having COUNT(*) > 1 
	-- [comment omitted]
	-- [comment omitted]

	if(@iRecordsAffected > 0)
	begin
		RAISERROR(N'<literal:106>', 10,1,@iRecordsAffected);
		select N'<literal:107>', identifier,description from d_generic_config_detail where record_type = @strecordtype
		group by identifier,description
			having COUNT(*) > 1 
		-- [comment omitted]

		set @iValidationError = 1;
	end

	
	-- [comment omitted]
	select @iRecordsAffected = count(*) from d_generic_config_detail S 
		left join (select identifier, description, record_type from GENERIC_CONFIG_DETAIL WHERE RECORD_TYPE = @strecordtype)G 
		ON S.RECORD_TYPE = G.RECORD_TYPE
		where (S.IDENTIFIER = G.IDENTIFIER
		OR S.DESCRIPTION = G.DESCRIPTION)

	if(@iRecordsAffected >0)
	begin
		RAISERROR(N'<literal:108>',10,1,@iRecordsAffected);
		select N'<literal:109>',* 
		from d_generic_config_detail S 
		left join (select identifier, description, record_type from GENERIC_CONFIG_DETAIL with(nolock) WHERE RECORD_TYPE = @strecordtype)G 
		ON S.RECORD_TYPE = G.RECORD_TYPE
		where (S.IDENTIFIER = G.IDENTIFIER
		OR S.DESCRIPTION = G.DESCRIPTION)

		set @iValidationError = 1;
		-- [comment omitted]
	end

	/* [comment omitted] */








































































	if(@iValidationError > 0)
	begin
		print N'<literal:110>';
		return;
	end;

	select @iRecordsToProcess = count(*) from d_generic_config_detail;
	print cast(@iRecordsAffected as nvarchar(25)) + N'<literal:111>'
	

	-- [comment omitted]
	delete from Staging_Generic_Config_Dtl;

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + N'<literal:112>'
	
	
	-- [comment omitted]

INSERT INTO Staging_Generic_Config_Dtl ([Processed],	[RECORD_TYPE], [IDENTIFIER], [DESCRIPTION],  [SYS1VALUE], [SYS2VALUE], [SYS3VALUE], [SYS4VALUE], [SYS5VALUE], [USER1VALUE], [USER2VALUE], [USER3VALUE], [USER4VALUE], [USER5VALUE], [USER6VALUE], [USER7VALUE], [USER8VALUE], [USER_DEF1], [USER_DEF2], [USER_DEF3], [USER_DEF4], [USER_DEF5], [USER_DEF6], [USER_DEF7], [USER_DEF8], [USER_STAMP], [PROCESS_STAMP], [DATE_TIME_STAMP])
  
	(select N'<literal:113>' as processed, 	[RECORD_TYPE], [IDENTIFIER], [DESCRIPTION],[SYS1VALUE], [SYS2VALUE], [SYS3VALUE], [SYS4VALUE], [SYS5VALUE], [USER1VALUE], [USER2VALUE], [USER3VALUE], [USER4VALUE], [USER5VALUE], [USER6VALUE], [USER7VALUE], [USER8VALUE], [USER_DEF1], [USER_DEF2], [USER_DEF3], [USER_DEF4], [USER_DEF5], [USER_DEF6], [USER_DEF7], [USER_DEF8], [USER_STAMP], [PROCESS_STAMP], getdate() 
	from d_generic_config_detail
	where record_type = @strecordtype);


	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + N'<literal:114>'

	-- [comment omitted]

	print N'<literal:115>' + @strecordtype;

	update Staging_Generic_Config_Dtl
	set PROCESS_STAMP = '<literal:116>' + cast(convert(date,getdate())as nvarchar)
	where PROCESS_STAMP is null 
	and record_type = @strecordtype;

	update Staging_Generic_Config_Dtl
	set USER_STAMP = '<literal:117>'
	where USER_STAMP is null 
	and record_type = @strecordtype;
	
	print N'<literal:118>' + @strecordtype;




end