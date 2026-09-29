-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
create view sci_shipping_load_view  
as  
select * from shipping_load with(nolock)  
union all   
select * from ar_shipping_load with(nolock)