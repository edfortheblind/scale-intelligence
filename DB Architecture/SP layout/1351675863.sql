create procedure RPT_CSO_NegativeLicensePlateValuesCount
as
begin
	select count(location), 'Negative License Plate Records' 
	FROM LOCATION_INVENTORY 
	WHERE ON_HAND_QTY < 0 
	AND LOGISTICS_UNIT IS NOT NULL
end