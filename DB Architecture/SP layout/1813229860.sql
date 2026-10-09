/*
	Mod Number	| Programmer	| Date   	| Modification Description
	-------------------------------------------------------------------- 
	204221		| DP			| 05/25/17	| Created.
	206361	    | RS		    | 06/08/17  | Added ObjectId adn PurchaseOrderLineNumber.
	207780		| TDA			| 07/11/17	| Added ItemDesc

*/

CREATE PROCEDURE POD_InsightDetailPaneData(@ObjectId numeric(9) ,@culture nvarchar(10))  
AS 
BEGIN

	-- Detail pane details
	SELECT top 1 N'SCALAR' AS SCALAR,
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

