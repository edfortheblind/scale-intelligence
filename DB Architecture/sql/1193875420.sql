-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */










CREATE VIEW METADATA_INSIGHT_TOTE_VIEW
AS
SELECT
th.OBJECT_ID,
th_totals.TOTAL_LINES,
th.WAREHOUSE,
th.TOTE_ID,
th.CONDITION AS TOTE_CONDITION,
th.USER_ASSIGNED,
th.USER_DEF1, 
th.USER_DEF2,
th.USER_DEF3,
th.USER_DEF4,
th.USER_DEF5,
th.USER_DEF6,
th.USER_DEF7,
th.USER_DEF8, 
th.USER_STAMP,
th.PROCESS_STAMP,
th.DATE_TIME_STAMP,
th.MARK_FOR_SORTING,
td.INTERNAL_SHIPMENT_NUM,
td.INTERNAL_CONTAINER_NUM,
td.PUT_WALL_LOCATION,
td.SORT_COMPLETED,
sh.SHIPMENT_ID,
sc.CONTAINER_ID,
sc.PARENT_CONTAINER_ID,
l.LOCATION_STS,
td.PARENT_CONTAINER_NUM,
sc.PARENT,
case when th.CONDITION = N'<literal:1>' then N'<literal:2>' else N'<literal:3>' END AS SORTED,
case when th.CONDITION = N'<literal:4>' then N'<literal:5>' else N'<literal:6>' END AS NOT_ELIGIBLE,
case when sc.PARENT_CONTAINER_ID IS NULL then N'<literal:7>' ELSE N'<literal:8>'END AS SORT_LEVEL

from TOTE_HEADER th
left outer join (select TOTE_HEADER_ID , COUNT(OBJECT_ID) as TOTAL_LINES from TOTE_DETAIL GROUP BY TOTE_HEADER_ID) th_totals
ON th.OBJECT_ID = th_totals.TOTE_HEADER_ID

left outer join	TOTE_DETAIL td on td.TOTE_HEADER_ID = th.OBJECT_ID
left outer join SHIPMENT_HEADER sh on sh.INTERNAL_SHIPMENT_NUM = td.INTERNAL_SHIPMENT_NUM
left outer join SHIPPING_CONTAINER sc on sc.INTERNAL_CONTAINER_NUM= td.INTERNAL_CONTAINER_NUM
left outer join LOCATION l on l.LOCATION = td.PUT_WALL_LOCATION AND l.warehouse=td.WAREHOUSE
