/*
Mod Number	| Programmer	| Date   	    | Modification Description
----------------------------------------------------------------------------------------------------------------
99501	    | SDas		    | 02/13/2013    | Created SCI Stored Procedure SCI_SHIPPING_CONTAINER
108214		| JY			| 10/15/2013	| Modified sc.quantity to correctly sum to quantity of child containers.

*/

--SCI Proc 8 : SCI_SHIPPING_CONTAINER

CREATE PROCEDURE SCI_SHIPPING_CONTAINER
	@StartTime  datetime,
	@EndTime datetime
AS
BEGIN
SET NOCOUNT ON;
select
   sc.internal_container_num,
   sh.internal_shipment_num,
   CASE WHEN sh.actual_delivery_date_time > N'4712-12-31 00:00:00.000' THEN N'4712-12-31 00:00:00.000' ELSE sh.actual_delivery_date_time END as actual_delivery_date_time,
   CASE WHEN sh.actual_ship_date_time > N'4712-12-31 00:00:00.000' THEN N'4712-12-31 00:00:00.000' ELSE sh.actual_ship_date_time END as actual_ship_date_time ,
   sh.carrier,
   sh.carrier_service,
   sh.carrier_type,
   sh.carrier_group,
   sh.route,
   sh.customer,
   CASE WHEN sh.planned_delivery_date_time > N'4712-12-31 00:00:00.000' THEN N'4712-12-31 00:00:00.000' ELSE sh.planned_delivery_date_time END as planned_delivery_date_time,
   CASE WHEN sh.scheduled_ship_date > N'4712-12-31 00:00:00.000' THEN N'4712-12-31 00:00:00.000' ELSE sh.scheduled_ship_date END as scheduled_ship_date,
   sh.warehouse,
   sc.quantity_um,
   sc.weight_um,
   sc.volume_um,
   sc.weight,
   sc.volume,
   sc.value,
   (
      SELECT
         SUM(quantity) 
      FROM
         shipping_container WITH (NOLOCK) 
      WHERE
         tree_unit=sc.internal_container_num
   )  AS quantity,
   CASE WHEN sc.manifest_date_time > N'4712-12-31 00:00:00.000' THEN N'4712-12-31 00:00:00.000' ELSE sc.manifest_date_time END as manifest_date_time,
    sc.total_freight_charge,
    sc.base_freight_charge,
    sc.freight_discount,
    sc.accessorial_charge,
    sh.customer_name,
    sh.ship_to,
    sh.ship_to_name,
    sh.Ship_To_City,
    sh.Ship_To_State,
    sh.Ship_To_Country,
    sh.Ship_To_Postal_Code,
    sh.freight_bill_to,
    sh.freight_bill_to_name,
    sc.container_type,
    sc.container_class,
    sc.parent,
    sc.company,
    sc.nmfc_code,
    sc.hazardous_code,
    CASE WHEN sh.planned_ship_Date > N'4712-12-31 00:00:00.000' THEN N'4712-12-31 00:00:00.000' ELSE sh.planned_ship_Date END as planned_ship_Date,
    CASE WHEN sh.requested_delivery_date > N'4712-12-31 00:00:00.000' THEN N'4712-12-31 00:00:00.000' ELSE sh.requested_delivery_date END as requested_delivery_date,
    CASE WHEN ls.launch_date_time_ended > N'4712-12-31 00:00:00.000' THEN N'4712-12-31 00:00:00.000' ELSE ls.launch_date_time_ended END as wave_end_date_time,
    CAST(null as nvarchar(100) )  user_dimension01,
    CAST(null as nvarchar(100) )  user_dimension02,
    CAST(null as nvarchar(100) )  user_dimension03,
    CAST(null as nvarchar(100) )  user_dimension04,
    CAST(null as nvarchar(100) )  user_dimension05,
    CAST(null as nvarchar(100) )  user_dimension06,
    CAST(null as nvarchar(100) )  user_dimension07,
    CAST(null as nvarchar(100) )  user_dimension08,
    CAST(null as nvarchar(100) )  user_dimension09,
    CAST(null as nvarchar(100) )  user_dimension10,
    CAST(null as numeric(28,5) )  user_fact1,
    CAST(null as numeric(28,5) )  user_fact2,
    CAST(null as numeric(28,5) )  user_fact3,
    CAST(null as numeric(28,5) )  user_fact4,
    CAST(null as numeric(28,5) )  user_fact5
from
   Shipping_Container sc with (nolock)  join Shipment_header sh with (nolock)  on sc.internal_shipment_num = sh.internal_shipment_num left outer join launch_statistics ls with (nolock)  on sc.launch_num = ls.internal_launch_num
where
   sh.trailing_sts >=900
   and sh.trailing_sts < 990
   and sc.container_type <> N'-'
   and sc.parent IS NULL
   AND ((sh.DATE_TIME_STAMP > @StartTime
   AND sh.DATE_TIME_STAMP <= @EndTime)  OR (sc.DATE_TIME_STAMP > @StartTime
   AND sc.DATE_TIME_STAMP <= @EndTime) ) 

END
;



