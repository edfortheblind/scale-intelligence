-- DOCUMENTATION ONLY: literals/comments removed; do not execute.




CREATE VIEW DOCK_AREA_POSITION
AS 
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]

SELECT 
      -- [comment omitted]
      stagingPosition.OBJECT_ID,
      stagingPosition.LOCATION,
      stagingPosition.WAREHOUSE,
      stagingPosition.LOCATION_SUBCLASS, 
      stagingPosition.DOCK_LOCATION_TYPE,
      CASE WHEN SUM(locationInventory.IN_TRANSIT_QTY) > 0 
             THEN 2
             ELSE CASE WHEN SUM(locationInventory.ON_HAND_QTY) > 0 
                         THEN 1
	                 ELSE 0
                  END
      END DOCK_AREA_POSITION_STS,
      stagingPosition.PARENT_DOCK_AREA
FROM 
      LOCATION stagingPosition
      INNER JOIN GENERIC_CONFIG_DETAIL stagingSubclass
      ON 
            stagingPosition.LOCATION_SUBCLASS = stagingSubclass.OBJECT_ID
            AND 
            stagingSubclass.RECORD_TYPE = N'<literal:1>'
            AND
            stagingSubclass.IDENTIFIER = N'<literal:2>'
            AND 
            stagingSubclass.ACTIVE = N'<literal:3>' 
      LEFT OUTER JOIN LOCATION_INVENTORY locationInventory
      ON
           stagingPosition.LOCATION = locationInventory.LOCATION
           AND 
           stagingPosition.WAREHOUSE = locationInventory.WAREHOUSE 
WHERE 
      stagingPosition.LOCATION_CLASS = N'<literal:4>'
      AND
      stagingPosition.ACTIVE = N'<literal:5>'
GROUP BY
      stagingPosition.OBJECT_ID,
      stagingPosition.LOCATION,
      stagingPosition.WAREHOUSE,
      stagingPosition.LOCATION_SUBCLASS,
      stagingPosition.DOCK_LOCATION_TYPE,
      stagingPosition.PARENT_DOCK_AREA