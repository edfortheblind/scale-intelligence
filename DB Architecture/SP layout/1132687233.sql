

/*
	Task	| By	| Date			| Modification Description
	---------------------------------------------------------------
	AI0018	| AG	| 12/12/2016	| Created. for large record imports 


*/

-- exec LOAD_ILC_v2 'QC70040'
CREATE procedure [dbo].[LOAD_ILC_v2] (@stWarehouse nvarchar(25))
as
begin

	SET NOCOUNT ON 

	print N'Processing Warehouse: ' + @stWarehouse;

	declare @iCurrentRecord int;
	declare @iInventoryRecordsLoaded int;
	declare @iInventoryRecordsError int;
	declare @iError int;

	
		begin transaction;
		
	INSERT  INTO ITEM_LOCATION_CAPACITY
	           ([ITEM],[COMPANY],[LOCATION_TYPE],[MAXIMUM_QTY],[QUANTITY_UM],[MINIMUM_RPLN_PCT],[USER_DEF1],[USER_DEF2],[USER_DEF3],[USER_DEF4],[USER_DEF5],[USER_DEF6],[USER_DEF7],[USER_DEF8]
           ,[USER_STAMP],[PROCESS_STAMP],[DATE_TIME_STAMP],[MAXIMUM_RPLN_FILL_PCT],[warehouse],[LOCATION],[ITEM_CLASS],[MINIMUM_TOPOFF_RPLN_PCT])

	(select [ITEM],[COMPANY],[LOCATION_TYPE],[MAXIMUM_QTY],[QUANTITY_UM],[MINIMUM_RPLN_PCT],[USER_DEF1],[USER_DEF2],[USER_DEF3],[USER_DEF4],[USER_DEF5],[USER_DEF6],[USER_DEF7],[USER_DEF8]
           ,'System','Load_ILC '+cast(convert(date,getdate()) as nvarchar),[DATE_TIME_STAMP],[MAXIMUM_RPLN_FILL_PCT],[warehouse],[LOCATION],[ITEM_CLASS],[MINIMUM_TOPOFF_RPLN_PCT]
	from Staging_ILC 
	Where user_stamp != N'Error'
	and PROCESSED != N'Y'
	)
	SET @iInventoryRecordsLoaded = @@ROWCOUNT
	set @iError = @@ERROR;

	if(@ierror = 0)
	begin 
		commit;

		update Staging_ILC
		set Processed = N'Y'
		--where warehouse = @stWarehouse

	--set @iInventoryRecordsLoaded = @iInventoryRecordsLoaded + 1;

	end

	else
	begin
		rollback;

		update Staging_ILC
		set USER_STAMP = N'Error'
		--where warehouse = @stWarehouse
	
	set @iInventoryRecordsError = @iInventoryRecordsError + 1;

	end
	
	set @iCurrentRecord = @iCurrentRecord + 1;

	
	print cast(@iInventoryRecordsLoaded as nvarchar(25)) + N' Records Loaded';
	--print cast(@iInventoryRecordsError as nvarchar(25)) + N' Errors';
	--raiserror(N'%d Records Loaded', 10, 1, @iInventoryRecordsLoaded);
	raiserror(N'%d Errors', 10, 1, @iInventoryRecordsError);
	


end

