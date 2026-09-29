-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_DShippingContainer01
	@RowsAffected int OUTPUT,
	@InternalContainerNum numeric(9)
AS
	DELETE FROM SHIPPING_CONTAINER
	 WHERE INTERNAL_CONTAINER_NUM = @InternalContainerNum

SET @RowsAffected = @@ROWCOUNT
