/*
	Task | By		| Date		| Modification Description  
	--------------------------------------------------------------------  
	10606 | AU		| 05/17/22	| Created.  
	10611 | SSM	    | 05/25/22	| Added condition to fetch Shipment Id in DetailPane.
	11501 | SSM		| 06/21/22  | Added Location cleared check.
*/

CREATE PROCEDURE PWL_InsightDetailPaneData(@location nvarchar(25), @culture nvarchar(10))  
AS 
BEGIN

SELECT N'SCALAR' AS SCALAR,
		l.LOCATION as Location, 
		l.LOCATION_STS as LocationStatus,
		sh.SHIPMENT_ID as ShipmentId  
		FROM LOCATION l
		LEFT OUTER JOIN TOTE_DETAIL td ON l.LOCATION = td.PUT_WALL_LOCATION AND l.warehouse = td.WAREHOUSE AND COALESCE(td.LOCATION_CLEARED,N'N')<>N'Y'
		LEFT OUTER JOIN SHIPMENT_HEADER sh ON sh.INTERNAL_SHIPMENT_NUM = td.INTERNAL_SHIPMENT_NUM
		WHERE l.LOCATION = @location;

END
