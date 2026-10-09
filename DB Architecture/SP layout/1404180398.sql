/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	4953	| SP	| 07/20/07	| Created.

	Updates the Shipment Allocation Request with the new To Location information
	Parameters:
		intShipAllocNum  The internal shipment allocation number.
		toLocation       The To Location
	Returns:
		Null
*/


CREATE PROCEDURE DAS_UpdateAllocsToLoc(
	@intShipAllocNum numeric(9),
	@toLocation nvarchar(25))
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE SHIPMENT_ALLOC_REQUEST 
	SET TO_LOC = @toLocation,
		TO_WORK_ZONE = LOC.WORK_ZONE,
		TO_TEMPL_FIELD1 = LOC.TEMPLATE_FIELD1,
		TO_TEMPL_FIELD2 = LOC.TEMPLATE_FIELD2,
		TO_TEMPL_FIELD3 = LOC.TEMPLATE_FIELD3,
		TO_TEMPL_FIELD4 = LOC.TEMPLATE_FIELD4,
		TO_TEMPL_FIELD5 = LOC.TEMPLATE_FIELD5,
		DATE_TIME_STAMP = GETUTCDATE(),
		PROCESS_STAMP = N'DAS_UpdateAllocsToLoc'
	FROM 
		SHIPMENT_ALLOC_REQUEST SAR JOIN LOCATION LOC
		ON LOC.LOCATION = @toLocation
		AND LOC.WAREHOUSE = SAR.TO_WHS
	WHERE INTERNAL_SHIP_ALLOC_NUM = @intShipAllocNum;
END



