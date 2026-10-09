/*
	Task	| By	| Date			| Modification Description
	---------------------------------------------------------------
	AI0018	| AG	| 04/10/2019	| Created.
	AI0018	| AG	| 03/01/2021	| check Invalid Record Type
	

*/

-- exec POPULATE_Generic_Config_Dtl 'ITEMCLASS'

CREATE procedure POPULATE_Generic_Config_Dtl (@strecordtype nvarchar(25))
as 
begin

	declare @iRecordsAffected int;
	declare @iValidationError int;
	declare @iRecordsToProcess int;

	print N'Processing Warehouse: ' + @strecordtype;
	print N'Scrubbing Data for Null and Blank Values Started: ' + @strecordtype;

	-- scrub data for null and blank values
		
		UPDATE d_generic_config_detail SET IDENTIFIER = NULL WHERE IDENTIFIER in (' ','','Null')
		UPDATE d_generic_config_detail SET DESCRIPTION = NULL WHERE DESCRIPTION in (' ','','Null')
		UPDATE d_generic_config_detail SET SYS1VALUE = NULL WHERE SYS1VALUE in (' ','','Null')
		UPDATE d_generic_config_detail SET SYS2VALUE = NULL WHERE SYS2VALUE in (' ','','Null')
		UPDATE d_generic_config_detail SET SYS3VALUE = NULL WHERE SYS3VALUE in (' ','','Null')
		UPDATE d_generic_config_detail SET SYS4VALUE = NULL WHERE SYS4VALUE in (' ','','Null')
		UPDATE d_generic_config_detail SET SYS5VALUE = NULL WHERE SYS5VALUE in (' ','','Null')
		UPDATE d_generic_config_detail SET USER1VALUE = NULL WHERE USER1VALUE in (' ','','Null')
		UPDATE d_generic_config_detail SET USER2VALUE = NULL WHERE USER2VALUE in (' ','','Null')
		UPDATE d_generic_config_detail SET USER3VALUE = NULL WHERE USER3VALUE in (' ','','Null')
		UPDATE d_generic_config_detail SET USER4VALUE = NULL WHERE USER4VALUE in (' ','','Null')
		UPDATE d_generic_config_detail SET USER5VALUE = NULL WHERE USER5VALUE in (' ','','Null')
		UPDATE d_generic_config_detail SET USER6VALUE = NULL WHERE USER6VALUE in (' ','','Null')
		UPDATE d_generic_config_detail SET USER7VALUE = NULL WHERE USER7VALUE in (' ','','Null')
		UPDATE d_generic_config_detail SET USER8VALUE = NULL WHERE USER8VALUE in (' ','','Null')
		UPDATE d_generic_config_detail SET USER_DEF1 = NULL WHERE USER_DEF1 in (' ','','Null')
		UPDATE d_generic_config_detail SET USER_DEF2 = NULL WHERE USER_DEF2 in (' ','','Null')
		UPDATE d_generic_config_detail SET USER_DEF3 = NULL WHERE USER_DEF3 in (' ','','Null')
		UPDATE d_generic_config_detail SET USER_DEF4 = NULL WHERE USER_DEF4 in (' ','','Null')
		UPDATE d_generic_config_detail SET USER_DEF5 = NULL WHERE USER_DEF5 in (' ','','Null')
		UPDATE d_generic_config_detail SET USER_DEF6 = NULL WHERE USER_DEF6 in (' ','','Null')
		
		UPDATE d_generic_config_detail SET USER_STAMP = NULL WHERE USER_STAMP in (' ','','Null')
		UPDATE d_generic_config_detail SET PROCESS_STAMP = NULL WHERE PROCESS_STAMP in (' ','','Null')
		
		UPDATE d_generic_config_detail SET USER_DEF7 = 0 WHERE USER_DEF7 is null;
		UPDATE d_generic_config_detail SET USER_DEF8 = 0 WHERE USER_DEF8 is null;

	print N'Scrubbing Data for Null and Blank Values Completed: ' + @strecordtype;


	-- delete records with null record_type
	delete from d_generic_config_detail where RECORD_TYPE is null and identifier is null
	
	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + N' Records Deleted with null Record Type + null Identifier';

	-- Invalid Record Type
	select @iRecordsAffected = count(*) 
	from d_generic_config_detail s 
	where s.record_type = @strecordtype
	and not exists (select 'x' from GENERIC_CONFIG_HEADER h where h.RECORD_TYPE = s.RECORD_TYPE)
	
	if(@iRecordsAffected > 0)
	begin
		RAISERROR(N'%d Invalid Record Type', 10,1,@iRecordsAffected);
		select N'Invalid Record Type', s.record_type, s.identifier, s.DESCRIPTION, *
		from d_generic_config_detail s 
		where s.record_type = @strecordtype
		and not exists (select 'x' from GENERIC_CONFIG_HEADER h where h.RECORD_TYPE = s.RECORD_TYPE)

		set @iValidationError = 1;
	end

	-- check is any reqd fields are blank
	select @iRecordsAffected = count(*) from d_generic_config_detail s 
		left join GENERIC_CONFIG_HEADER g with(Nolock)
		on s.record_type = g.RECORD_TYPE 
		where s.record_type = @strecordtype
		and (s.identifier is null 
		OR s.DESCRIPTION IS NULL 
		OR (g.SYS1_REQUIRED = 'Y' and s.SYS1VALUE is null)
		OR (g.SYS2_REQUIRED = 'Y' and s.SYS2VALUE is null)
		OR (g.SYS3_REQUIRED = 'Y' and s.SYS3VALUE is null)
		OR (g.SYS4_REQUIRED = 'Y' and s.SYS4VALUE is null)
		OR (g.SYS5_REQUIRED = 'Y' and s.SYS5VALUE is null)
		OR (g.USER1_REQUIRED = 'Y' and s.USER1VALUE is null)
		OR (g.USER2_REQUIRED = 'Y' and s.USER2VALUE is null)
		OR (g.USER3_REQUIRED = 'Y' and s.USER3VALUE is null)
		OR (g.USER4_REQUIRED = 'Y' and s.USER4VALUE is null)
		OR (g.USER5_REQUIRED = 'Y' and s.USER5VALUE is null)
		OR (g.USER6_REQUIRED = 'Y' and s.USER6VALUE is null)
		OR (g.USER7_REQUIRED = 'Y' and s.USER7VALUE is null)
		OR (g.USER8_REQUIRED = 'Y' and s.USER8VALUE is null))


	if(@iRecordsAffected > 0)
	begin
		RAISERROR(N'%d required field missing', 10,1,@iRecordsAffected);
		select N'Required Field Missing', s.identifier, s.DESCRIPTION,
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
		OR (g.SYS1_REQUIRED = 'Y' and s.SYS1VALUE is null)
		OR (g.SYS2_REQUIRED = 'Y' and s.SYS2VALUE is null)
		OR (g.SYS3_REQUIRED = 'Y' and s.SYS3VALUE is null)
		OR (g.SYS4_REQUIRED = 'Y' and s.SYS4VALUE is null)
		OR (g.SYS5_REQUIRED = 'Y' and s.SYS5VALUE is null)
		OR (g.USER1_REQUIRED = 'Y' and s.USER1VALUE is null)
		OR (g.USER2_REQUIRED = 'Y' and s.USER2VALUE is null)
		OR (g.USER3_REQUIRED = 'Y' and s.USER3VALUE is null)
		OR (g.USER4_REQUIRED = 'Y' and s.USER4VALUE is null)
		OR (g.USER5_REQUIRED = 'Y' and s.USER5VALUE is null)
		OR (g.USER6_REQUIRED = 'Y' and s.USER6VALUE is null)
		OR (g.USER7_REQUIRED = 'Y' and s.USER7VALUE is null)
		OR (g.USER8_REQUIRED = 'Y' and s.USER8VALUE is null))
	

		set @iValidationError = 1;
	end
	
	--Verify that no duplicate records exist;
	select @iRecordsAffected = count(*) from d_generic_config_detail where record_type = @strecordtype
		group by identifier,description
			having COUNT(*) > 1 
	--set @iRecordsAffected = @@ROWCOUNT;
	--print cast(@iRecordsAffected as nvarchar(25))

	if(@iRecordsAffected > 0)
	begin
		RAISERROR(N'%d Duplicate Generic Config Dtl Found', 10,1,@iRecordsAffected);
		select N'Duplicate Generic Config Dtl Found', identifier,description from d_generic_config_detail where record_type = @strecordtype
		group by identifier,description
			having COUNT(*) > 1 
		--return;

		set @iValidationError = 1;
	end

	
	--Verify Sts Chg Time Records Doesnt already Exist in active table
	select @iRecordsAffected = count(*) from d_generic_config_detail S 
		left join (select identifier, description, record_type from GENERIC_CONFIG_DETAIL WHERE RECORD_TYPE = @strecordtype)G 
		ON S.RECORD_TYPE = G.RECORD_TYPE
		where (S.IDENTIFIER = G.IDENTIFIER
		OR S.DESCRIPTION = G.DESCRIPTION)

	if(@iRecordsAffected >0)
	begin
		RAISERROR(N'%d Generic Config Dtl Record Already Exists in Warehouse',10,1,@iRecordsAffected);
		select N'Generic Config Dtl Record Already Exists in Warehouse',* 
		from d_generic_config_detail S 
		left join (select identifier, description, record_type from GENERIC_CONFIG_DETAIL with(nolock) WHERE RECORD_TYPE = @strecordtype)G 
		ON S.RECORD_TYPE = G.RECORD_TYPE
		where (S.IDENTIFIER = G.IDENTIFIER
		OR S.DESCRIPTION = G.DESCRIPTION)

		set @iValidationError = 1;
		--return;
	end

	/*	
	--Check for items that are not in the item master
	select @iRecordsAffected = COUNT(distinct Sys1value) from d_generic_config_detail where Sys1value + N' - ' + Sys2value not in (select item + N' - ' + Company  from item)

	if(@iRecordsAffected > 0)
	begin
		raiserror('%d Records found with items that do not exist in the item master', 10, 1, @iRecordsAffected);
		select distinct 'Item Does Not Exist', Sys1value as item, Sys2value as company
		from d_generic_config_detail 
		where Sys1value + N' - ' + Sys2value not in (select item + N' - ' + Company  from item) order by sys1value, sys2value
		
	end

	--Stamp items that dont exist
	UPDATE d_generic_config_detail
	SET PROCESS_STAMP = 'ITEM DNE'
	WHERE Sys1value + N' - ' + Sys2value not in (select item + N' - ' + Company  from item)

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' ITEM DNE';

	-- check for Companies that are not in Company Table
	select @iRecordsAffected = COUNT(*) from d_generic_config_detail where sys2value not in (select Company  from Company)

	if(@iRecordsAffected > 0)
	begin
		raiserror('%d Records found with Companies that do not exist in Company Table', 10, 1, @iRecordsAffected);
		select distinct 'Company Does Not Exist', sys2value as Company
		from d_generic_config_detail where sys2value not in (select Company from Company) order by sys2value
		
	end

	--Stamp Company that dont exist
	UPDATE d_generic_config_detail
	SET USER_STAMP = 'Company DNE'
	WHERE sys2value not in (select Company from Company)

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' Company DNE';


	-- Update Inv Status to Identifier instead of Description

	update s
	set s.sys5value = g.identifier

	--select s.SYS5VALUE, g.IDENTIFIER,g.DESCRIPTION,* 
	from d_generic_config_detail s
	inner join GENERIC_CONFIG_DETAIL g
	on s.sys5value = g.DESCRIPTION
	and g.RECORD_TYPE = 'INVSTATUS'
	where s.record_type = @strecordtype

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' Item Status (sys5value) Updated';


	-- update user1value to identifier instead of description

	update s
	set s.user1value = g.identifier

	--select s.user1value,g.identifier,g.description
	from d_generic_config_detail s
	inner join GENERIC_CONFIG_DETAIL g
	on s.user1value = g.description
	and g.RECORD_TYPE = 'Generic_Config_DtlRECTYPE'
	where s.record_type = @strecordtype

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + ' Start Time (User1value)  Updated';
	*/

	if(@iValidationError > 0)
	begin
		print N'Validation Errors Occured.  No Generic_Config_Dtl Records Loaded';
		return;
	end;

	select @iRecordsToProcess = count(*) from d_generic_config_detail;
	print cast(@iRecordsAffected as nvarchar(25)) + N' Records to be imported into staging_Generic_Config_Dtl Table'
	

	--Delete Warehouse records in Staging_Generic_Config_Dtl
	delete from Staging_Generic_Config_Dtl;

	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + N' Records Cleared for staging_Generic_Config_Dtl'
	
	
	--Load Values into Staging_Generic_Config_Dtl

