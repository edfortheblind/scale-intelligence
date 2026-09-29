-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */























CREATE PROCEDURE wm_RConsolidatedShipmentHeader





@ERPOrderNum nvarchar(25),



@Warehouse nvarchar(25)







AS







 SELECT * FROM SHIPMENT_HEADER WHERE INTERNAL_SHIPMENT_NUM =(select  top 1  INTERNAL_SHIPMENT_NUM FROM SHIPMENT_DETAIL WHERE WAREHOUSE =  @Warehouse



 and   ERP_ORDER = @ERPOrderNum)  AND CONSOLIDATED =N'<literal:1>'