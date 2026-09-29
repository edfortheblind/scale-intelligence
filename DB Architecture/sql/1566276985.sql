-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RPurchaseOrderDetail01
	@ObjectId numeric(9)
AS
	SELECT *
	  FROM PURCHASE_ORDER_DETAIL
	 WHERE OBJECT_ID = @ObjectId


