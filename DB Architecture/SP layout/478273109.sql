/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	18633	| VK	| 02/10/06	| Created
*/

CREATE PROCEDURE wm_DPurchaseOrderHeader01
	@RowsAffected int OUTPUT,
	@ObjectId numeric(9)
AS
	DELETE FROM PURCHASE_ORDER_DETAIL
	WHERE PURCHASE_ORDER_OBJECT_ID = @ObjectId;
	
	SET @RowsAffected = @@ROWCOUNT

	DELETE FROM PURCHASE_ORDER_HEADER
	WHERE OBJECT_ID = @ObjectId;

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT
	


