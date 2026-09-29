-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







-- [comment omitted]

CREATE PROCEDURE SCI_RECEIPT_CONTAINER_CHECKIN_CANCEL
	@StartTime  datetime,
	@EndTime datetime
AS
BEGIN
SET NOCOUNT ON;
select th.internal_id, CASE WHEN activity_date_time > N'<literal:1>' THEN N'<literal:2>' ELSE activity_date_time END as activity_date_time, 
item, company, user_name, equipment_type, 0-quantity Quantity, quantity_um, th.location, th.warehouse, container_id, th.transaction_type transaction_type_code, 
CAST(LTRIM(gcd.description) AS nvarchar(100)) transaction_type, l.template_field1, l.template_field2, l.template_field3, l.template_field4, l.template_field5, 
l.multi_item, l.movement_cls, l.track_containers,th.internal_container_num  
from transaction_history th with (nolock) 
join warehouse wh with (nolock) on wh.warehouse=th.warehouse
join generic_config_detail gcd with (nolock) on  th.transaction_type = gcd.identifier and gcd.record_type = N'<literal:3>' 
left outer join location l on th.location = l.location and th.warehouse = l.warehouse  where transaction_type = N'<literal:4>' and container_id is not null 
AND ACTIVITY_DATE_TIME > @StartTime AND ACTIVITY_DATE_TIME <= @EndTime
END
;

