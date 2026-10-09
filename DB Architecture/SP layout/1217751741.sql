/*
Mod Number	| Programmer	| Date   	    | Modification Description
----------------------------------------------------------------------------------------------------------------
99501	    | SDas		    | 02/13/2013    | Created SCI Stored Procedure SCI_LABOR_MANAGEMENT_DETAIL
112288		| JY			| 08/06/2013	| Added a null chaeck condition for end date time.
*/

--SCI Proc 2 : SCI_LABOR_MANAGEMENT_DETAIL

CREATE PROCEDURE SCI_LABOR_MANAGEMENT_DETAIL
	@StartTime  datetime,
	@EndTime datetime
AS
BEGIN
SET NOCOUNT ON;
select
    internal_detail_num, activity_type, lmd.warehouse,work_group, work_team, lmd.user_name, lmd.company,equipment_type,
    CASE WHEN start_date_time > N'4712-12-31 00:00:00.000' THEN N'4712-12-31 00:00:00.000' ELSE start_date_time END as start_date_time,
    CASE WHEN end_date_time > N'4712-12-31 00:00:00.000' THEN N'4712-12-31 00:00:00.000' ELSE end_date_time END as end_date_time,
    total_actual_time, total_quantity, quantity_um, total_labor_cost,  total_weight, weight_um, total_volume, volume_um,
    total_value, labor_type, process_type, manual, labor_group, actual_rate, goal_rate, goal_quantity, percent_of_goal,
    device_type, from_location, to_location, lmd.item, shift, CAST(null as nvarchar(100) )  user_dimension01,
    CAST(null as nvarchar(100) )  user_dimension02, CAST(null as nvarchar(100) )  user_dimension03,
    CAST(null as nvarchar(100) )  user_dimension04, CAST(null as nvarchar(100) )  user_dimension05,
    CAST(null as nvarchar(100) )  user_dimension06, CAST(null as nvarchar(100) )  user_dimension07,
    CAST(null as nvarchar(100) )  user_dimension08, CAST(null as nvarchar(100) )  user_dimension09,
	CAST(null as nvarchar(100) )  user_dimension10, CAST(null as numeric(28,5) )  user_fact1,
    CAST(null as numeric(28,5) )  user_fact2, CAST(null as numeric(28,5) )  user_fact3,
    CAST(null as numeric(28,5) )  user_fact4, CAST(null as numeric(28, 5) )  user_fact5,
    i.item_class, i.item_category1, i.item_category2, i.item_category3, i.item_category4,
    i.item_category5, i.item_category6, i.item_category7, i.item_category8, i.item_category9,
    i.item_category10, i.department, i.division, i.item_size, i.nmfc_code, i.country_of_origin,
    i.packing_class, i.description, i.item_color, i.item_style, f.template_field1 from_template_field1,
    f.template_field2 from_template_field2, f.template_field3 from_template_field3,
    f.template_field4 from_template_field4, f.template_field5 from_template_field5,
    f.multi_item f_multi_item, f.track_containers f_track_containers, f.movement_cls f_movement_class,
    t.template_field1 to_template_field1, t.template_field2 to_template_field2,
    t.template_field3 to_template_field3, t.template_field4 to_template_field4,
    t.template_field5 to_template_field5, t.multi_item t_multi_item,
    t.track_containers t_track_containers, t.movement_cls t_movement_class,
    u.USER_ATTRIBUTE1, u.USER_ATTRIBUTE2, u.USER_ATTRIBUTE3, u.USER_ATTRIBUTE4,
    u.USER_ATTRIBUTE5, u.USER_ATTRIBUTE6, u.USER_ATTRIBUTE7, u.USER_ATTRIBUTE8,
    u.USER_ATTRIBUTE9, u.USER_ATTRIBUTE10
from
   labor_management_detail lmd with (nolock)  
   left outer join item i with (nolock)  on lmd.item = i.item  and ISNULL(lmd.company,N'!')  = ISNULL(i.company,N'!')  
   left outer join location f with (nolock)  on lmd.from_location = f.location and lmd.warehouse = f.warehouse 
   left outer join location t with (nolock)  on lmd.to_location = t.location and lmd.warehouse = t.warehouse 
   left outer join user_profile u with (nolock)  on lmd.user_name = u.user_name
where
   activity_type not in (N'SIGNON', N'SIGNOFF', N'SCREENENTRY', N'SCREENEXIT') 
   AND lmd.DATE_TIME_STAMP > @StartTime
   AND lmd.DATE_TIME_STAMP <= @EndTime
   and lmd.end_date_time is not null

END
;
