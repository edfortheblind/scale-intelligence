  
/* Azure SQL Maintenance - Maintenance script for Azure SQL Database */    
/* This script provided AS IS, Please review the code before executing this on production environment */    
/* For any issue or suggestion please email to: yocr@microsoft.com */    
    
    
/*     
***********************************************    
 Current Version Date: 2017-12-12     
***********************************************    
    
Change Log:     
 2017-12-12: fix total indexes reported to the output window. functionality was not impacted by this issue.    
    
*/    
    
CREATE Procedure [dbo].[AzureSQLMaintenance_1]    
 (    
  @operation nvarchar(10) = null,    
  @mode nvarchar(10) = N'smart',    
  @LogToTable bit = 0    
 )    
as    
begin    
 set nocount on    
 declare @msg nvarchar(max);    
 declare @minPageCountForIndex int = 40;    
 declare @OperationTime datetime2 = sysdatetime();    
 declare @KeepXOperationInLog int =3;    
    
 /* make sure parameters selected correctly */    
 set @operation = lower(@operation)    
 set @mode = lower(@mode)    
     
 if @mode not in (N'smart',N'dummy')    
  set @mode = N'smart'    
    
 if @operation not in (N'index',N'statistics',N'all') or @operation is null    
 begin    
  raiserror(N'@operation (varchar(10)) [mandatory]',0,0)    
  raiserror(N' Select operation to perform:',0,0)    
  raiserror(N'     "index" to perform index maintenance',0,0)    
  raiserror(N'     "statistics" to perform statistics maintenance',0,0)    
  raiserror(N'     "all" to perform indexes and statistics maintenance',0,0)    
  raiserror(N' ',0,0)    
  raiserror(N'@mode(varchar(10)) [optional]',0,0)    
  raiserror(N' optionaly you can supply second parameter for operation mode: ',0,0)    
  raiserror(N'     "smart" (Default) using smart decition about what index or stats should be touched.',0,0)    
  raiserror(N'     "dummy" going through all indexes and statistics regardless thier modifications or fragmentation.',0,0)    
  raiserror(N' ',0,0)    
  raiserror(N'@LogToTable(bit) [optional]',0,0)    
  raiserror(N' Logging option: @LogToTable(bit)',0,0)    
  raiserror(N'     0 - (Default) do not log operation to table',0,0)    
  raiserror(N'     1 - log operation to table',0,0)    
  raiserror(N'  for logging option only 3 last execution will be kept by default. this can be changed by easily in the procedure body.',0,0)    
  raiserror(N'  Log table will be created automatically if not exists.',0,0)    
 end    
 else     
 begin    
  /*Write operation parameters*/    
  raiserror(N'-----------------------',0,0)    
  set @msg = N'set operation = ' + @operation;    
  raiserror(@msg,0,0)    
  set @msg = N'set mode = ' + @mode;    
  raiserror(@msg,0,0)    
  set @msg = N'set LogToTable = ' + cast(@LogToTable as varchar(1));    
  raiserror(@msg,0,0)    
  raiserror(N'-----------------------',0,0)    
 end    
     
 /* Prepare Log Table */    
  if object_id(N'AzureSQLMaintenanceLog') is null     
  begin    
   create table AzureSQLMaintenanceLog (id bigint primary key identity(1,1), OperationTime datetime2, command varchar(4000),ExtraInfo varchar(4000), StartTime datetime2, EndTime datetime2, StatusMessage varchar(1000));    
  end    
    
 if @LogToTable=1 insert into AzureSQLMaintenanceLog values(@OperationTime,null,null,sysdatetime(),sysdatetime(),N'Starting operation: Operation=' +@operation + N' Mode=' + @mode + N' Keep log for last ' + cast(@KeepXOperationInLog as varchar(10)) + N' operations' )     
    
 create table #cmdQueue (txtCMD nvarchar(max),ExtraInfo varchar(max))    
    
    
 if @operation in(N'index',N'all')    
 begin    
  raiserror(N'Get index information...(wait)',0,0) with nowait;    
  /* Get Index Information */    
  select     
   i.[object_id]    
   ,ObjectSchema = OBJECT_SCHEMA_NAME(i.object_id)    
   ,ObjectName = object_name(i.object_id)     
   ,IndexName = idxs.name    
   ,i.avg_fragmentation_in_percent    
   ,i.page_count    
   ,i.index_id    
   ,i.partition_number    
   ,i.index_type_desc    
   ,i.avg_page_space_used_in_percent    
   ,i.record_count    
   ,i.ghost_record_count    
   ,i.forwarded_record_count    
   ,null as OnlineOpIsNotSupported    
  into #idxBefore    
  from sys.dm_db_index_physical_stats(DB_ID(),NULL, NULL, NULL ,N'limited') i    
  left join sys.indexes idxs on i.object_id = idxs.object_id and i.index_id = idxs.index_id    
  where idxs.type in (1/*Clustered index*/,2/*NonClustered index*/) /*Avoid HEAPS*/    
  order by i.avg_fragmentation_in_percent desc, page_count desc    
    
    
  -- mark indexes XML,spatial and columnstore not to run online update     
  update #idxBefore set OnlineOpIsNotSupported=1 where [object_id] in (select [object_id] from #idxBefore where index_id >=1000)    
      
      
  raiserror(N'---------------------------------------',0,0) with nowait    
  raiserror(N'Index Information:',0,0) with nowait    
  raiserror(N'---------------------------------------',0,0) with nowait    
    
  select @msg = count(*) from #idxBefore     
  set @msg = N'Total Indexes: ' + @msg    
  raiserror(@msg,0,0) with nowait    
    
  select @msg = avg(avg_fragmentation_in_percent) from #idxBefore where page_count>@minPageCountForIndex    
  set @msg = N'Average Fragmentation: ' + @msg    
  raiserror(@msg,0,0) with nowait    
    
  select @msg = sum(iif(avg_fragmentation_in_percent>=5 and page_count>@minPageCountForIndex,1,0)) from #idxBefore     
  set @msg = N'Fragmented Indexes: ' + @msg    
  raiserror(@msg,0,0) with nowait    
    
        
  raiserror(N'---------------------------------------',0,0) with nowait    
    
       
       
       
  /* create queue for update indexes */    
  insert into #cmdQueue    
  select     
  txtCMD =     
  case when avg_fragmentation_in_percent>5 and avg_fragmentation_in_percent<30 and @mode = N'smart' then    
   N'ALTER INDEX [' + IndexName + N'] ON [' + ObjectSchema + N'].[' + ObjectName + N'] REORGANIZE WITH(ONLINE=OFF,MAXDOP=8);'    
   when OnlineOpIsNotSupported=1 then    
   N'ALTER INDEX [' + IndexName + N'] ON [' + ObjectSchema + N'].[' + ObjectName + N'] REBUILD WITH(ONLINE=OFF,MAXDOP=8);'    
   else    
   N'ALTER INDEX [' + IndexName + N'] ON [' + ObjectSchema + N'].[' + ObjectName + N'] REBUILD WITH(ONLINE=ON,MAXDOP=8);'    
  end    
  , ExtraInfo = N'Current fragmentation: ' + format(avg_fragmentation_in_percent/100,N'p')    
  from #idxBefore    
  where     
   index_id>0 /*disable heaps*/     
   and index_id < 1000 /* disable XML indexes */    
   --    
   and     
    (    
     page_count> @minPageCountForIndex and /* not small tables */    
     avg_fragmentation_in_percent>=5    
    )    
   or    
    (    
     @mode =N'dummy'    
    )    
 end    
    
 if @operation in(N'statistics',N'all')    
 begin     
  /*Gets Stats for database*/    
  raiserror(N'Get statistics information...',0,0) with nowait;    
  select     
   ObjectSchema = OBJECT_SCHEMA_NAME(s.object_id)    
   ,ObjectName = object_name(s.object_id)     
   ,StatsName = s.name    
   ,sp.last_updated    
   ,sp.rows    
   ,sp.rows_sampled    
   ,sp.modification_counter    
  into #statsBefore    
  from sys.stats s cross apply sys.dm_db_stats_properties(s.object_id,s.stats_id) sp     
  where OBJECT_SCHEMA_NAME(s.object_id) != N'sys' and (sp.modification_counter>0 or @mode=N'dummy')    
  order by sp.last_updated asc    
    
      
  raiserror(N'---------------------------------------',0,0) with nowait    
  raiserror(N'Statistics Information:',0,0) with nowait    
  raiserror(N'---------------------------------------',0,0) with nowait    
    
  select @msg = sum(modification_counter) from #statsBefore    
  set @msg = N'Total Modifications: ' + @msg    
  raiserror(@msg,0,0) with nowait    
      
  select @msg = sum(iif(modification_counter>0,1,0)) from #statsBefore    
  set @msg = N'Modified Statistics: ' + @msg    
  raiserror(@msg,0,0) with nowait    
        
  raiserror(N'---------------------------------------',0,0) with nowait    
    
    
    
    
  /* create queue for update stats */    
  insert into #cmdQueue    
  select     
  txtCMD = N'UPDATE STATISTICS [' + ObjectSchema + N'].[' + ObjectName + N'] (['+ StatsName +N']);'    
  , ExtraInfo = N'#rows:' + cast([rows] as varchar(100)) + N' #modifications:' + cast(modification_counter as varchar(100)) + N' modification percent: ' + format((1.0 * modification_counter/ rows ),N'p')    
  from #statsBefore    
 end    
    
    
