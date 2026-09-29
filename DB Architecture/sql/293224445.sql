-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE MetaDetail_GetBOMComponents 
(
	@internalBomHeaderNum numeric(9),
	@bomHeaderQuantity numeric(19,5)
)
AS
	SET NOCOUNT ON;	
	
SELECT 
	BUILD_SEQUENCE AS BuildSequence,
	ITEM AS Item,
	COMPANY AS Company,
	ITEM_DESC AS ItemDesc,
	(QTY_NEEDED_PER_ITEM * @bomHeaderQuantity) AS TotalConvertedQtyNeeded,
	0 AS TotalQtyUsed,
	(QTY_NEEDED_PER_ITEM * @bomHeaderQuantity) AS OrigTotalQtyNeeded,
	0 AS OnHandQty,
	NULL AS Lot,
	FROM_LOCATION AS FromLocation,
	NULL AS ImmediateNeedsNote,
	0 AS InternalWorkOrderNum,
	(-1)*ROW_NUMBER() OVER(ORDER BY BUILD_SEQUENCE ASC) AS InternalWorkOrderLineNum,
	0 AS Allocated,
	QUANTITY_UM AS ConvertedUm,
	BUILD_LEVEL AS BuildLevel
FROM BILL_OF_MATERIALS_DETAIL
WHERE INTERNAL_BOM_HEADER_NUM = @internalBomHeaderNum
ORDER BY BuildLevel, BuildSequence


