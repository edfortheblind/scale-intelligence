/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	18633	| VK	| 02/10/06	| Created
*/

CREATE PROCEDURE wm_RPurchaseOrderDetail03
	@PurchaseOrderId nvarchar(25),
	@LineNumber numeric(19,5)
AS
	SELECT *
	  FROM PURCHASE_ORDER_DETAIL
	 WHERE PURCHASE_ORDER_ID = @PurchaseOrderId
	       AND LINE_NUMBER = @LineNumber;


