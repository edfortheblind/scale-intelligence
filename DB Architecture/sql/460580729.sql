-- DOCUMENTATION ONLY: literals/comments removed; do not execute.



CREATE VIEW SHIPPING_CONTAINER_DOCK_AREA
AS 

SELECT distinct *
FROM SHIP_CONT_DOCK_AREA_ON_HAND 

union 

SELECT distinct *
FROM SHIP_CONT_DOCK_AREA_IN_TRANSIT;