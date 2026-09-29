-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
create procedure RPT_CSO_UserLocationsGreaterThan1DayOldCount
as
begin
	select count(location), '<literal:1>'
	from location_inventory with(nolock) 
	where location like '<literal:2>' and 
	date_time_stamp < (getdate()-1)
end