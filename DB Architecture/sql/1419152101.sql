-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

CREATE PROCEDURE trace_ILS @condition int = 2 AS
/* [comment omitted] */


 
SET NOCOUNT ON

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

set nocount on

SELECT @LongTraceID = ti.traceid,
       @LongFileName = file_name+N'<literal:1>'+REPLACE(REPLACE(REPLACE(convert(varchar,getdate(),20),'<literal:2>','<literal:3>'),'<literal:4>','<literal:5>'),'<literal:6>','<literal:7>'),
       @LongMaxfilesize = max_file_size
  FROM trace_info ti
 where name = N'<literal:8>'
 
 SELECT @BlockedTraceID = ti.traceid,
       @BlockedFileName = file_name+N'<literal:9>'+REPLACE(REPLACE(REPLACE(convert(varchar,getdate(),20),'<literal:10>','<literal:11>'),'<literal:12>','<literal:13>'),'<literal:14>','<literal:15>'),
       @BlockedMaxfilesize = max_file_size
  FROM trace_info ti
 where name = N'<literal:16>'
 
 SELECT @DeadlockTraceID = ti.traceid,
       @DeadlockFileName = file_name+N'<literal:17>'+REPLACE(REPLACE(REPLACE(convert(varchar,getdate(),20),'<literal:18>','<literal:19>'),'<literal:20>','<literal:21>'),'<literal:22>','<literal:23>'),
       @DeadlockMaxfilesize = max_file_size
  FROM trace_info ti
 where name = N'<literal:24>'

IF @condition = 0 and @LongTraceID > 0
 begin
  select @LongStatus = cast(value as int)
    from :: fn_trace_getinfo(0)
   where traceid = @LongTraceID and property = 5

  IF @LongStatus > 0 exec sp_trace_setstatus @LongTraceID, 0 -- [comment omitted]
  exec sp_trace_setstatus @LongTraceID, 2 -- [comment omitted]

   -- [comment omitted]
   UPDATE trace_info
      SET traceid = 0
    WHERE name = N'<literal:25>'
    PRINT N'<literal:26>'
 end
 
 IF @condition = 0 and @BlockedTraceID > 0
 begin
  select @BlockedStatus = cast(value as int)
    from :: fn_trace_getinfo(0)
   where traceid = @BlockedTraceID and property = 5

  IF @BlockedStatus > 0 exec sp_trace_setstatus @BlockedTraceID, 0 -- [comment omitted]
  exec sp_trace_setstatus @BlockedTraceID, 2 -- [comment omitted]

   -- [comment omitted]
   UPDATE trace_info
      SET traceid = 0
    WHERE name = N'<literal:27>'
    PRINT N'<literal:28>'
 end
 
 IF @condition = 0 and @DeadlockTraceID > 0
 begin
  select @DeadlockStatus = cast(value as int)
    from :: fn_trace_getinfo(0)
   where traceid = @DeadlockTraceID and property = 5

  IF @DeadlockStatus > 0 exec sp_trace_setstatus @DeadlockTraceID, 0 -- [comment omitted]
  exec sp_trace_setstatus @DeadlockTraceID, 2 -- [comment omitted]

   -- [comment omitted]
   UPDATE trace_info
      SET traceid = 0
    WHERE name = N'<literal:29>'
    PRINT N'<literal:30>'
 end

IF @condition = 1
   begin
    
    -- [comment omitted]
    -- [comment omitted]
    -- [comment omitted]
    
    IF @LongTraceID < 1 exec @rc = sp_trace_create @LongTraceID output, 0, @LongFileName, @LongMaxfilesize, NULL -- [comment omitted]

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
    select columnid, minValue, filterValue, logicalOp, comparisonOp
      from trace_filter
     where active = '<literal:31>'

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
    UPDATE trace_info
       SET traceid = @LongTraceID
     WHERE name = '<literal:32>';
     
     -- [comment omitted]
    -- [comment omitted]
    
    IF @BlockedTraceID < 1 exec @rc = sp_trace_create @BlockedTraceID output, 0, @BlockedFileName, @BlockedMaxfilesize, NULL -- [comment omitted]

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
    UPDATE trace_info
       SET traceid = @BlockedTraceID
     WHERE name = '<literal:33>';
     
     -- [comment omitted]
    -- [comment omitted]
    
    IF @DeadlockTraceID < 1 exec @rc = sp_trace_create @DeadlockTraceID output, 0, @DeadlockFileName, @DeadlockMaxfilesize, NULL -- [comment omitted]

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
    UPDATE trace_info
       SET traceid = @DeadlockTraceID
     WHERE name = '<literal:34>';
		     
   end

set @LongStatus = 0
select @LongStatus = cast(value as int) FROM :: fn_trace_getinfo(0)
 where traceid = @LongTraceID and property = 5
IF @LongTraceID > 0 and @LongStatus > 0
   begin
    select @dir = cast(value as nvarchar(80)) FROM :: fn_trace_getinfo(0)
     where traceid = @LongTraceID and property = 2
    select '<literal:35>' + @dir
   end
ELSE select '<literal:36>'

set @BlockedStatus = 0
select @BlockedStatus = cast(value as int) FROM :: fn_trace_getinfo(0)
 where traceid = @BlockedTraceID and property = 5
IF @BlockedTraceID > 0 and @BlockedStatus > 0
   begin
    select @dir = cast(value as nvarchar(80)) FROM :: fn_trace_getinfo(0)
     where traceid = @BlockedTraceID and property = 2
    select '<literal:37>' + @dir
   end
ELSE select '<literal:38>'

set @DeadlockStatus = 0
select @DeadlockStatus = cast(value as int) FROM :: fn_trace_getinfo(0)
 where traceid = @DeadlockTraceID and property = 5
IF @DeadlockTraceID > 0 and @DeadlockStatus > 0
   begin
    select @dir = cast(value as nvarchar(80)) FROM :: fn_trace_getinfo(0)
     where traceid = @DeadlockTraceID and property = 2
    select '<literal:39>' + @dir
   end
ELSE select '<literal:40>'


set nocount off