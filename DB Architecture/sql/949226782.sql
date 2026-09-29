-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE PROCEDURE MetaTrans_GetShipmentDetailsForCreateReceipt(
@internalShipmentNum numeric(9),
@userName nvarchar(30),
 @culture nvarchar(10))
AS
	SET NOCOUNT ON;
SELECT
ERP_ORDER_LINE_NUM as N'<literal:1>',  
ITEM as N'<literal:2>',  
ITEM_DESC as N'<literal:3>', 
COMPANY as N'<literal:4>',
TOTAL_QTY AS N'<literal:5>', 
TOTAL_QTY AS N'<literal:6>',
QUANTITY_UM as N'<literal:7>', 
INTERNAL_SHIPMENT_LINE_NUM as InternalShipmentLineNum,
INTERNAL_SHIPMENT_NUM as N'<literal:8>' FROM SHIPMENT_DETAIL
WHERE SHIPMENT_DETAIL.INTERNAL_SHIPMENT_NUM =@internalShipmentNum AND 
(EXISTS(select COMPANY_AUTH from USER_PROFILE where user_name = @userName and COMPANY_AUTH=N'<literal:9>')
OR (COMPANY IN  (SELECT COMP.COMPANY FROM COMPANY_ACCESS COMP  WHERE  COMP.USER_NAME  = @userName )  OR  COMPANY IS NULL OR  COMPANY =N'<literal:10>' )) 
ORDER BY ITEM 
