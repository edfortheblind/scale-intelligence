-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */




CREATE PROCEDURE wm_UShipmentHeader02
	@batchId nvarchar(50)
AS
	UPDATE Shipment_header
	SET UPLOAD_INTERFACE_BATCH = NULL,
	Process_Stamp = N'<literal:1>'
	WHERE UPLOAD_INTERFACE_BATCH = @batchId;