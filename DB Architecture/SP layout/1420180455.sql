/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	4953	| SP	| 07/20/07	| Created.

	Updates the Shipping Container with the new allocation request number
	Parameters:
		intContainerNum  The internal container number.
		intShipAllocNum  The internal shipment allocation number.
	Returns:
		Null
*/


CREATE PROCEDURE DAS_UpdateContsAllocNum(
	@intContainerNum numeric(9),
	@intShipAllocNum numeric(9))
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE SHIPPING_CONTAINER 
	SET 
		INTERNAL_SHIP_ALLOC_NUM = @intShipAllocNum,
		DATE_TIME_STAMP = GETUTCDATE(),
		PROCESS_STAMP = N'DAS_UpdateContsAllocNum'
	WHERE INTERNAL_CONTAINER_NUM = @intContainerNum;
END



