/*
	Task 	| Programmer	| Date   	| Description
	--------|---------------|---------------------------------------
	14660	| LJM		| 2004.05.20	| created
*/


CREATE PROCEDURE wm_RShipmentHeader06
	@WaveNum numeric(9)
AS
	SELECT *
	FROM SHIPMENT_HEADER
	WHERE LAUNCH_NUM = @WaveNum;