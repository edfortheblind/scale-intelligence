-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */
/* [comment omitted] */
/* [comment omitted] */


/* [comment omitted] */









CREATE Procedure AzureSQLMaintenance
	(
		@operation nvarchar(10) = null,
		@mode nvarchar(10) = N'<literal:1>',
		@LogToTable bit = 0
	)
as
begin
	set nocount on
	declare @msg nvarchar(max);
	declare @minPageCountForIndex int = 40;
	declare @OperationTime datetime2 = sysdatetime();
	declare @KeepXOperationInLog int =3;

	/* [comment omitted] */
	set @operation = lower(@operation)
	set @mode = lower(@mode)
	
	if @mode not in (N'<literal:2>',N'<literal:3>')
		set @mode = N'<literal:4>'

	if @operation not in (N'<literal:5>',N'<literal:6>',N'<literal:7>') or @operation is null
	begin
		raiserror(N'<literal:8>',0,0)
		raiserror(N'<literal:9>',0,0)
		raiserror(N'<literal:10>',0,0)
		raiserror(N'<literal:11>',0,0)
		raiserror(N'<literal:12>',0,0)
		raiserror(N'<literal:13>',0,0)
		raiserror(N'<literal:14>',0,0)
		raiserror(N'<literal:15>',0,0)
		raiserror(N'<literal:16>',0,0)
		raiserror(N'<literal:17>',0,0)
		raiserror(N'<literal:18>',0,0)
		raiserror(N'<literal:19>',0,0)
		raiserror(N'<literal:20>',0,0)
		raiserror(N'<literal:21>',0,0)
		raiserror(N'<literal:22>',0,0)
		raiserror(N'<literal:23>',0,0)
		raiserror(N'<literal:24>',0,0)
	end
	else 
	begin
		/* [comment omitted] */
		raiserror(N'<literal:25>',0,0)
		set @msg = N'<literal:26>' + @operation;
		raiserror(@msg,0,0)
		set @msg = N'<literal:27>' + @mode;
		raiserror(@msg,0,0)
		set @msg = N'<literal:28>' + cast(@LogToTable as varchar(1));
		raiserror(@msg,0,0)
		raiserror(N'<literal:29>',0,0)
	end
	
	/* [comment omitted] */
		if object_id(N'<literal:30>') is null 
		begin
			create table AzureSQLMaintenanceLog (id bigint primary key identity(1,1), OperationTime datetime2, command varchar(4000),ExtraInfo varchar(4000), StartTime datetime2, EndTime datetime2, StatusMessage varchar(1000));
		end

	if @LogToTable=1 insert into AzureSQLMaintenanceLog values(@OperationTime,null,null,sysdatetime(),sysdatetime(),N'<literal:31>' +@operation + N'<literal:32>' + @mode + N'<literal:33>' + cast(@KeepXOperationInLog as varchar(10)) + N'<literal:34>' )	

	create table #cmdQueue (txtCMD nvarchar(max),ExtraInfo varchar(max))


	if @operation in(N'<literal:35>',N'<literal:36>')
	begin
		raiserror(N'<literal:37>',0,0) with nowait;
		/* [comment omitted] */
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
		from sys.dm_db_index_physical_stats(DB_ID(),NULL, NULL, NULL ,N'<literal:38>') i
		left join sys.indexes idxs on i.object_id = idxs.object_id and i.index_id = idxs.index_id
		where idxs.type in (1/* [comment omitted] */,2/* [comment omitted] */) /* [comment omitted] */
		order by i.avg_fragmentation_in_percent desc, page_count desc


		-- [comment omitted]
		update #idxBefore set OnlineOpIsNotSupported=1 where [object_id] in (select [object_id] from #idxBefore where index_id >=1000)
		
		
		raiserror(N'<literal:39>',0,0) with nowait
		raiserror(N'<literal:40>',0,0) with nowait
		raiserror(N'<literal:41>',0,0) with nowait

		select @msg = count(*) from #idxBefore 
		set @msg = N'<literal:42>' + @msg
		raiserror(@msg,0,0) with nowait

		select @msg = avg(avg_fragmentation_in_percent) from #idxBefore where page_count>@minPageCountForIndex
		set @msg = N'<literal:43>' + @msg
		raiserror(@msg,0,0) with nowait

		select @msg = sum(iif(avg_fragmentation_in_percent>=5 and page_count>@minPageCountForIndex,1,0)) from #idxBefore 
		set @msg = N'<literal:44>' + @msg
		raiserror(@msg,0,0) with nowait

				
		raiserror(N'<literal:45>',0,0) with nowait

			
			
			
		/* [comment omitted] */
		insert into #cmdQueue
		select 
		txtCMD = 
		case when avg_fragmentation_in_percent>5 and avg_fragmentation_in_percent<30 and @mode = N'<literal:46>' then
			N'<literal:47>' + IndexName + N'<literal:48>' + ObjectSchema + N'<literal:49>' + ObjectName + N'<literal:50>'
			when OnlineOpIsNotSupported=1 then
			N'<literal:51>' + IndexName + N'<literal:52>' + ObjectSchema + N'<literal:53>' + ObjectName + N'<literal:54>'
			else
			N'<literal:55>' + IndexName + N'<literal:56>' + ObjectSchema + N'<literal:57>' + ObjectName + N'<literal:58>'
		end
		, ExtraInfo = N'<literal:59>' + format(avg_fragmentation_in_percent/100,N'<literal:60>')
		from #idxBefore
		where 
			index_id>0 /* [comment omitted] */ 
			and index_id < 1000 /* [comment omitted] */
			-- [comment omitted]
			and 
				(
					page_count> @minPageCountForIndex and /* [comment omitted] */
					avg_fragmentation_in_percent>=5
				)
			or
				(
					@mode =N'<literal:61>'
				)
	end

	if @operation in(N'<literal:62>',N'<literal:63>')
	begin 
		/* [comment omitted] */
		raiserror(N'<literal:64>',0,0) with nowait;
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
		where OBJECT_SCHEMA_NAME(s.object_id) != N'<literal:65>' and (sp.modification_counter>0 or @mode=N'<literal:66>')
		order by sp.last_updated asc

		
		raiserror(N'<literal:67>',0,0) with nowait
		raiserror(N'<literal:68>',0,0) with nowait
		raiserror(N'<literal:69>',0,0) with nowait

		select @msg = sum(modification_counter) from #statsBefore
		set @msg = N'<literal:70>' + @msg
		raiserror(@msg,0,0) with nowait
		
		select @msg = sum(iif(modification_counter>0,1,0)) from #statsBefore
		set @msg = N'<literal:71>' + @msg
		raiserror(@msg,0,0) with nowait
				
		raiserror(N'<literal:72>',0,0) with nowait




		/* [comment omitted] */
		insert into #cmdQueue
		select 
		txtCMD = N'<literal:73>' + ObjectSchema + N'<literal:74>' + ObjectName + N'<literal:75>'+ StatsName +N'<literal:76>'
		, ExtraInfo = N'<literal:77>' + cast([rows] as varchar(100)) + N'<literal:78>' + cast(modification_counter as varchar(100)) + N'<literal:79>' + format((1.0 * modification_counter/ rows ),N'<literal:80>')
		from #statsBefore
	end


