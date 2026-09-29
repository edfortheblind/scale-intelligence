-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
create procedure RPT_CSO_NegativeLicensePlateValuesCount
as
begin
	select count(location), '<literal:1>' 
	FROM LOCATION_INVENTORY 
	WHERE ON_HAND_QTY < 0 
	AND LOGISTICS_UNIT IS NOT NULL
end