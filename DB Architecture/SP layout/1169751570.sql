/*
Mod Number	| Programmer	| Date   	    | Modification Description
----------------------------------------------------------------------------------------------------------------
99501	    | SDas		    | 02/13/2013    | Created SCI Stored Procedure SCI_DATE

*/

--SCI Proc 9 : SCI_DATE

CREATE PROCEDURE SCI_DATE
AS
BEGIN
SET NOCOUNT ON;
Select MIN(D.MinDate) mindate, MAX(D.MaxDate) maxdate from (SELECT (CASE WHEN MIN(Convert(char(4), tempdate , 102)) < N'1900' THEN N'1900' ELSE tempdate END) MinDate, (CASE WHEN MAX(Convert(char(4), tempdate , 102)) > N'4712' THEN N'4712' ELSE tempdate END) MaxDate from (SELECT EXPIRATION_DATE_TIME as tempdate from RECEIPT_CONTAINER Group By EXPIRATION_DATE_TIME UNION SELECT START_DATE_TIME as tempdate from Labor_management_detail Group By START_DATE_TIME UNION SELECT end_date_time as tempdate from Labor_management_detail Group By end_date_time UNION SELECT actual_delivery_date_time as tempdate from shipment_header Group By actual_delivery_date_time UNION SELECT actual_ship_date_time as tempdate from shipment_header Group By actual_ship_date_time UNION SELECT planned_delivery_date_time as tempdate from shipment_header Group By planned_delivery_date_time UNION SELECT scheduled_ship_date as tempdate from shipment_header Group By scheduled_ship_date UNION SELECT order_date as tempdate from shipment_detail Group By order_date UNION SELECT planned_ship_date as tempdate from shipment_detail Group By planned_ship_date UNION SELECT requested_delivery_date as tempdate from shipment_detail Group By requested_delivery_date UNION SELECT manifest_date_time as tempdate from shipping_container Group By manifest_date_time UNION SELECT launch_date_time_ended as tempdate from launch_statistics Group By launch_date_time_ended UNION SELECT last_cycle_count_date as tempdate from location Group By last_cycle_count_date UNION SELECT expiration_date as tempdate from location_inventory  Group By expiration_date UNION SELECT activity_date_time as tempdate from transaction_history   Group By activity_date_time UNION SELECT receipt_date as tempdate from receipt_header Group By receipt_date UNION SELECT close_date as tempdate from receipt_header Group By close_date UNION SELECT arrived_date_time as tempdate from receipt_header Group By arrived_date_time UNION SELECT appt_date_time as tempdate from appointment_schedule  Group By appt_date_time UNION SELECT CAST(floor(cast(GETUTCDATE() as float)) as DateTime) as tempdate) as temptable group by tempdate) as D
END
;




