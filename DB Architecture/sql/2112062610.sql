-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE VIEW Shipping_Container_VAS_Activity_Grid_View
AS

SELECT distinct 
SVAS.VAS_ACTIVITY_ID ,
SVAS.INSTRUCTIONS,
SVAS.INTERNAL_CONTAINER_NUM,
SVAS.OBJECT_ID,
SVAS.COMPLETED,
SVAS.USER_DEF1,
SVAS.USER_DEF2,
SVAS.USER_DEF3,
SVAS.USER_DEF4,
SVAS.USER_DEF5,
SVAS.USER_DEF6,
SVAS.USER_DEF7,
SVAS.USER_DEF8,
case VAS.APPLICATION_LEVEL when 0 then N'<literal:1>' ELSE N'<literal:2>' END as Application_Level,
case COMPLETED when N'<literal:3>' then 0 else 1 end as Confirmed
FROM  VAS_ACTIVITY VAS 
INNER JOIN SHIPPING_CONT_VAS_ACTIVITY SVAS  ON SVAS.VAS_ACTIVITY_ID = VAS.OBJECT_ID ;