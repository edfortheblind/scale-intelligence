/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	17142	| SA	| 12/19/05	| Created
*/

CREATE PROCEDURE wm_RPurchaseOrderDetail01
	@ObjectId numeric(9)
AS
	SELECT *
	  FROM PURCHASE_ORDER_DETAIL
	 WHERE OBJECT_ID = @ObjectId


