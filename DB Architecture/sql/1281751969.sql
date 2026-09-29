-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






-- [comment omitted]

CREATE PROCEDURE SCI_PICK_PUT_COMMON
	@StartTime  datetime,
	@EndTime datetime
AS
BEGIN
SET NOCOUNT ON;
select     th.internal_id as pick_put_id,      th.company,      i.country_of_origin,      th.item,      i.item_category1,      i.item_category2,      i.item_category3,      i.item_category4,      i.item_category5,      i.item_category6,      i.item_category7,      i.item_category8,      i.item_category9,      i.item_category10,      i.item_class,      i.item_color,      i.department,      i.description,      i.division,      i.item_size,      i.item_style,      i.nmfc_code,      i.packing_class  from     transaction_history th with (nolock)  inner join work_instruction_view wi with (nolock)  on wi.internal_instruction_num = th.internal_key_id     and wi.internal_num_type not in ( N'<literal:1>' ,      N'<literal:2>' ,      N'<literal:3>' ,      N'<literal:4>' ,      N'<literal:5>' )  left outer join item i with (nolock)  on wi.item = i.item     and (i.company is null or wi.company = i.company)   where     (( th.transaction_type in ( N'<literal:6>' ,      N'<literal:7>' )      and th.direction = N'<literal:8>' )  or ( th.transaction_type in ( N'<literal:9>' ,      N'<literal:10>' )      and th.direction = N'<literal:11>' ) )   AND th.activity_date_time > @StartTime AND th.activity_date_time <= @EndTime
END
;




