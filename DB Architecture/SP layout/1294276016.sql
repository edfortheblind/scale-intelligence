/*
	Mod Number	| Programmer		| Date   	| Modification Description
	--------------------------------------------------------------------
	14660		| LJM			| 07/06/04	| created
    46137       | DRK           | 02/04/09  | Modified to reference item instead of x_ref_item
    70105		| MM			| 06/07/10	| Reverted back to using x_ref_item instead of item
	 140413     | NVS           | 04/23/14  | Change item length to 50
	191074		| DN			| 01/23/17	| Updated parameter types
*/

CREATE PROCEDURE wm_RItem08
	@Item nvarchar(50),
	@Company nvarchar(25)
AS
	SELECT ITEM.* FROM ITEM, ITEM_CROSS_REFERENCE
	WHERE ITEM.ITEM = ITEM_CROSS_REFERENCE.ITEM
	AND (ITEM.COMPANY = ITEM_CROSS_REFERENCE.COMPANY OR ITEM.COMPANY IS NULL OR ITEM_CROSS_REFERENCE.COMPANY IS NULL)
	AND ITEM_CROSS_REFERENCE.X_REF_ITEM = @Item
	AND  (ITEM_CROSS_REFERENCE.COMPANY = @Company OR ITEM_CROSS_REFERENCE.COMPANY IS NULL OR @Company IS NULL);