create procedure RPT_CSO_UserLocationsGreaterThan1DayOldCount
as
begin
	select count(location), 'User Locations > 1 Day Old'
	from location_inventory with(nolock) 
	where location like '-%' and 
	date_time_stamp < (getdate()-1)
end