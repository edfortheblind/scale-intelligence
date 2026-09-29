-- DOCUMENTATION ONLY: literals/comments removed; do not execute.




CREATE VIEW DOCK_AREA_POSITIONS_LOAD
AS 

-- [comment omitted]
-- [comment omitted]

SELECT 
      -- [comment omitted]
      stagingPosition.OBJECT_ID,
      stagingPosition.LOCATION,
      stagingPosition.WAREHOUSE,     
	  sh.SHIPPING_LOAD_NUM AS INTERNAL_LOAD_NUM
FROM 
      LOCATION stagingPosition
      INNER JOIN GENERIC_CONFIG_DETAIL stagingSubclass
      ON 
            stagingPosition.LOCATION_SUBCLASS = stagingSubclass.OBJECT_ID
            AND stagingSubclass.RECORD_TYPE = N'<literal:1>'
            AND stagingSubclass.IDENTIFIER = N'<literal:2>'
            AND stagingSubclass.ACTIVE = N'<literal:3>',
      SHIPPING_CONTAINER sc, 
      SHIPMENT_HEADER sh, 
      SHIPPING_LOAD sl
WHERE 
	  stagingPosition.LOCATION_CLASS = N'<literal:4>'
      AND stagingPosition.ACTIVE = N'<literal:5>'
	  AND sc.LOCATION = stagingPosition.LOCATION
	  AND sc.INTERNAL_SHIPMENT_NUM = sh.INTERNAL_SHIPMENT_NUM
	  AND sl.INTERNAL_LOAD_NUM = sh.SHIPPING_LOAD_NUM
GROUP BY
      stagingPosition.OBJECT_ID,
      stagingPosition.LOCATION,
      stagingPosition.WAREHOUSE,
	  sh.SHIPPING_LOAD_NUM;