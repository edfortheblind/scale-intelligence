-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */








CREATE PROCEDURE POD_InsightDetailPaneData(@ObjectId numeric(9) ,@culture nvarchar(10))  
AS 
BEGIN

	-- [comment omitted]
	SELECT top 1 N'<literal:1>' AS SCALAR,
		PD.OBJECT_ID AS InternalOrderLineNumber,
		PD.LINE_NUMBER AS PurchaseOrderLineNumber,
		PD.ITEM AS Item,
		PD.COMPANY AS Company,
		@ObjectId AS ObjectId,
		i.DESCRIPTION AS ItemDesc,
		i.WEB_THUMBNAIL_IMG AS WebThumbnailImage
	FROM PURCHASE_ORDER_DETAIL PD
	LEFT OUTER JOIN ITEM i 
		on (PD.ITEM = i.ITEM AND (PD.COMPANY = i.COMPANY OR (PD.COMPANY IS NULL AND i.COMPANY IS NULL)))
	WHERE OBJECT_ID = @ObjectId;

END

