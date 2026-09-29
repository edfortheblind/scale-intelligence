-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE PROCEDURE PWL_InsightDetailPaneData(@location nvarchar(25), @culture nvarchar(10))  
AS 
BEGIN

SELECT N'<literal:1>' AS SCALAR,
		l.LOCATION as Location, 
		l.LOCATION_STS as LocationStatus,
		sh.SHIPMENT_ID as ShipmentId  
		FROM LOCATION l
		LEFT OUTER JOIN TOTE_DETAIL td ON l.LOCATION = td.PUT_WALL_LOCATION AND l.warehouse = td.WAREHOUSE AND COALESCE(td.LOCATION_CLEARED,N'<literal:2>')<>N'<literal:3>'
		LEFT OUTER JOIN SHIPMENT_HEADER sh ON sh.INTERNAL_SHIPMENT_NUM = td.INTERNAL_SHIPMENT_NUM
		WHERE l.LOCATION = @location;

END
