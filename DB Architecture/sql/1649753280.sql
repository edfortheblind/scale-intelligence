-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */










-- [comment omitted]

CREATE PROCEDURE SHP_LineInsightDetailPaneData(@internalShipmentLineNum numeric(9) , @culture nvarchar(10))  
AS 
BEGIN

SELECT top 1 N'<literal:1>' AS SCALAR,
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