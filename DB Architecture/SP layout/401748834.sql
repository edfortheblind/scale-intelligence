/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	9083	| RAB	| 11/03/04	| Created.

	Returns a rowset used for the header of ReceivingAppointments.rpt.
	
	Parameters:
		startDate	The first date in the range to view.
		endDate		The last date in the range to view.
		warehouse	The warehouse or null for all warehouses.

	Returns:
		Rowset with a row for each day and summary information for
		the receipts scheduled for that day.
*/


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
		-- join the tables
		appt.internal_receipt_num = rh.internal_receipt_num
	and
		-- on start date or later
		convert(datetime, convert(char(10), appt.appt_date_time, 101))
		>= convert(datetime, convert(char(10), @startDate, 101))
	and
		-- on end date or before
		convert(datetime, convert(char(10), appt.appt_date_time, 101))
		<= convert(datetime, convert(char(10), @endDate, 101))
	and
		-- same warhouse (or if blank, accept every record).
		(
			rh.warehouse = @warehouse
		or
			@warehouse = N''
		or
			@warehouse is null
		)
	group by 
		convert(datetime, convert(char(10), appt.appt_date_time, 101)), 
		appt.dock,
		rh.warehouse;
end -- RPT_RecApptHeaderInfo


