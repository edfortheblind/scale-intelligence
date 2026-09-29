-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */













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
		PROCESS_STAMP = N'<literal:1>'
	WHERE INTERNAL_CONTAINER_NUM = @intContainerNum;
END



