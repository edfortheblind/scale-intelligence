/*
Mod Number	| Programmer	| Date   	    | Modification Description
----------------------------------------------------------------------------------------------------------------
99501	    | SDas		    | 02/13/2013    | Created SCI Stored Procedure SCI_PICK_PUT_COMMON

*/

--SCI Proc 11 : SCI_PICK_PUT_COMMON

CREATE PROCEDURE SCI_PICK_PUT_COMMON
	@StartTime  datetime,
	@EndTime datetime
AS
BEGIN
SET NOCOUNT ON;
select     th.internal_id as pick_put_id,      th.company,      i.country_of_origin,      th.item,      i.item_category1,      i.item_category2,      i.item_category3,      i.item_category4,      i.item_category5,      i.item_category6,      i.item_category7,      i.item_category8,      i.item_category9,      i.item_category10,      i.item_class,      i.item_color,      i.department,      i.description,      i.division,      i.item_size,      i.item_style,      i.nmfc_code,      i.packing_class  from     transaction_history th with (nolock)  inner join work_instruction_view wi with (nolock)  on wi.internal_instruction_num = th.internal_key_id     and wi.internal_num_type not in ( N'Dock Management' ,      N'Receipt' ,      N'Shipment' ,      N'Work Order' ,      N'Work Order Putaway' )  left outer join item i with (nolock)  on wi.item = i.item     and (i.company is null or wi.company = i.company)   where     (( th.transaction_type in ( N'130' ,      N'120' )      and th.direction = N'From' )  or ( th.transaction_type in ( N'140' ,      N'120' )      and th.direction = N'To' ) )   AND th.activity_date_time > @StartTime AND th.activity_date_time <= @EndTime
END
;




