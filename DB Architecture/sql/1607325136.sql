-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






	CREATE PROCEDURE wm_RShippingContainer02
	@ContainerId nvarchar(25)
AS
	SELECT * FROM SHIPPING_CONTAINER
	 WHERE CONTAINER_ID = @ContainerId