if @operation in(N'statistics',N'index',N'all')    
 begin     
  /* iterate through all stats */    
  raiserror(N'Start executing commands...',0,0) with nowait    
  declare @SQLCMD nvarchar(max);    
  declare @ExtraInfo nvarchar(max);    
  declare @T table(txtCMD nvarchar(max),ExtraInfo nvarchar(max));    
  while exists(select * from #cmdQueue)    
  begin    
   delete top (1) from #cmdQueue output deleted.* into @T;    
   select top (1) @SQLCMD = txtCMD, @ExtraInfo=ExtraInfo from @T    
   raiserror(@SQLCMD,0,0) with nowait    
   if @LogToTable=1 insert into AzureSQLMaintenanceLog values(@OperationTime,@SQLCMD,@ExtraInfo,sysdatetime(),null,N'Started')    
   begin try    
    exec(@SQLCMD)     
    if @LogToTable=1 update AzureSQLMaintenanceLog set EndTime = sysdatetime(), StatusMessage = N'Succeeded' where id=SCOPE_IDENTITY()    
   end try    
   begin catch    
    raiserror(N'cached',0,0) with nowait    
    if @LogToTable=1 update AzureSQLMaintenanceLog set EndTime = sysdatetime(), StatusMessage = N'FAILED : ' + CAST(ERROR_NUMBER() AS VARCHAR(50)) + ERROR_MESSAGE() where id=SCOPE_IDENTITY()    
   end catch    
   delete from @T    
  end    
 end    
     
 /* Clean old records from log table */    
 if @LogToTable=1    
 begin    
  delete from AzureSQLMaintenanceLog     
  from     
   AzureSQLMaintenanceLog L join     
   (select distinct OperationTime from AzureSQLMaintenanceLog order by OperationTime desc offset @KeepXOperationInLog rows) F    
    ON L.OperationTime = F.OperationTime    
  insert into AzureSQLMaintenanceLog values(@OperationTime,null,cast(@@rowcount as varchar(100))+ N' rows purged from log table because number of operations to keep is set to: ' + cast( @KeepXOperationInLog as varchar(100)),sysdatetime(),sysdatetime(),N'Cleanup Log Table')    
 end    
    
 raiserror(N'Done',0,0)    
 if @LogToTable=1 insert into AzureSQLMaintenanceLog values(@OperationTime,null,null,sysdatetime(),sysdatetime(),N'End of operation')    
end    
    
    
/*    
Examples    
    
1. run through all indexes and statistic and take smart decision about steps taken for each object    
exec  AzureSQLMaintenance N'all'    
    
1.1 add log to table    
exec  AzureSQLMaintenance N'all', @LogToTable=1    
    
    
2. run through all indexes and statistic with no limitation (event non modified object will be rebuild or updated)    
exec  AzureSQLMaintenance N'all',N'dummy'    
    
    
3. run smart maintenance only for statistics    
exec  AzureSQLMaintenance N'statistics'    
    
    
4. run smart maintenance only for indexes    
exec  AzureSQLMaintenance N'index'    
    
*/  