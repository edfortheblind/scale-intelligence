-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





	

CREATE PROCEDURE PMN_Trace (
	@condition int = 2,
	@startDateTime varchar(20)
	)
	/* [comment omitted] */

 
AS

SET NOCOUNT ON

DECLARE @version nvarchar(200)
SELECT @version = @@version

IF (@version like N'<literal:1>')
BEGIN
	exec PMN_EVENT_SESSION @condition, @startDateTime
END
ELSE
BEGIN



	declare @LongTraceID int
	declare @BlockedTraceID int
	declare @DeadlockTraceID int

	declare @LongStatus int
	declare @BlockedStatus int
	declare @DeadlockStatus int

	declare @LongFileName nvarchar(256)
	declare @BlockedFileName nvarchar(256)
	declare @DeadlockFileName nvarchar(256)

	declare @dir nvarchar(80)

	-- [comment omitted]
	declare @rc int

	declare @LongMaxfilesize bigint
	declare @BlockedMaxfilesize bigint
	declare @DeadlockMaxfilesize bigint

	set @LongTraceID = 0
	set @BlockedTraceID = 0
	set @LongTraceID = 0

	set @LongStatus = 0
	set @BlockedStatus = 0
	set @DeadlockStatus = 0

	SELECT @LongTraceID = TRACE_ID,
		   @LongFileName = FILE_NAME+N'<literal:2>'+@startDateTime,
		   @LongMaxfilesize = MAX_FILE_SIZE
	  FROM TRACE_INFO
	 where NAME = N'<literal:3>'
 
	SELECT @BlockedTraceID = TRACE_ID,
		   @BlockedFileName = FILE_NAME+N'<literal:4>'+@startDateTime,
		   @BlockedMaxfilesize = MAX_FILE_SIZE
	  FROM TRACE_INFO
	 where NAME = N'<literal:5>'
 
	SELECT @DeadlockTraceID = TRACE_ID,
		   @DeadlockFileName = FILE_NAME+N'<literal:6>'+@startDateTime,
		   @DeadlockMaxfilesize = MAX_FILE_SIZE
	  FROM TRACE_INFO
	 where NAME = N'<literal:7>'

	IF @condition = 0 and @LongTraceID > 0
		BEGIN
			select @LongStatus = cast(value as int)
			from :: fn_trace_getinfo(0)
			where traceid = @LongTraceID and property = 5

			IF @LongStatus > 0 exec sp_trace_setstatus @LongTraceID, 0 -- [comment omitted]
			exec sp_trace_setstatus @LongTraceID, 2 -- [comment omitted]

			-- [comment omitted]
			UPDATE TRACE_INFO
			   SET TRACE_ID = 0
			 WHERE NAME = N'<literal:8>'
		 
			PRINT N'<literal:9>'
		END
 
	IF @condition = 0 and @BlockedTraceID > 0
		BEGIN
			SELECT @BlockedStatus = cast(value as int)
			FROM :: fn_trace_getinfo(0)
			WHERE traceid = @BlockedTraceID and property = 5

			IF @BlockedStatus > 0 exec sp_trace_setstatus @BlockedTraceID, 0 -- [comment omitted]
			exec sp_trace_setstatus @BlockedTraceID, 2 -- [comment omitted]

			-- [comment omitted]
			UPDATE TRACE_INFO
			   SET TRACE_ID = 0
			 WHERE NAME = N'<literal:10>'
		 
			PRINT N'<literal:11>'
		END
 
	IF @condition = 0 and @DeadlockTraceID > 0
		BEGIN
			SELECT @DeadlockStatus = cast(value as int)
			FROM :: fn_trace_getinfo(0)
			WHERE traceid = @DeadlockTraceID and property = 5

			IF @DeadlockStatus > 0 exec sp_trace_setstatus @DeadlockTraceID, 0 -- [comment omitted]
			exec sp_trace_setstatus @DeadlockTraceID, 2 -- [comment omitted]

			-- [comment omitted]
			UPDATE TRACE_INFO
			   SET TRACE_ID = 0
			 WHERE NAME = N'<literal:12>'
		 
			PRINT N'<literal:13>'
		END

	IF @condition = 1
		BEGIN
    
			-- [comment omitted]
			-- [comment omitted]
			-- [comment omitted]
	    
			IF @LongTraceID < 1 
				exec @rc = sp_trace_create @LongTraceID output, 0, @LongFileName, @LongMaxfilesize, NULL -- [comment omitted]

			-- [comment omitted]
			declare @on bit
			set @on = 1

			exec sp_trace_setevent @LongTraceID, 10, 7, @on
			exec sp_trace_setevent @LongTraceID, 10, 15, @on
			exec sp_trace_setevent @LongTraceID, 10, 31, @on
			exec sp_trace_setevent @LongTraceID, 10, 8, @on
			exec sp_trace_setevent @LongTraceID, 10, 16, @on
			exec sp_trace_setevent @LongTraceID, 10, 48, @on
			exec sp_trace_setevent @LongTraceID, 10, 64, @on
			exec sp_trace_setevent @LongTraceID, 10, 1, @on
			exec sp_trace_setevent @LongTraceID, 10, 9, @on
			exec sp_trace_setevent @LongTraceID, 10, 17, @on
			exec sp_trace_setevent @LongTraceID, 10, 41, @on
			exec sp_trace_setevent @LongTraceID, 10, 49, @on
			exec sp_trace_setevent @LongTraceID, 10, 2, @on
			exec sp_trace_setevent @LongTraceID, 10, 10, @on
			exec sp_trace_setevent @LongTraceID, 10, 18, @on
			exec sp_trace_setevent @LongTraceID, 10, 26, @on
			exec sp_trace_setevent @LongTraceID, 10, 34, @on
			exec sp_trace_setevent @LongTraceID, 10, 50, @on
			exec sp_trace_setevent @LongTraceID, 10, 3, @on
			exec sp_trace_setevent @LongTraceID, 10, 11, @on
			exec sp_trace_setevent @LongTraceID, 10, 35, @on
			exec sp_trace_setevent @LongTraceID, 10, 51, @on
			exec sp_trace_setevent @LongTraceID, 10, 4, @on
			exec sp_trace_setevent @LongTraceID, 10, 12, @on
			exec sp_trace_setevent @LongTraceID, 10, 60, @on
			exec sp_trace_setevent @LongTraceID, 10, 13, @on
			exec sp_trace_setevent @LongTraceID, 10, 6, @on
			exec sp_trace_setevent @LongTraceID, 10, 14, @on
			exec sp_trace_setevent @LongTraceID, 43, 7, @on
			exec sp_trace_setevent @LongTraceID, 43, 15, @on
			exec sp_trace_setevent @LongTraceID, 43, 8, @on
			exec sp_trace_setevent @LongTraceID, 43, 48, @on
			exec sp_trace_setevent @LongTraceID, 43, 64, @on
			exec sp_trace_setevent @LongTraceID, 43, 1, @on
			exec sp_trace_setevent @LongTraceID, 43, 9, @on
			exec sp_trace_setevent @LongTraceID, 43, 41, @on
			exec sp_trace_setevent @LongTraceID, 43, 49, @on
			exec sp_trace_setevent @LongTraceID, 43, 2, @on
			exec sp_trace_setevent @LongTraceID, 43, 10, @on
			exec sp_trace_setevent @LongTraceID, 43, 26, @on
			exec sp_trace_setevent @LongTraceID, 43, 34, @on
			exec sp_trace_setevent @LongTraceID, 43, 50, @on
			exec sp_trace_setevent @LongTraceID, 43, 3, @on
			exec sp_trace_setevent @LongTraceID, 43, 11, @on
			exec sp_trace_setevent @LongTraceID, 43, 35, @on
			exec sp_trace_setevent @LongTraceID, 43, 51, @on
			exec sp_trace_setevent @LongTraceID, 43, 4, @on
			exec sp_trace_setevent @LongTraceID, 43, 12, @on
			exec sp_trace_setevent @LongTraceID, 43, 28, @on
			exec sp_trace_setevent @LongTraceID, 43, 60, @on
			exec sp_trace_setevent @LongTraceID, 43, 5, @on
			exec sp_trace_setevent @LongTraceID, 43, 13, @on
			exec sp_trace_setevent @LongTraceID, 43, 29, @on
			exec sp_trace_setevent @LongTraceID, 43, 6, @on
			exec sp_trace_setevent @LongTraceID, 43, 14, @on
			exec sp_trace_setevent @LongTraceID, 43, 22, @on
			exec sp_trace_setevent @LongTraceID, 43, 62, @on
			exec sp_trace_setevent @LongTraceID, 45, 7, @on
			exec sp_trace_setevent @LongTraceID, 45, 55, @on
			exec sp_trace_setevent @LongTraceID, 45, 8, @on
			exec sp_trace_setevent @LongTraceID, 45, 16, @on
			exec sp_trace_setevent @LongTraceID, 45, 48, @on
			exec sp_trace_setevent @LongTraceID, 45, 64, @on
			exec sp_trace_setevent @LongTraceID, 45, 1, @on
			exec sp_trace_setevent @LongTraceID, 45, 9, @on
			exec sp_trace_setevent @LongTraceID, 45, 17, @on
			exec sp_trace_setevent @LongTraceID, 45, 25, @on
			exec sp_trace_setevent @LongTraceID, 45, 41, @on
			exec sp_trace_setevent @LongTraceID, 45, 49, @on
			exec sp_trace_setevent @LongTraceID, 45, 10, @on
			exec sp_trace_setevent @LongTraceID, 45, 18, @on
			exec sp_trace_setevent @LongTraceID, 45, 26, @on
			exec sp_trace_setevent @LongTraceID, 45, 34, @on
			exec sp_trace_setevent @LongTraceID, 45, 50, @on
			exec sp_trace_setevent @LongTraceID, 45, 3, @on
			exec sp_trace_setevent @LongTraceID, 45, 11, @on
			exec sp_trace_setevent @LongTraceID, 45, 35, @on
			exec sp_trace_setevent @LongTraceID, 45, 51, @on
			exec sp_trace_setevent @LongTraceID, 45, 4, @on
			exec sp_trace_setevent @LongTraceID, 45, 12, @on
			exec sp_trace_setevent @LongTraceID, 45, 28, @on
			exec sp_trace_setevent @LongTraceID, 45, 60, @on
			exec sp_trace_setevent @LongTraceID, 45, 5, @on
			exec sp_trace_setevent @LongTraceID, 45, 13, @on
			exec sp_trace_setevent @LongTraceID, 45, 29, @on
			exec sp_trace_setevent @LongTraceID, 45, 61, @on
			exec sp_trace_setevent @LongTraceID, 45, 6, @on
			exec sp_trace_setevent @LongTraceID, 45, 14, @on
			exec sp_trace_setevent @LongTraceID, 45, 22, @on
			exec sp_trace_setevent @LongTraceID, 45, 62, @on
			exec sp_trace_setevent @LongTraceID, 45, 15, @on
			exec sp_trace_setevent @LongTraceID, 12, 7, @on
			exec sp_trace_setevent @LongTraceID, 12, 15, @on
			exec sp_trace_setevent @LongTraceID, 12, 31, @on
			exec sp_trace_setevent @LongTraceID, 12, 8, @on
			exec sp_trace_setevent @LongTraceID, 12, 16, @on
			exec sp_trace_setevent @LongTraceID, 12, 48, @on
			exec sp_trace_setevent @LongTraceID, 12, 64, @on
			exec sp_trace_setevent @LongTraceID, 12, 1, @on
			exec sp_trace_setevent @LongTraceID, 12, 9, @on
			exec sp_trace_setevent @LongTraceID, 12, 17, @on
			exec sp_trace_setevent @LongTraceID, 12, 41, @on
			exec sp_trace_setevent @LongTraceID, 12, 49, @on
			exec sp_trace_setevent @LongTraceID, 12, 6, @on
			exec sp_trace_setevent @LongTraceID, 12, 10, @on
			exec sp_trace_setevent @LongTraceID, 12, 14, @on
			exec sp_trace_setevent @LongTraceID, 12, 18, @on
			exec sp_trace_setevent @LongTraceID, 12, 26, @on
			exec sp_trace_setevent @LongTraceID, 12, 50, @on
			exec sp_trace_setevent @LongTraceID, 12, 3, @on
			exec sp_trace_setevent @LongTraceID, 12, 11, @on
			exec sp_trace_setevent @LongTraceID, 12, 35, @on
			exec sp_trace_setevent @LongTraceID, 12, 51, @on
			exec sp_trace_setevent @LongTraceID, 12, 4, @on
			exec sp_trace_setevent @LongTraceID, 12, 12, @on
			exec sp_trace_setevent @LongTraceID, 12, 60, @on
			exec sp_trace_setevent @LongTraceID, 12, 13, @on
			exec sp_trace_setevent @LongTraceID, 41, 7, @on
			exec sp_trace_setevent @LongTraceID, 41, 15, @on
			exec sp_trace_setevent @LongTraceID, 41, 55, @on
			exec sp_trace_setevent @LongTraceID, 41, 8, @on
			exec sp_trace_setevent @LongTraceID, 41, 16, @on
			exec sp_trace_setevent @LongTraceID, 41, 48, @on
			exec sp_trace_setevent @LongTraceID, 41, 64, @on
			exec sp_trace_setevent @LongTraceID, 41, 1, @on
			exec sp_trace_setevent @LongTraceID, 41, 9, @on
			exec sp_trace_setevent @LongTraceID, 41, 17, @on
			exec sp_trace_setevent @LongTraceID, 41, 25, @on
			exec sp_trace_setevent @LongTraceID, 41, 41, @on
			exec sp_trace_setevent @LongTraceID, 41, 49, @on
			exec sp_trace_setevent @LongTraceID, 41, 10, @on
			exec sp_trace_setevent @LongTraceID, 41, 18, @on
			exec sp_trace_setevent @LongTraceID, 41, 26, @on
			exec sp_trace_setevent @LongTraceID, 41, 50, @on
			exec sp_trace_setevent @LongTraceID, 41, 3, @on
			exec sp_trace_setevent @LongTraceID, 41, 11, @on
			exec sp_trace_setevent @LongTraceID, 41, 35, @on
			exec sp_trace_setevent @LongTraceID, 41, 51, @on
			exec sp_trace_setevent @LongTraceID, 41, 4, @on
			exec sp_trace_setevent @LongTraceID, 41, 12, @on
			exec sp_trace_setevent @LongTraceID, 41, 60, @on
			exec sp_trace_setevent @LongTraceID, 41, 5, @on
			exec sp_trace_setevent @LongTraceID, 41, 13, @on
			exec sp_trace_setevent @LongTraceID, 41, 29, @on
			exec sp_trace_setevent @LongTraceID, 41, 61, @on
			exec sp_trace_setevent @LongTraceID, 41, 6, @on
			exec sp_trace_setevent @LongTraceID, 41, 14, @on

			-- [comment omitted]
			declare @bigintfilter bigint
			declare @filterValue nvarchar
			declare @logicalOp int
			declare @comparisonOp int
	    
			set @bigintfilter = 2000000
		
			declare curFilters cursor for
			SELECT COLUMN_ID, MIN_VALUE, FILTER_VALUE, LOGICAL_OP, COMPARISON_OP
			  FROM TRACE_FILTER
			 WHERE ACTIVE = N'<literal:14>'

			declare @columnid int

			open curFilters
			fetch curFilters 
			into @columnid, @bigintfilter, @filterValue, @logicalOp, @comparisonOp
		
			while @@fetch_status = 0 
				begin
					if (@filterValue is null)
					   exec sp_trace_setfilter @LongTraceID, @columnid, @logicalOp, @comparisonOp, @bigintfilter    
					else
					   exec sp_trace_setfilter @LongTraceID, @columnid, @logicalOp, @comparisonOp, @filterValue    

					fetch curFilters 
					 into @columnid, @bigintfilter, @filterValue, @logicalOp, @comparisonOp
				end
    
			close curFilters
			deallocate curFilters

			exec sp_trace_setstatus @LongTraceID, 1 -- [comment omitted]

			-- [comment omitted]
			UPDATE TRACE_INFO
			   SET TRACE_ID = @LongTraceID
			 WHERE NAME = N'<literal:15>';
	     
			-- [comment omitted]
			-- [comment omitted]
    
			IF @BlockedTraceID < 1 
				exec @rc = sp_trace_create @BlockedTraceID output, 0, @BlockedFileName, @BlockedMaxfilesize, NULL -- [comment omitted]

			exec sp_trace_setevent @BlockedTraceID, 137, 3, @on
			exec sp_trace_setevent @BlockedTraceID, 137, 15, @on
			exec sp_trace_setevent @BlockedTraceID, 137, 51, @on
			exec sp_trace_setevent @BlockedTraceID, 137, 4, @on
			exec sp_trace_setevent @BlockedTraceID, 137, 24, @on
			exec sp_trace_setevent @BlockedTraceID, 137, 32, @on
			exec sp_trace_setevent @BlockedTraceID, 137, 60, @on
			exec sp_trace_setevent @BlockedTraceID, 137, 64, @on
			exec sp_trace_setevent @BlockedTraceID, 137, 1, @on
			exec sp_trace_setevent @BlockedTraceID, 137, 13, @on
			exec sp_trace_setevent @BlockedTraceID, 137, 41, @on
			exec sp_trace_setevent @BlockedTraceID, 137, 22, @on
			exec sp_trace_setevent @BlockedTraceID, 137, 26, @on
			
			exec sp_trace_setstatus @BlockedTraceID, 1 -- [comment omitted]
	
			-- [comment omitted]
			UPDATE TRACE_INFO
			   SET TRACE_ID = @BlockedTraceID
			 WHERE NAME = N'<literal:16>';
     
			-- [comment omitted]
			-- [comment omitted]
    
			IF @DeadlockTraceID < 1 
				exec @rc = sp_trace_create @DeadlockTraceID output, 0, @DeadlockFileName, @DeadlockMaxfilesize, NULL -- [comment omitted]

			exec sp_trace_setevent @DeadlockTraceID, 148, 11, @on
			exec sp_trace_setevent @DeadlockTraceID, 148, 51, @on
			exec sp_trace_setevent @DeadlockTraceID, 148, 4, @on
			exec sp_trace_setevent @DeadlockTraceID, 148, 12, @on
			exec sp_trace_setevent @DeadlockTraceID, 148, 14, @on
			exec sp_trace_setevent @DeadlockTraceID, 148, 26, @on
			exec sp_trace_setevent @DeadlockTraceID, 148, 60, @on
			exec sp_trace_setevent @DeadlockTraceID, 148, 64, @on
			exec sp_trace_setevent @DeadlockTraceID, 148, 1, @on
			exec sp_trace_setevent @DeadlockTraceID, 148, 41, @on
			exec sp_trace_setstatus @DeadlockTraceID, 1 -- [comment omitted]
		
			-- [comment omitted]
			UPDATE TRACE_INFO
			   SET TRACE_ID = @DeadlockTraceID
			 WHERE NAME = N'<literal:17>';
				     
	   END

	SET @LongStatus = 0
	SELECT @LongStatus = cast(value as int) 
	  FROM :: fn_trace_getinfo(0)
	 WHERE traceid = @LongTraceID and property = 5
 
	IF @LongTraceID > 0 and @LongStatus > 0
		BEGIN
			SELECT @dir = cast(value as nvarchar(80)) 
			  FROM :: fn_trace_getinfo(0)
			 WHERE traceid = @LongTraceID and property = 2
		
			SELECT N'<literal:18>' + @dir
		END
	ELSE 
		SELECT N'<literal:19>'

	SET @BlockedStatus = 0
	SELECT @BlockedStatus = cast(value as int) 
	  FROM :: fn_trace_getinfo(0)
	 WHERE traceid = @BlockedTraceID and property = 5
 
	IF @BlockedTraceID > 0 and @BlockedStatus > 0
		BEGIN
			SELECT @dir = cast(value as nvarchar(80)) 
			  FROM :: fn_trace_getinfo(0)
			 WHERE traceid = @BlockedTraceID and property = 2
		
			SELECT N'<literal:20>' + @dir
		END
	ELSE 
		SELECT N'<literal:21>'

	SET @DeadlockStatus = 0
	SELECT @DeadlockStatus = cast(value as int) 
	  FROM :: fn_trace_getinfo(0)
	 WHERE traceid = @DeadlockTraceID and property = 5
 
	IF @DeadlockTraceID > 0 and @DeadlockStatus > 0
		BEGIN
			SELECT @dir = cast(value as nvarchar(80)) 
			  FROM :: fn_trace_getinfo(0)
			 WHERE traceid = @DeadlockTraceID and property = 2
		 
			SELECT N'<literal:22>' + @dir
		END
	ELSE 
		SELECT N'<literal:23>'

END
SET NOCOUNT OFF