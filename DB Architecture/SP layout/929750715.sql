/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	4854	| SMS	| 06/15/07	| Created.

	Returns a rowset used for YardItemDetails subreport 
	in Yard Visibility Report.rpt
	
	Parameters:
		InternalReceiptNum - Internal Receipt Number


	Returns:
		Receipt detail information for a Receipt

*/

CREATE PROCEDURE RPT_YardVisibilityRcptDetails
(
	@internalReceiptNum numeric(9)
)
AS
BEGIN
	SELECT 
			ITEM N'ITEM', 
			TOTAL_QTY N'TOTAL_QTY', 
			ITEM_DESC N'ITEM_DESC' 
	FROM	RECEIPT_DETAIL WITH (NOLOCK)
	WHERE	INTERNAL_RECEIPT_NUM = @InternalReceiptNum
END



