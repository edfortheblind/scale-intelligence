/*
Mod Number	| Programmer	| Date   	    | Modification Description
----------------------------------------------------------------------------------------------------------------
99501	    | SDas		    | 02/13/2013    | Created SCI Stored Procedure SCI_LOCATION_CAPACITY

*/

--SCI Proc 3 : SCI_LOCATION_CAPACITY

CREATE PROCEDURE SCI_LOCATION_CAPACITY
AS
BEGIN
SET NOCOUNT ON;
select l.location, l.warehouse, l.locating_zone, l.work_zone, l.allocation_zone, l.multi_item, l.track_containers, l.movement_cls, l.location_class, l.location_type, l.template_field1, l.template_field2, l.template_field3, l.template_field4, l.template_field5, CASE WHEN l.last_cycle_count_date > N'4712-12-31 00:00:00.000' THEN N'4712-12-31 00:00:00.000' ELSE l.last_cycle_count_date END as last_cycle_count_date, ISNULL((CASE WHEN lt.length > N'99999999.99' THEN N'99999999.99' ELSE lt.length END ), 0) * ISNULL((CASE WHEN lt.width > N'99999999.99' THEN N'99999999.99' ELSE lt.width END), 0) * ISNULL((CASE WHEN lt.height > N'9999999.99' THEN N'9999999.99' ELSE lt.height END), 0) max_volume, ISNULL((CASE WHEN lt.maximum_weight > N'9999999.99' THEN N'9999999.99' ELSE lt.maximum_weight END), 0) maximum_weight, lt.weight_um, GETUTCDATE() SNAPSHOT_DATE, CAST(null as nvarchar(100)) user_dimension01, CAST(null as nvarchar(100)) user_dimension02, CAST(null as nvarchar(100)) user_dimension03, CAST(null as nvarchar(100)) user_dimension04, CAST(null as nvarchar(100)) user_dimension05, CAST(null as nvarchar(100)) user_dimension06,  CAST(null as nvarchar(100)) user_dimension07, CAST(null as nvarchar(100)) user_dimension08, CAST(null as nvarchar(100)) user_dimension09, CAST(null as nvarchar(100)) user_dimension10, CAST(null as numeric(28,5)) user_fact1, CAST(null as numeric(28,5)) user_fact2, CAST(null as numeric(28,5)) user_fact3, CAST(null as numeric(28,5)) user_fact4, CAST(null as numeric(28,5)) user_fact5, l.location_sts from location l  left outer join location_type lt on l.location_type = lt.location_type  where l.location_class = N'Inventory'
END
;

