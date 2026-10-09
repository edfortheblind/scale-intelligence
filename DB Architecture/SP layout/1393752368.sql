/*
Mod Number	| Programmer	| Date   	    | Modification Description
----------------------------------------------------------------------------------------------------------------
99501	    | SDas		    | 02/13/2013    | Created SCI Stored Procedure SCI_RECEIPT_CONTAINER_CHECKIN_CANCEL
176616	    | MHM		    | 03/29/2016    | Update to exculde transaction history if the warehouse does not exist.

*/

--SCI Proc 5 : SCI_RECEIPT_CONTAINER_CHECKIN_CANCEL

CREATE PROCEDURE SCI_RECEIPT_CONTAINER_CHECKIN_CANCEL
	@StartTime  datetime,
	@EndTime datetime
AS
BEGIN
SET NOCOUNT ON;
select th.internal_id, CASE WHEN activity_date_time > N'4712-12-31 00:00:00.000' THEN N'4712-12-31 00:00:00.000' ELSE activity_date_time END as activity_date_time, 
item, company, user_name, equipment_type, 0-quantity Quantity, quantity_um, th.location, th.warehouse, container_id, th.transaction_type transaction_type_code, 
CAST(LTRIM(gcd.description) AS nvarchar(100)) transaction_type, l.template_field1, l.template_field2, l.template_field3, l.template_field4, l.template_field5, 
l.multi_item, l.movement_cls, l.track_containers,th.internal_container_num  
from transaction_history th with (nolock) 
join warehouse wh with (nolock) on wh.warehouse=th.warehouse
join generic_config_detail gcd with (nolock) on  th.transaction_type = gcd.identifier and gcd.record_type = N'HIST TR TY' 
left outer join location l on th.location = l.location and th.warehouse = l.warehouse  where transaction_type = N'165' and container_id is not null 
AND ACTIVITY_DATE_TIME > @StartTime AND ACTIVITY_DATE_TIME <= @EndTime
END
;

