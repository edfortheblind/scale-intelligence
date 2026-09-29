-- DOCUMENTATION ONLY: literals/comments removed; do not execute.




CREATE VIEW SHIPMENT_HEADER_DOCK_POS
AS
SELECT distinct *
FROM SHIP_HEADER_DOCK_POS_ON_HAND 

union 

SELECT distinct *
FROM SHIP_HEADER_DOCK_POS_IN_TRANS;