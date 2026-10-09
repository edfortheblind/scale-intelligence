/*
Mod Number	| Programmer	| Date   	    | Modification Description
----------------------------------------------------------------------------------------------------------------
99501	    | SDas		    | 02/13/2013    | Created SCI Stored Procedure SCI_PICK_PUT_INBOUND

*/

--SCI Proc 12 : SCI_PICK_PUT_INBOUND

CREATE PROCEDURE SCI_PICK_PUT_INBOUND
	@StartTime  datetime,
	@EndTime datetime
AS
BEGIN
SET NOCOUNT ON;
select     th.internal_id as pick_put_id,      th.company,      i.country_of_origin,      th.item,      rd.item_category1,      rd.item_category2,      rd.item_category3,      rd.item_category4,      rd.item_category5,      rd.item_category6,      rd.item_category7,      rd.item_category8,      rd.item_category9,      rd.item_category10,      rd.item_class,      rd.item_color,      rd.item_department department,      rd.item_desc description,      rd.item_division division,      rd.item_size,      rd.item_style,      i.nmfc_code,      i.packing_class  from     transaction_history th with (nolock)  inner join work_instruction_view wi with (nolock)  on wi.internal_instruction_num = th.internal_key_id     and wi.internal_num_type = N'Receipt' inner join receipt_detail rd with (nolock)  on rd.internal_receipt_line_num = wi.internal_line_num left outer join item i with (nolock)  on wi.item = i.item     and (i.company is null or wi.company = i.company)   where     (( th.transaction_type in ( N'130' ,      N'120' )      and th.direction = N'From' )  or ( th.transaction_type in ( N'140' ,      N'120' )      and th.direction = N'To' ) ) AND th.activity_date_time > @StartTime AND th.activity_date_time <= @EndTime
END
;




