-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
create procedure RPT_CSO_TimesALocationHasGoneNegativeInPast30DaysCount
as
begin
	select count(*), '<literal:1>' from transaction_history where (after_on_hand_qty < 0 or after_in_transit_qty < 0 or after_alloc_qty < 0)
	and date_time_stamp > (getdate() - 30)
end