-- DOCUMENTATION ONLY: literals/comments removed; do not execute.




CREATE VIEW DOCK_AREA_PERCENTAGE
AS 
SELECT 
      -- [comment omitted]
      stagingArea.OBJECT_ID,
      stagingArea.LOCATION,
      stagingArea.WAREHOUSE,
      stagingArea.LOCATION_SUBCLASS, 
      CASE WHEN stagingArea.STAGING_ROW_COUNT IS NULL THEN 0 ELSE stagingArea.STAGING_ROW_COUNT END STAGING_ROW_COUNT,
      -- [comment omitted]
      COUNT(stagingPosition.OBJECT_ID) POSITION_COUNT,      
      -- [comment omitted]
      SUM(CASE WHEN stagingPosition.LOCATION_STS = N'<literal:1>' THEN 1 ELSE 0 END) EMPTY_POSITIONS,
      -- [comment omitted]
      CASE WHEN SUM(CASE WHEN stagingArea.LOCATION_STS = N'<literal:2>' THEN 1 ELSE 0 END) > 0 THEN N'<literal:3>' ELSE N'<literal:4>' END IS_AREA_EMPTY
FROM 
      LOCATION stagingArea
      INNER JOIN GENERIC_CONFIG_DETAIL stagingSubclass
      ON 
            stagingArea.LOCATION_SUBCLASS = stagingSubclass.OBJECT_ID
            AND 
            stagingSubclass.RECORD_TYPE = N'<literal:5>'
            AND
            stagingSubclass.IDENTIFIER = N'<literal:6>'
            AND 
            stagingSubclass.ACTIVE = N'<literal:7>' 
      LEFT OUTER JOIN LOCATION stagingPosition
      ON
            stagingPosition.PARENT_DOCK_AREA = stagingArea.OBJECT_ID
            AND 
            stagingPosition.ACTIVE = N'<literal:8>' 
WHERE 
      stagingArea.LOCATION_CLASS = N'<literal:9>'
      AND 
      stagingArea.ACTIVE = N'<literal:10>'
      AND 
      stagingArea.DOCK_LOCATION_TYPE = 1
GROUP BY
      stagingArea.OBJECT_ID,
      stagingArea.LOCATION,
      stagingArea.WAREHOUSE,
      stagingArea.LOCATION_SUBCLASS,
	  stagingArea.STAGING_ROW_COUNT