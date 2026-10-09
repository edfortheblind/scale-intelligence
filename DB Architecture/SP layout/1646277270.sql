/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	18633	| VK	| 02/10/06	| Created
*/

CREATE PROCEDURE wm_RPurchaseOrderHeader02
	@PurchaseOrderId nvarchar(25)
AS
	SELECT *
	  FROM PURCHASE_ORDER_HEADER
	 WHERE PURCHASE_ORDER_ID = @PurchaseOrderId; 



