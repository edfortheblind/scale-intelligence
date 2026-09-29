-- DOCUMENTATION ONLY: literals/comments removed; do not execute.




CREATE VIEW DOCK_DOOR
AS 
SELECT DISTINCT
      -- [comment omitted]
      dockdoor.OBJECT_ID,
      dockdoor.LOCATION,
      dockdoor.WAREHOUSE,
      dockdoor.LOCATION_SUBCLASS, 
      shipload.INTERNAL_LOAD_NUM

FROM 
      LOCATION dockdoor
      inner join GENERIC_CONFIG_DETAIL dockDoorSubclass
      on 
            dockdoor.LOCATION_SUBCLASS = dockDoorSubclass.OBJECT_ID
            and 
            dockdoorSubclass.RECORD_TYPE = N'<literal:1>'
            AND
            dockdoorSubclass.IDENTIFIER = N'<literal:2>'
            AND 
            dockdoorSubclass.ACTIVE = N'<literal:3>' 
      left outer join SHIPPING_LOAD shipload
      on 
	    dockdoor.OBJECT_ID = shipload.DOCK_DOOR
        AND
		(shipload.leading_sts < 900 AND shipload.trailing_sts < 900) 
WHERE 
      dockdoor.LOCATION_CLASS = N'<literal:4>'
      and 
      dockdoor.ACTIVE = N'<literal:5>'
      AND 
      dockdoor.DOCK_LOCATION_TYPE = 1