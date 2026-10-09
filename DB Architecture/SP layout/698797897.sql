/*
	  51518	   | MDL | 09/22/10  | Reset erroneous records to NULL.  
	191074	   | DN	 | 01/23/17	 | Updated parameter types
*/

CREATE PROCEDURE wm_UShipmentHeader02
	@batchId nvarchar(50)
AS
	UPDATE Shipment_header
	SET UPLOAD_INTERFACE_BATCH = NULL,
	Process_Stamp = N'wm_UShipmentHeader02'
	WHERE UPLOAD_INTERFACE_BATCH = @batchId;