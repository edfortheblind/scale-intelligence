/*
	Task 	| Programmer	| Date   	| Description
	--------|---------------|---------------------------------------
	14660	| LJM			| 05/20/04	| created
	191074	| DN			| 01/23/17	| Updated parameter types
*/


CREATE PROCEDURE wm_RUShipmentHeader02
	@WaveNum numeric(9),
	@BatchId nvarchar(50)
AS
	UPDATE SHIPMENT_HEADER
	SET UPLOAD_INTERFACE_BATCH = @BatchId
	WHERE LAUNCH_NUM = @WaveNum;

	SELECT *
	FROM SHIPMENT_HEADER
	WHERE UPLOAD_INTERFACE_BATCH = @BatchId;


