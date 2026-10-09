/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	251336	| MGK	| 05/12/20	| Created
	254391	| MGK	| 07/02/20	| Modified as ALTER script & removed dbo
*/

CREATE PROCEDURE wm_RPurchaseOrderHeader03
	@PurchaseOrderId nvarchar(25),
	@Warehouse nvarchar(25)
AS
	SELECT *
	  FROM PURCHASE_ORDER_HEADER
	 WHERE PURCHASE_ORDER_ID = @PurchaseOrderId
	 AND WAREHOUSE=@Warehouse; 



