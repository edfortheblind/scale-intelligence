-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
create view sci_receipt_detail_view
as
select * from receipt_detail with(nolock)
union all 
select * from ar_receipt_detail with(nolock)