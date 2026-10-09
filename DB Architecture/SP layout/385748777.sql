/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	9083	| RAB	| 11/03/04	| Created.
	19790	| SMS	| 09/28/06	| Modified to retrieve appointment   end date, trailer Id. 
	19555	| AKN	| 11/09/06	| Modified the parameter in RSCMfn_RtrvResource.
	216453	| MJ	| 12/11/17	| Modified to make db compatible with Azure SQL.				   

	Returns a rowset used for ReceivingAppointments.rpts SubReport.
	
	Parameters:
		day		The date - assumed to be truncated to the day.
		dock		The dock
		warehouse	The warehouse

	Returns:
		Rowset where each row represents hour slots and the receipts
		that are scheduled during each slot.
		Example:
			...
			10AM:
			11AM:	REC-A <info>
				REC-B <info>
			12PM:
			01PM:	REC-C <info>
			02PM:
			...
*/


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
									when (count(*) > 1) then trailer_id + N' - ' + dbo.RSCMfn_RtrvResource(N'MULTIPLE',N'Text',N'en-US')
								end as N'TrailerID'  from receipt_header 
							where	trailer_id = rh.trailer_id group by trailer_id)	 as trailer_id
		 from
			appointment_schedule appt,
			receipt_header rh
		 where
			-- join the tables
			appt.internal_receipt_num = rh.internal_receipt_num
		 and
			-- same day
			convert(datetime, convert(char(10), appt.appt_date_time, 101)) = @day
		 and
			-- same dock
			appt.dock = @dock
		 and
			-- same warehouse
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
end -- RPT_RecApptDaySchedule


