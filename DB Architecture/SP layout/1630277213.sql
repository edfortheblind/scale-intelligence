/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	17142	| SA	| 12/19/05	| Created
*/

CREATE PROCEDURE wm_RPurchaseOrderHeader01
	@ObjectId numeric(9)
AS
	SELECT *
	  FROM PURCHASE_ORDER_HEADER
	 WHERE OBJECT_ID = @ObjectId


