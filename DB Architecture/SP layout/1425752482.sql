/*
Mod Number	| Programmer	| Date   	    | Modification Description
----------------------------------------------------------------------------------------------------------------
99501	    | SDas		    | 02/13/2013    | Created SCI Stored Procedure SCI_SHIPMENT_HEADER

*/

--SCI Proc 7 : SCI_SHIPMENT_HEADER

CREATE PROCEDURE SCI_SHIPMENT_HEADER
	@StartTime  datetime,
	@EndTime datetime
AS
BEGIN
SET NOCOUNT ON;
SELECT sh.Internal_Shipment_Num,sh.Warehouse,sh.Carrier,sh.Carrier_Service,sh.Carrier_Type,sh.Carrier_Group,  sh.Route,CASE WHEN sh.Actual_Ship_Date_Time > N'4712-12-31 00:00:00.000' THEN N'4712-12-31 00:00:00.000' ELSE sh.Actual_Ship_Date_Time END as Actual_Ship_Date_Time, CASE WHEN sh.Actual_Delivery_Date_Time > N'4712-12-31 00:00:00.000' THEN N'4712-12-31 00:00:00.000' ELSE sh.Actual_Delivery_Date_Time END as Actual_Delivery_Date_Time, CASE WHEN sh.Planned_Delivery_Date_Time > N'4712-12-31 00:00:00.000' THEN N'4712-12-31 00:00:00.000' ELSE sh.Planned_Delivery_Date_Time END as Planned_Delivery_Date_Time, CASE WHEN sh.Planned_Ship_Date > N'4712-12-31 00:00:00.000' THEN N'4712-12-31 00:00:00.000' ELSE sh.Planned_Ship_Date END as Planned_Ship_Date, CASE WHEN sh.Requested_Delivery_Date > N'4712-12-31 00:00:00.000' THEN N'4712-12-31 00:00:00.000' ELSE sh.Requested_Delivery_Date END as Requested_Delivery_Date, CASE WHEN sh.Scheduled_Ship_Date > N'4712-12-31 00:00:00.000' THEN N'4712-12-31 00:00:00.000' ELSE sh.Scheduled_Ship_Date END as Scheduled_Ship_Date,sh.Customer,sh.Customer_Name, sh.Ship_To,sh.Ship_To_Name, sh.Ship_To_City, sh.Ship_To_State, sh.Ship_To_Country,sh.Ship_To_Postal_Code,sh.Freight_Bill_To,sh.Freight_Bill_To_Name  , COMPANY,  CASE WHEN ls.launch_date_time_ended > N'4712-12-31 00:00:00.000' THEN N'4712-12-31 00:00:00.000' ELSE ls.launch_date_time_ended END as wave_end_date_time, CAST(null as nvarchar(100)) user_dimension01, CAST(null as nvarchar(100)) user_dimension02, CAST(null as nvarchar(100)) user_dimension03, CAST(null as nvarchar(100)) user_dimension04, CAST(null as nvarchar(100)) user_dimension05, CAST(null as nvarchar(100)) user_dimension06,  CAST(null as nvarchar(100)) user_dimension07, CAST(null as nvarchar(100)) user_dimension08, CAST(null as nvarchar(100)) user_dimension09, CAST(null as nvarchar(100)) user_dimension10, CAST(null as numeric(28,5)) user_fact1, CAST(null as numeric(28,5)) user_fact2, CAST(null as numeric(28,5)) user_fact3, CAST(null as numeric(28,5)) user_fact4, CAST(null as numeric(28,5)) user_fact5 FROM Shipment_Header sh with (nolock)  LEFT OUTER JOIN LAUNCH_STATISTICS ls with (nolock) on sh.launch_num = ls.internal_launch_num  WHERE sh.trailing_sts >=900 and sh.trailing_sts < 990   AND (sh.DATE_TIME_STAMP > @StartTime AND sh.DATE_TIME_STAMP <= @EndTime)
END
;


