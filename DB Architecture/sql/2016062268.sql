-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */








CREATE VIEW Shipment_Header_VAS_Activity_Grid_View
AS

SELECT distinct 
SVAS.OBJECT_ID AS Object_Id, 
SVAS.VAS_ACTIVITY_ID ,
SVAS.INSTRUCTIONS,
SVAS.INTERNAL_SHIPMENT_NUM,
SVAS.USER_DEF1 ,
SVAS.USER_DEF2,
SVAS.USER_DEF3 ,
SVAS.USER_DEF4 ,
SVAS.USER_DEF5 ,
SVAS.USER_DEF6,
SVAS.USER_DEF7 ,
SVAS.USER_DEF8 ,
case VAS.APPLICATION_LEVEL when 0 then N'<literal:1>' ELSE N'<literal:2>' END as Application_Level
,case (select COUNT(1) from SHIPPING_CONT_VAS_ACTIVITY
	where internal_container_num in (select internal_container_num from SHIPPING_CONTAINER
	where internal_shipment_num = SVAS.Internal_shipment_num)
	and vas_activity_id = SVAS.VAS_ACTIVITY_ID
	and INSTRUCTIONS = SVAS.INSTRUCTIONS) 
	when 0 then 0 
	else (select min(case completed when N'<literal:3>' then 0 else 1 end) from SHIPPING_CONT_VAS_ACTIVITY
	where internal_container_num in (select internal_container_num from SHIPPING_CONTAINER
	where internal_shipment_num = SVAS.Internal_shipment_num
	and vas_activity_id = SVAS.VAS_ACTIVITY_ID
	and INSTRUCTIONS = SVAS.INSTRUCTIONS) ) 
	end as Confirmed	
FROM  VAS_ACTIVITY VAS 
INNER JOIN SHIPMENT_HEADER_VAS_Activity SVAS  ON SVAS.VAS_ACTIVITY_ID = VAS.OBJECT_ID ;