if @operation in(N'<literal:81>',N'<literal:82>',N'<literal:83>')
	begin 
		/* [comment omitted] */
		raiserror(N'<literal:84>',0,0) with nowait
		declare @SQLCMD nvarchar(max);
		declare @ExtraInfo nvarchar(max);
		declare @T table(txtCMD nvarchar(max),ExtraInfo nvarchar(max));
		while exists(select * from #cmdQueue)
		begin
			delete top (1) from #cmdQueue output deleted.* into @T;
			select top (1) @SQLCMD = txtCMD, @ExtraInfo=ExtraInfo from @T
			raiserror(@SQLCMD,0,0) with nowait
			if @LogToTable=1 insert into AzureSQLMaintenanceLog values(@OperationTime,@SQLCMD,@ExtraInfo,sysdatetime(),null,N'<literal:85>')
			begin try
				exec(@SQLCMD)	
				if @LogToTable=1 update AzureSQLMaintenanceLog set EndTime = sysdatetime(), StatusMessage = N'<literal:86>' where id=SCOPE_IDENTITY()
			end try
			begin catch
				raiserror(N'<literal:87>',0,0) with nowait
				if @LogToTable=1 update AzureSQLMaintenanceLog set EndTime = sysdatetime(), StatusMessage = N'<literal:88>' + CAST(ERROR_NUMBER() AS VARCHAR(50)) + ERROR_MESSAGE() where id=SCOPE_IDENTITY()
			end catch
			delete from @T
		end
	end
	
	/* [comment omitted] */
	if @LogToTable=1
	begin
		delete from AzureSQLMaintenanceLog 
		from 
			AzureSQLMaintenanceLog L join 
			(select distinct OperationTime from AzureSQLMaintenanceLog order by OperationTime desc offset @KeepXOperationInLog rows) F
				ON L.OperationTime = F.OperationTime
		insert into AzureSQLMaintenanceLog values(@OperationTime,null,cast(@@rowcount as varchar(100))+ N'<literal:89>' + cast( @KeepXOperationInLog as varchar(100)),sysdatetime(),sysdatetime(),N'<literal:90>')
	end

	raiserror(N'<literal:91>',0,0)
	if @LogToTable=1 insert into AzureSQLMaintenanceLog values(@OperationTime,null,null,sysdatetime(),sysdatetime(),N'<literal:92>')
end


