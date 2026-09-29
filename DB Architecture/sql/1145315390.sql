-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */









-- [comment omitted]
create procedure [dbo].[Load_Generic_Config_Dtl] (@strecordtype nvarchar(25))
as
begin

	SET NOCOUNT ON 

	print N'<literal:1>' + @strecordtype;

	declare @iCurrentRecord int;
	declare @iInventoryRecordsLoaded int;
	declare @iInventoryRecordsError int;
	declare @iError int;

	-- [comment omitted]

	
	declare @stIDENTIFIER nvarchar(50) ;
	declare @stDESCRIPTION nvarchar(500) ;
	declare @stSYSTEM_CREATED nchar(1) ;
	declare @stSYS1VALUE nvarchar(250) ;
	declare @stSYS2VALUE nvarchar(250) ;
	declare @stSYS3VALUE nvarchar(250) ;
	declare @stSYS4VALUE nvarchar(250) ;
	declare @stSYS5VALUE nvarchar(250) ;
	declare @stUSER1VALUE nvarchar(250) ;
	declare @stUSER2VALUE nvarchar(250) ;
	declare @stUSER3VALUE nvarchar(250) ;
	declare @stUSER4VALUE nvarchar(250) ;
	declare @stUSER5VALUE nvarchar(250) ;
	declare @stUSER6VALUE nvarchar(250) ;
	declare @stUSER7VALUE nvarchar(250) ;
	declare @stUSER8VALUE nvarchar(250) ;
	declare @stACTIVE nchar(1) ;
	declare @stUSER_DEF1 nvarchar(25) ;
	declare @stUSER_DEF2 nvarchar(25) ;
	declare @stUSER_DEF3 nvarchar(25) ;
	declare @stUSER_DEF4 nvarchar(25) ;
	declare @stUSER_DEF5 nvarchar(25) ;
	declare @stUSER_DEF6 nvarchar(25) ;
	declare @stUSER_DEF7 numeric(19, 5) ;
	declare @stUSER_DEF8 numeric(19, 5) ;
	declare @stUSER_STAMP nvarchar(30) ;
	declare @stPROCESS_STAMP nvarchar(100) ;
	declare @stDATE_TIME_STAMP datetime ;
	DECLARE @stOBJECT_ID NUMERIC(9,0);


	set @iInventoryRecordsLoaded = 0;
	set @iInventoryRecordsError = 0;
	set @iCurrentRecord = 0;		

	
	declare Generic_Config_Dtl  cursor for
	select RECORD_TYPE ,IDENTIFIER ,DESCRIPTION ,SYSTEM_CREATED ,SYS1VALUE ,SYS2VALUE ,SYS3VALUE ,SYS4VALUE ,SYS5VALUE ,USER1VALUE ,USER2VALUE ,USER3VALUE ,USER4VALUE ,USER5VALUE ,USER6VALUE ,USER7VALUE ,USER8VALUE ,ACTIVE ,USER_DEF1,USER_DEF2,USER_DEF3,USER_DEF4,USER_DEF5,USER_DEF6,USER_DEF7 ,USER_DEF8 ,	N'<literal:2>',N'<literal:3>' + cast(convert(date,getutcdate())as nvarchar) ,getutcdate() ,OBJECT_ID 
	from Staging_Generic_Config_Dtl 
	Where RECORD_TYPE = @strecordtype 
	and user_stamp != N'<literal:4>' 
	and Processed != N'<literal:5>'
	order by SYS1VALUE desc
	;

	
	open Generic_Config_Dtl;

	fetch next from Generic_Config_Dtl
	into @stRECORDTYPE ,@stIDENTIFIER ,@stDESCRIPTION ,@stSYSTEM_CREATED ,@stSYS1VALUE ,@stSYS2VALUE ,@stSYS3VALUE ,@stSYS4VALUE ,@stSYS5VALUE ,@stUSER1VALUE ,@stUSER2VALUE ,@stUSER3VALUE ,@stUSER4VALUE ,@stUSER5VALUE ,@stUSER6VALUE ,@stUSER7VALUE ,@stUSER8VALUE ,@stACTIVE ,@stUSER_DEF1,@stUSER_DEF2,@stUSER_DEF3,@stUSER_DEF4,@stUSER_DEF5,@stUSER_DEF6,@stUSER_DEF7 ,@stUSER_DEF8 ,	 @stUSER_STAMP ,@stPROCESS_STAMP ,@stDATE_TIME_STAMP ,@stOBJECT_ID 
	

	while @@FETCH_STATUS = 0
	begin 
		begin transaction;
		
	INSERT  INTO GENERIC_CONFIG_DETAIL	           (RECORD_TYPE ,IDENTIFIER ,DESCRIPTION ,SYSTEM_CREATED ,SYS1VALUE ,SYS2VALUE ,SYS3VALUE ,SYS4VALUE ,SYS5VALUE ,USER1VALUE ,USER2VALUE ,USER3VALUE ,USER4VALUE ,USER5VALUE ,USER6VALUE ,USER7VALUE ,USER8VALUE ,ACTIVE ,USER_DEF1,USER_DEF2,USER_DEF3,USER_DEF4,USER_DEF5,USER_DEF6,USER_DEF7 ,USER_DEF8 ,USER_STAMP ,PROCESS_STAMP ,DATE_TIME_STAMP)

	values
	(@stRECORDTYPE ,@stIDENTIFIER ,@stDESCRIPTION ,@stSYSTEM_CREATED ,@stSYS1VALUE ,@stSYS2VALUE ,@stSYS3VALUE ,@stSYS4VALUE ,@stSYS5VALUE ,@stUSER1VALUE ,@stUSER2VALUE ,@stUSER3VALUE ,@stUSER4VALUE ,@stUSER5VALUE ,@stUSER6VALUE ,@stUSER7VALUE ,@stUSER8VALUE ,@stACTIVE ,@stUSER_DEF1,@stUSER_DEF2,@stUSER_DEF3,@stUSER_DEF4,@stUSER_DEF5,@stUSER_DEF6,@stUSER_DEF7 ,@stUSER_DEF8 ,	 @stUSER_STAMP ,@stPROCESS_STAMP ,@stDATE_TIME_STAMP 
	)

	set @iError = @@ERROR;

	if(@ierror = 0)
	begin 
		commit;

		update Staging_Generic_Config_Dtl
		set Processed = N'<literal:6>'
		where OBJECT_ID = @stOBJECT_ID;

	set @iInventoryRecordsLoaded = @iInventoryRecordsLoaded + 1;

	end

	else
	begin
		rollback;

		update Staging_Generic_Config_Dtl
		set USER_STAMP = N'<literal:7>'
		where Object_Id = @STOBJECT_ID;
	
	set @iInventoryRecordsError = @iInventoryRecordsError + 1;

	end
	
	set @iCurrentRecord = @iCurrentRecord + 1;

	fetch next from Generic_Config_Dtl into @stRECORDTYPE ,@stIDENTIFIER ,@stDESCRIPTION ,@stSYSTEM_CREATED ,@stSYS1VALUE ,@stSYS2VALUE ,@stSYS3VALUE ,@stSYS4VALUE ,@stSYS5VALUE ,@stUSER1VALUE ,@stUSER2VALUE ,@stUSER3VALUE ,@stUSER4VALUE ,@stUSER5VALUE ,@stUSER6VALUE ,@stUSER7VALUE ,@stUSER8VALUE ,@stACTIVE ,@stUSER_DEF1,@stUSER_DEF2,@stUSER_DEF3,@stUSER_DEF4,@stUSER_DEF5,@stUSER_DEF6,@stUSER_DEF7 ,@stUSER_DEF8 ,	 @stUSER_STAMP ,@stPROCESS_STAMP ,@stDATE_TIME_STAMP ,@stOBJECT_ID 
	
	end

	print cast(@iInventoryRecordsLoaded as nvarchar(25)) + N'<literal:8>';
	-- [comment omitted]
	-- [comment omitted]
	raiserror(N'<literal:9>', 10, 1, @iInventoryRecordsError);
	
	close Generic_Config_Dtl;
	deallocate Generic_Config_Dtl;


end


