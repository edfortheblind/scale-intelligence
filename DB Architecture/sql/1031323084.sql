-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





   

CREATE PROCEDURE wm_RItem06
	@Item nvarchar(50),
	@StorageTemplate nvarchar(25)
AS
	SELECT * FROM ITEM i, ITEM_UNIT_OF_MEASURE ium
		WHERE i.ITEM = @Item
		AND i.COMPANY IS NOT NULL
		AND i.ITEM = ium.ITEM
		AND ium.COMPANY IS NULL
		AND i.STORAGE_TEMPLATE <> @StorageTemplate
