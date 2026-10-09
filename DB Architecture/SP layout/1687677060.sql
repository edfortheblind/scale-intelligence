create procedure RPT_CSO_HighestNbrConcurrentUsrsEver
as
begin
	--DECLARE GENERIC VARIABLES
	declare @endtime datetime
	declare @count int
	--DECLARE ALL TIME VARIABLES
	declare @starttime datetime
	declare @peaktime datetime
	declare @peak int
	declare @currentTime datetime
	--SET ALL TIME VALUES
	SELECT @starttime = MIN(LOGON_DATE_TIME)
	FROM USER_ACTIVITY
	--set @startTime = getDate() - 90
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
			when logoff_note = 'Auto log off' then last_action_date_time else logoff_date_time 
		end
	
		--MAX ALL TIME USER COUNT
		if (@peak < @count)
		BEGIN 
			set @peaktime = @currentTime
			set @peak = @count
        	END	
		set @currentTime = DATEADD(hh,1,@currentTime)
	end
	select '  MAX Users Ever - '+cast(@peak as varchar)+' on '+cast(@peaktime as varchar)
end