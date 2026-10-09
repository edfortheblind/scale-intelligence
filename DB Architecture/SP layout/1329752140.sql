/*
Mod Number	| Programmer	| Date   	    | Modification Description
----------------------------------------------------------------------------------------------------------------
99501	    | SDas		    | 02/13/2013    | Created SCI Stored Procedure SCI_PICK_PUT_OUTBOUND

*/

--SCI Proc 13 : SCI_PICK_PUT_OUTBOUND

CREATE PROCEDURE SCI_PICK_PUT_OUTBOUND
	@StartTime  datetime,
	@EndTime datetime
AS
BEGIN
SET NOCOUNT ON;
select     th.internal_id as pick_put_id,      th.company,      sd.country_of_origin,      th.item,      sd.item_category1,      sd.item_category2,      sd.item_category3,      sd.item_category4,      sd.item_category5,      sd.item_category6,      sd.item_category7,      sd.item_category8,      sd.item_category9,      sd.item_category10,      sd.item_class,      sd.item_color,      sd.item_department department,      sd.item_desc description,      sd.item_division division,      sd.item_size,      sd.item_style,      sd.nmfc_code,      sd.packing_class  from     transaction_history th with (nolock)  inner join work_instruction_view wi with (nolock)  on wi.internal_instruction_num = th.internal_key_id     and wi.internal_num_type in ( N'Dock Management',      N'Shipment' )  inner join shipment_detail sd with (nolock)  on sd.internal_shipment_line_num = wi.internal_line_num  where     (( th.transaction_type in ( N'390' ,      N'130' ,      N'120' )      and th.direction = N'From' )  or ( th.transaction_type in ( N'400' ,      N'140' ,      N'120' )      and th.direction = N'To' ) ) AND th.activity_date_time > @StartTime AND th.activity_date_time <= @EndTime
END
;





