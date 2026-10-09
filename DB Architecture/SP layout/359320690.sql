/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_DShippingLoad01
	@RowsAffected int OUTPUT,
	@InternalLoadNum numeric(9)
AS
	DELETE FROM SHIPPING_LOAD
	 WHERE INTERNAL_LOAD_NUM = @InternalLoadNum

SET @RowsAffected = @@ROWCOUNT
