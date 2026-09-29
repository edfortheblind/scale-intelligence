-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
create view sci_receipt_header_view
as 
select * from receipt_header with(nolock)
union all 
select * from ar_receipt_header with(nolock)