create procedure RPT_CSO_TimesALocationHasGoneNegativeInPast30DaysDetails
as
begin
	select count(*) as TransTypeCount, transaction_type from transaction_history where (after_on_hand_qty < 0 or after_in_transit_qty < 0 or after_alloc_qty < 0)
	and date_time_stamp > (getdate() - 30) group by transaction_type order by TransTypeCount desc
end