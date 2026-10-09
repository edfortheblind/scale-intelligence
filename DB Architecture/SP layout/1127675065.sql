create procedure RPT_CSO_UserLocationsGreaterThan1DayOldDetails
as
begin
	select location, company, item, on_hand_qty, in_transit_qty, allocated_qty, suspense_qty, date_time_stamp
	from location_inventory with(nolock) 
	where location like '-%' and 
	date_time_stamp < (getdate()-1)
	order by date_time_stamp asc
end