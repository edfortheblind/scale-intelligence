/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_DShippingContainer01
	@RowsAffected int OUTPUT,
	@InternalContainerNum numeric(9)
AS
	DELETE FROM SHIPPING_CONTAINER
	 WHERE INTERNAL_CONTAINER_NUM = @InternalContainerNum

SET @RowsAffected = @@ROWCOUNT
