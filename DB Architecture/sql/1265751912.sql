-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






-- [comment omitted]

CREATE PROCEDURE SCI_PICK_PUT
	@StartTime  datetime,
	@EndTime datetime
AS
BEGIN
SET NOCOUNT ON;
Select th.internal_id as pick_put_id, CASE WHEN th.activity_date_time > N'<literal:1>' THEN N'<literal:2>'   ELSE th.activity_date_time END as activity_date_time, th.company, (wi.converted_qty / case wi.quantity when 0 then 1 else wi.quantity end ) * th.quantity as converted_qty,wi.converted_qty_um,   lmd.device_type, lmd.equipment_type, CASE WHEN lmd.PROCESS_TYPE = N'<literal:3>' AND th.DIRECTION = N'<literal:4>' THEN N'<literal:5>' ELSE (lmd.total_actual_time) END as execution_time, wi.internal_num_type,lmd.labor_type,th.location,loc.location_type,loc.movement_cls,loc.multi_item,th.lot,wi.priority,  th.quantity,th.quantity_um,lmd.shift,loc.template_field1,loc.template_field2,loc.template_field3,loc.template_field4,loc.template_field5,loc.track_containers,th.transaction_type transaction_type_code,  CAST(LTRIM(gcd.description)  AS nvarchar(100))  transaction_type, wi.total_value / case wi.quantity when 0 then 1 else wi.quantity end as unit_value,   wi.total_volume /case wi.quantity when 0 then 1 else wi.quantity end as unit_volume,wi.total_weight /case wi.quantity when 0 then 1 else wi.quantity end as unit_weight,  lmd.total_labor_cost labor_cost,lmd.user_name,wi.volume_um,th.warehouse,wi.weight_um,th.work_group,lmd.work_team,th.work_type,loc.work_zone,   CASE th.direction WHEN N'<literal:6>' Then N'<literal:7>' ELSE N'<literal:8>' END Confirmation_Type, CAST(null as nvarchar(100))  user_dimension01,CAST(null as nvarchar(100))  user_dimension02,  CAST(null as nvarchar(100))  user_dimension03, CAST(null as nvarchar(100))  user_dimension04,CAST(null as nvarchar(100))  user_dimension05,CAST(null as nvarchar(100))  user_dimension06,  CAST(null as nvarchar(100))  user_dimension07,CAST(null as nvarchar(100))  user_dimension08,CAST(null as nvarchar(100))  user_dimension09, CAST(null as nvarchar(100))  user_dimension10,  CAST(null as numeric(28, 5))  user_fact1,CAST(null as numeric(28, 5))  user_fact2, CAST(null as numeric(28, 5))  user_fact3,CAST(null as numeric(28, 5))  user_fact4,  CAST(null as numeric(28, 5))  user_fact5 from transaction_history th with (nolock) join generic_config_detail gcd with (nolock) on th.transaction_type = gcd.identifier    and gcd.record_type = N'<literal:9>' inner join work_instruction_view wi with (nolock) on wi.internal_instruction_num = th.internal_key_id   left outer join location loc with (nolock) on loc.location = th.location and loc.warehouse = th.warehouse   left outer join labor_management_detail lmd with (nolock) on lmd.internal_num = wi.internal_instruction_num   and ((lmd.process_type = N'<literal:10>' and th.TRANSACTION_TYPE = N'<literal:11>')   or (lmd.process_type = N'<literal:12>' and th.direction = N'<literal:13>' and lmd.FROM_LOCATION = th.LOCATION and (th.TRANSACTION_TYPE = N'<literal:14>' OR th.TRANSACTION_TYPE = N'<literal:15>'))    or (lmd.process_type = N'<literal:16>' and th.direction = N'<literal:17>' and lmd.TO_LOCATION = th.LOCATION) and (th.TRANSACTION_TYPE = N'<literal:18>' OR th.TRANSACTION_TYPE = N'<literal:19>'))   and lmd.user_name = th.user_stamp and ((lmd.total_quantity = th.quantity and lmd.quantity_um = th.quantity_um) or (lmd.total_quantity = wi.converted_qty and lmd.quantity_um = wi.converted_qty_um))  and lmd.INTERNAL_DETAIL_NUM IN (Select max(INTERNAL_DETAIL_NUM) from LABOR_MANAGEMENT_DETAIL lmd1 where lmd.INTERNAL_NUM = lmd1.INTERNAL_NUM and lmd1.FROM_LOCATION = lmd.FROM_LOCATION and lmd.date_time_stamp > th.date_time_stamp)   where (( th.transaction_type in (N'<literal:20>' ,N'<literal:21>' ,N'<literal:22>') and th.direction = N'<literal:23>')  or ( th.transaction_type in ( N'<literal:24>' , N'<literal:25>' , N'<literal:26>' ) and th.direction = N'<literal:27>' and th.AFTER_ON_HAND_QTY > 0)) AND th.activity_date_time > @StartTime AND th.activity_date_time <= @EndTime
END
;




