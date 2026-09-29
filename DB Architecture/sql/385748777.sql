-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





























CREATE PROCEDURE RPT_RecApptDaySchedule(
	@day datetime,
	@dock nvarchar(25),
	@warehouse nvarchar(25))
AS
begin
	select 
		* 
	from
		(select 
			* 
		 from 
			(
			select dateadd(hh, 00, @day) hour union all 
			select dateadd(hh, 01, @day) hour union all 
			select dateadd(hh, 02, @day) hour union all 
			select dateadd(hh, 03, @day) hour union all 
			select dateadd(hh, 04, @day) hour union all 
			select dateadd(hh, 05, @day) hour union all 
			select dateadd(hh, 06, @day) hour union all 
			select dateadd(hh, 07, @day) hour union all 
			select dateadd(hh, 08, @day) hour union all 
			select dateadd(hh, 09, @day) hour union all 
			select dateadd(hh, 10, @day) hour union all 
			select dateadd(hh, 11, @day) hour union all 
			select dateadd(hh, 12, @day) hour union all 
			select dateadd(hh, 13, @day) hour union all 
			select dateadd(hh, 14, @day) hour union all 
			select dateadd(hh, 15, @day) hour union all 
			select dateadd(hh, 16, @day) hour union all 
			select dateadd(hh, 17, @day) hour union all 
			select dateadd(hh, 18, @day) hour union all 
			select dateadd(hh, 19, @day) hour union all 
			select dateadd(hh, 20, @day) hour union all 
			select dateadd(hh, 21, @day) hour union all 
			select dateadd(hh, 22, @day) hour union all 
			select dateadd(hh, 23, @day) hour
			) hours
		) hours
	left outer join
		(select 
			appt.appt_date_time as appt_date_time,
			appt.end_date_time as end_date_time,
			rh.receipt_id as receipt_id, 
			rh.source_name as source_name, 
			rh.total_lines as total_lines, 
			rh.total_weight as total_weight,
			rh.weight_um as weight_um,
			 (select case  
									when (trailer_id is NULL) then NULL
									when (count(*) = 1) then trailer_id 									
									when (count(*) > 1) then trailer_id + N'<literal:1>' + dbo.RSCMfn_RtrvResource(N'<literal:2>',N'<literal:3>',N'<literal:4>')
								end as N'<literal:5>'  from receipt_header 
							where	trailer_id = rh.trailer_id group by trailer_id)	 as trailer_id
		 from
			appointment_schedule appt,
			receipt_header rh
		 where
			-- [comment omitted]
			appt.internal_receipt_num = rh.internal_receipt_num
		 and
			-- [comment omitted]
			convert(datetime, convert(char(10), appt.appt_date_time, 101)) = @day
		 and
			-- [comment omitted]
			appt.dock = @dock
		 and
			-- [comment omitted]
			rh.warehouse = @warehouse
		) recInfo
	on
		(
			datepart(hh, hours.hour) = datepart(hh, recInfo.appt_date_time)
				or 
			datepart(hh, hours.hour) = datepart(hh, recInfo.end_date_time)
		)
	order by
		hours.hour, recInfo.appt_date_time, recInfo.receipt_id;
end -- [comment omitted]


