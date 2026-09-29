-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
create procedure RPT_CSO_NegativeLicensePlateValuesDetails
as
begin
	select location, item, on_hand_qty, * FROM LOCATION_INVENTORY WHERE ON_HAND_QTY < 0 AND LOGISTICS_UNIT IS NOT NULL
end