-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */

















CREATE PROCEDURE RPT_RecApptHeaderInfo(
	@startDate datetime,
	@endDate datetime,
	@warehouse nvarchar(25))
AS
begin
	select 
		convert(datetime, convert(char(10), appt.appt_date_time, 101)) day, 
		appt.dock,
		rh.warehouse,
		count(*) total_receipts, 
		sum(rh.total_qty) total_qty, 
		sum(rh.total_lines) total_lines, 
		sum(rh.total_weight) total_weight, 
		sum(rh.total_volume) total_volume, 
		sum(rh.total_value) total_value
	from 
		appointment_schedule appt,
		receipt_header rh
	where
		-- [comment omitted]
		appt.internal_receipt_num = rh.internal_receipt_num
	and
		-- [comment omitted]
		convert(datetime, convert(char(10), appt.appt_date_time, 101))
		>= convert(datetime, convert(char(10), @startDate, 101))
	and
		-- [comment omitted]
		convert(datetime, convert(char(10), appt.appt_date_time, 101))
		<= convert(datetime, convert(char(10), @endDate, 101))
	and
		-- [comment omitted]
		(
			rh.warehouse = @warehouse
		or
			@warehouse = N'<literal:1>'
		or
			@warehouse is null
		)
	group by 
		convert(datetime, convert(char(10), appt.appt_date_time, 101)), 
		appt.dock,
		rh.warehouse;
end -- [comment omitted]


