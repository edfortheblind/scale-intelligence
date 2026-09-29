-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







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


