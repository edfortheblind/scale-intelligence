-- DOCUMENTATION ONLY: literals/comments removed; do not execute.




CREATE VIEW SHIPPING_CONTAINER_DOCK_POS
AS 

SELECT 
	distinct scdpoh.*, 
    cast(scdpoh.INTERNAL_CONTAINER_NUM as nvarchar(9)) + N'<literal:1>' + cast(scdpoh.DOCK_POSITION as nvarchar(9)) AS COMPOSITE_ID
FROM SHIP_CONT_DOCK_POS_ON_HAND scdpoh 

union 

SELECT 
	distinct scdpit.*,
	cast(scdpit.INTERNAL_CONTAINER_NUM as nvarchar(9)) + N'<literal:2>' + cast(scdpit.DOCK_POSITION as nvarchar(9)) AS COMPOSITE_ID
FROM SHIP_CONT_DOCK_POS_IN_TRANSIT scdpit;