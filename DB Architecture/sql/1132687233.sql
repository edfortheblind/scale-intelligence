-- DOCUMENTATION ONLY: literals/comments removed; do not execute.


/* [comment omitted] */







-- [comment omitted]
CREATE procedure [dbo].[LOAD_ILC_v2] (@stWarehouse nvarchar(25))
as
begin

	SET NOCOUNT ON 

	print N'<literal:1>' + @stWarehouse;

	declare @iCurrentRecord int;
	declare @iInventoryRecordsLoaded int;
	declare @iInventoryRecordsError int;
	declare @iError int;

	
		begin transaction;
		
	INSERT  INTO ITEM_LOCATION_CAPACITY
	           ([ITEM],[COMPANY],[LOCATION_TYPE],[MAXIMUM_QTY],[QUANTITY_UM],[MINIMUM_RPLN_PCT],[USER_DEF1],[USER_DEF2],[USER_DEF3],[USER_DEF4],[USER_DEF5],[USER_DEF6],[USER_DEF7],[USER_DEF8]
           ,[USER_STAMP],[PROCESS_STAMP],[DATE_TIME_STAMP],[MAXIMUM_RPLN_FILL_PCT],[warehouse],[LOCATION],[ITEM_CLASS],[MINIMUM_TOPOFF_RPLN_PCT])

	(select [ITEM],[COMPANY],[LOCATION_TYPE],[MAXIMUM_QTY],[QUANTITY_UM],[MINIMUM_RPLN_PCT],[USER_DEF1],[USER_DEF2],[USER_DEF3],[USER_DEF4],[USER_DEF5],[USER_DEF6],[USER_DEF7],[USER_DEF8]
           ,'<literal:2>','<literal:3>'+cast(convert(date,getdate()) as nvarchar),[DATE_TIME_STAMP],[MAXIMUM_RPLN_FILL_PCT],[warehouse],[LOCATION],[ITEM_CLASS],[MINIMUM_TOPOFF_RPLN_PCT]
	from Staging_ILC 
	Where user_stamp != N'<literal:4>'
	and PROCESSED != N'<literal:5>'
	)
	SET @iInventoryRecordsLoaded = @@ROWCOUNT
	set @iError = @@ERROR;

	if(@ierror = 0)
	begin 
		commit;

		update Staging_ILC
		set Processed = N'<literal:6>'
		-- [comment omitted]

	-- [comment omitted]

	end

	else
	begin
		rollback;

		update Staging_ILC
		set USER_STAMP = N'<literal:7>'
		-- [comment omitted]
	
	set @iInventoryRecordsError = @iInventoryRecordsError + 1;

	end
	
	set @iCurrentRecord = @iCurrentRecord + 1;

	
	print cast(@iInventoryRecordsLoaded as nvarchar(25)) + N'<literal:8>';
	-- [comment omitted]
	-- [comment omitted]
	raiserror(N'<literal:9>', 10, 1, @iInventoryRecordsError);
	


end