INSERT INTO Staging_Generic_Config_Dtl ([Processed],	[RECORD_TYPE], [IDENTIFIER], [DESCRIPTION],  [SYS1VALUE], [SYS2VALUE], [SYS3VALUE], [SYS4VALUE], [SYS5VALUE], [USER1VALUE], [USER2VALUE], [USER3VALUE], [USER4VALUE], [USER5VALUE], [USER6VALUE], [USER7VALUE], [USER8VALUE], [USER_DEF1], [USER_DEF2], [USER_DEF3], [USER_DEF4], [USER_DEF5], [USER_DEF6], [USER_DEF7], [USER_DEF8], [USER_STAMP], [PROCESS_STAMP], [DATE_TIME_STAMP])
  
	(select N'N' as processed, 	[RECORD_TYPE], [IDENTIFIER], [DESCRIPTION],[SYS1VALUE], [SYS2VALUE], [SYS3VALUE], [SYS4VALUE], [SYS5VALUE], [USER1VALUE], [USER2VALUE], [USER3VALUE], [USER4VALUE], [USER5VALUE], [USER6VALUE], [USER7VALUE], [USER8VALUE], [USER_DEF1], [USER_DEF2], [USER_DEF3], [USER_DEF4], [USER_DEF5], [USER_DEF6], [USER_DEF7], [USER_DEF8], [USER_STAMP], [PROCESS_STAMP], getdate() 
	from d_generic_config_detail
	where record_type = @strecordtype);


	set @iRecordsAffected = @@ROWCOUNT;
	print cast(@iRecordsAffected as nvarchar(25)) + N' Records Inserted into Generic_Config_Dtl'

	-- UPDATE process_Stamp/user stamp w/ default values

	print N'Begin Update Staging Table Process Stamp / User Name w/ Default values for ' + @strecordtype;

	update Staging_Generic_Config_Dtl
	set PROCESS_STAMP = 'Pop_GCD ' + cast(convert(date,getdate())as nvarchar)
	where PROCESS_STAMP is null 
	and record_type = @strecordtype;

	update Staging_Generic_Config_Dtl
	set USER_STAMP = 'System'
	where USER_STAMP is null 
	and record_type = @strecordtype;
	
	print N'Completed Update Staging Table Process Stamp / User Name w/ Default values for ' + @strecordtype;




end