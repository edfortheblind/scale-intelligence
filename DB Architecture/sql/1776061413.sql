-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
create view sci_receipt_container_view
as 
select * from receipt_container with(nolock)
union all
select * from ar_receipt_container with(nolock)