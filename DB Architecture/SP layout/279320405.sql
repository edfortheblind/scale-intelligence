/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_DOrderDetail01
	@RowsAffected int OUTPUT,
	@InternalOrderDtlNum numeric(9)
AS
	DELETE FROM ORDER_DETAIL
	 WHERE INTERNAL_ORDER_DTL_NUM = @InternalOrderDtlNum

SET @RowsAffected = @@ROWCOUNT
