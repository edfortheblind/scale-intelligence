/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	185486	| AU	| 09/19/16	| Created
	184778	| MMM	| 11/17/18	| Replaced shipment number with shipment line number as this is the primery key for shipment details
	184786  | DP	| 11/22/16	| Included WAREHOUSE and SHIPMENT_ID 
	186775	| SD	| 12/23/16	| Removed the temporary table and added the detail pane contents.
	191074	| DN	| 01/23/17	| Updated parameter types
	198322	| DP	| 03/17/17	| Added Item image
*/

-- Get Data for ShipmentLineInsight which internal convert into JSON and send to client

CREATE PROCEDURE SHP_LineInsightDetailPaneData(@internalShipmentLineNum numeric(9) , @culture nvarchar(10))  
AS 
BEGIN

SELECT top 1 N'SCALAR' AS SCALAR,
	SD.INTERNAL_SHIPMENT_LINE_NUM As InternalShipmentLineNum,
	SD.INTERNAL_SHIPMENT_NUM As InternalShipmentNum,
	SD.SHIPMENT_ID As ShipmentID,
	SD.WAREHOUSE As Warehouse,
	SD.ERP_ORDER_LINE_NUM AS ErpOrderLineNum,
	SD.ITEM AS Item,
	SD.COMPANY AS Company,
	SD.ITEM_DESC AS ItemDesc,
	i.WEB_THUMBNAIL_IMG AS WebThumbnailImage
FROM SHIPMENT_DETAIL SD
LEFT OUTER JOIN ITEM i
ON (SD.ITEM = i.ITEM AND (SD.COMPANY = i.COMPANY OR (SD.COMPANY IS NULL AND i.COMPANY IS NULL)))
WHERE INTERNAL_SHIPMENT_LINE_NUM = @internalShipmentLineNum;

END