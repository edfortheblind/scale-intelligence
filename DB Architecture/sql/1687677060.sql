-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
create procedure RPT_CSO_HighestNbrConcurrentUsrsEver
as
begin
	-- [comment omitted]
	declare @endtime datetime
	declare @count int
	-- [comment omitted]
	declare @starttime datetime
	declare @peaktime datetime
	declare @peak int
	declare @currentTime datetime
	-- [comment omitted]
	SELECT @starttime = MIN(LOGON_DATE_TIME)
	FROM USER_ACTIVITY
	-- [comment omitted]
	set @endtime = getdate()
	set @peaktime = getdate()
	set @peak = 0
	set @currentTime = @startTime
	
	while (@currentTime <= @endTime)
	begin
		select @count = count(distinct user_name)
		from user_activity with (nolock)
		where @currentTime BETWEEN logon_date_time 
		and case 
			when logoff_note = '<literal:1>' then last_action_date_time else logoff_date_time 
		end
	
		-- [comment omitted]
		if (@peak < @count)
		BEGIN 
			set @peaktime = @currentTime
			set @peak = @count
        	END	
		set @currentTime = DATEADD(hh,1,@currentTime)
	end
	select '<literal:2>'+cast(@peak as varchar)+'<literal:3>'+cast(@peaktime as varchar)
end