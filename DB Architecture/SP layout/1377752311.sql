/*
Mod Number	| Programmer	| Date   	    | Modification Description
----------------------------------------------------------------------------------------------------------------
99501	    | SDas		    | 02/13/2013    | Created SCI Stored Procedure SCI_Receipt_Container_Checkin

*/

--SCI Proc 1 : SCI_RECEIPT_CONTAINER_CHECKIN

CREATE PROCEDURE SCI_RECEIPT_CONTAINER_CHECKIN
	@StartTime  datetime,
	@EndTime datetime
AS
BEGIN
SET NOCOUNT ON;
SELECT t.internal_id,t.internal_container_num,ISNULL(lm.internal_container_num,0) as labor_internal_container_num,
CASE WHEN t.activity_date_time>N'4712' THEN N'4712-12-31 00:00:00.000' ELSE t.activity_date_time END as activity_date_time,t.transaction_type transaction_type_code,
CAST(LTRIM(gc.description) AS nvarchar(100)) transaction_type,t.item,t.company,lm.user_name, lm.equipment_type,t.quantity,t.quantity_um,t.location,t.warehouse,t.container_id,rc.reason_code,
rc.disposition_code,rc.internal_receipt_line_num,rh.source_id,rh.source_name,rh.source_city,rh.source_state,rh.source_postal_code,rd.item_desc,rd.item_class,rd.item_division,rd.item_department,
(rd.value/case when rd.total_qty > 0 then rd.total_qty else 1 end) value,rd.item_size,rd.item_color,rd.item_style,rd.item_list_price,rd.item_net_price,rd.item_category1,rd.item_category2,rd.item_category3,
rd.item_category4,rd.item_category5,rd.item_category6,rd.item_category7,rd.item_category8,rd.item_category9,rd.item_category10,rh.receipt_type,
CASE WHEN rh.receipt_date>N'4712' THEN N'4712-12-31 00:00:00.000' ELSE rh.receipt_date END as receipt_date,CASE WHEN rh.close_date>N'4712' THEN N'4712-12-31 00:00:00.000' ELSE rh.close_date END as close_date,
CASE WHEN rh.arrived_date_time>N'4712' THEN N'4712-12-31 00:00:00.000' ELSE rh.arrived_date_time END as arrived_date_time,
CASE WHEN rc.expiration_date_time>N'4712' THEN N'4712-12-31 00:00:00.000' ELSE rc.expiration_date_time END as expiration_date_time,rc.converted_loc_qty,rc.converted_qty_um,rc.weight,rc.weight_um,
rh.internal_receipt_num,t.after_sts,CASE WHEN a.appt_date_time>N'4712' THEN N'4712-12-31 00:00:00.000' ELSE a.appt_date_time END as appt_start_time,t.lot,CAST(null as nvarchar(100)) user_dimension01, 
CAST(null as nvarchar(100)) user_dimension02,CAST(null as nvarchar(100)) user_dimension03,CAST(null as nvarchar(100)) user_dimension04, CAST(null as nvarchar(100)) user_dimension05,
CAST(null as nvarchar(100)) user_dimension06,CAST(null as nvarchar(100)) user_dimension07,CAST(null as nvarchar(100)) user_dimension08,CAST(null as nvarchar(100)) user_dimension09,
CAST(null as nvarchar(100)) user_dimension10,CAST(null as numeric(28,5)) user_fact1,CAST(null as numeric(28,5)) user_fact2,CAST(null as numeric(28,5)) user_fact3,CAST(null as numeric(28,5)) user_fact4,
CAST(null as numeric(28,5)) user_fact5,l.template_field1,l.template_field2,l.template_field3,l.template_field4,l.template_field5,l.multi_item,l.track_containers,l.movement_cls,lm.device_type,
lm.labor_type,lm.shift,lm.labor_group,lm.total_actual_time,lm.total_labor_cost,lm.work_team,rc.PARENT 
from transaction_history t with (nolock) join generic_config_detail gc with (nolock) 
	on t.transaction_type = gc.identifier and gc.record_type = N'HIST TR TY' 
join location l with (nolock) 
	on t.location = l.location and t.warehouse = l.warehouse 
join receipt_container_view rc with (nolock) 
	on t.INTERNAL_CONTAINER_NUM = rc.INTERNAL_REC_CONT_NUM and t.warehouse = rc.from_warehouse and t.ITEM = rc.ITEM 
join receipt_detail rd with (nolock) on rc.internal_receipt_line_num = rd.internal_receipt_line_num join receipt_header rh with (nolock) 
	on rc.internal_receipt_num = rh.internal_receipt_num and t.reference_id = rh.receipt_id 
left outer join appointment_schedule a with (nolock) 
	on rh.internal_receipt_num = a.internal_receipt_num 
left outer join labor_management_detail lm with (nolock) 
	on (rc.INTERNAL_REC_CONT_NUM = lm.INTERNAL_CONTAINER_NUM or (rc.parent> 0 AND (select internal_rec_cont_num from receipt_container_view where internal_rec_cont_num = rc.parent) = lm.INTERNAL_CONTAINER_NUM)) and rc.internal_receipt_num = lm.internal_num and lm.INTERNAL_DETAIL_NUM = (select max(INTERNAL_DETAIL_NUM) from LABOR_MANAGEMENT_DETAIL lm2 where lm2.INTERNAL_NUM = lm.INTERNAL_NUM and lm2.INTERNAL_CONTAINER_NUM = lm.INTERNAL_CONTAINER_NUM and lm2.ACTIVITY_SCREEN=N'CHECKIN')
where t.transaction_type=N'20' and l.location_class<>N'Receiving Pre-Check In' 
AND ACTIVITY_DATE_TIME > @StartTime 
AND ACTIVITY_DATE_TIME <= @EndTime
END;
 