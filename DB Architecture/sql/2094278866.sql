-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */














CREATE PROCEDURE wm_RShipmentDetail07



@InternalShipmentNum numeric(9),

@ERPOrderNum nvarchar(25),

@ErpOrderLineNum numeric(19,5),

@Warehouse nvarchar(25)







AS 

 

 SELECT * FROM SHIPMENT_DETAIL WHERE 

  INTERNAL_SHIPMENT_NUM = @InternalShipmentNum

  AND (ERP_ORDER  = @ERPOrderNum OR (@ERPOrderNum IS NULL AND ERP_ORDER IS NULL))

  AND ERP_ORDER_LINE_NUM = @ErpOrderLineNum  

  AND  WAREHOUSE = @Warehouse