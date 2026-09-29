-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE TpmOrderLineStatus_InsightDetailPaneData 
(
@internalOrderDetailNum numeric(9),
@culture nvarchar(10)
)  
AS 
BEGIN
SELECT TOP 1 N'<literal:1>' AS SCALAR,
      OH.ERP_ORDER,
	  OD.ERP_ORDER_LINE_NUM,
	  OD.ITEM,
	  OD.COMPANY,
	  OD.ITEM_DESC,
	  OD.CUSTOMER_NAME,
	  OD.CUSTOMER as CUSTOMER_ID,
	  OD.CONDITION,
	  i.WEB_THUMBNAIL_IMG AS WebThumbnailImage	
      FROM 
	  ORDER_HEADER OH
	  INNER JOIN 
	  ORDER_DETAIL OD
	  ON OD.INTERNAL_ORDER_NUM=OH.INTERNAL_ORDER_NUM
	  LEFT OUTER JOIN ITEM i
      ON (OD.ITEM = i.ITEM AND (OD.COMPANY = i.COMPANY OR (OD.COMPANY IS NULL AND i.COMPANY IS NULL)))
      WHERE OD.INTERNAL_ORDER_DTL_NUM=@internalOrderDetailNum;
END