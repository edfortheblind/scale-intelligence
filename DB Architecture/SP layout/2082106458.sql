/*
	Task 	| Programmer	| Date   	| Description
	--------|---------------|---------------------------------------
	14660	| LJM		| 2004.05.20	| created
*/


CREATE PROCEDURE wm_RShipmentHeader05
	@TrailingSts numeric(9)
AS
	SELECT *
	FROM SHIPMENT_HEADER
	WHERE UPLOAD_INTERFACE_BATCH IS NULL
	AND TRAILING_STS >= @TrailingSts
	AND TRAILING_STS < 997;