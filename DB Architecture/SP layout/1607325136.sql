/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/

	CREATE PROCEDURE wm_RShippingContainer02
	@ContainerId nvarchar(25)
AS
	SELECT * FROM SHIPPING_CONTAINER
	 WHERE CONTAINER_ID = @ContainerId

