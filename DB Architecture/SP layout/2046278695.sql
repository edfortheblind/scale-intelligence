/*
	Task 	| Programmer	| Date   	| Description
	--------|---------------|---------------------------------------
	14660	| LJM			| 05/24/04	| created
	191074	| DN			| 01/23/17	| Updated parameter types
*/


CREATE PROCEDURE wm_RShipmentAllocRequest02
	@intLineNum numeric(9)
AS
	SELECT * FROM SHIPMENT_ALLOC_REQUEST
	WHERE INTERNAL_SHIPMENT_LINE_NUM = @intLineNum;