-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
create view sci_transaction_history_view
as
select * from transaction_history with(nolock)
union all
select * from ar_transaction_history with(nolock)