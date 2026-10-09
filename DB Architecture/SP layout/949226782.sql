/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	197610	| SO	| 02/06/17	| Created
	197610	| SO	| 02/06/17	| Modified column names
	197610	| SO 	| 02/06/20  | Modified 
	
*/
CREATE PROCEDURE MetaTrans_GetShipmentDetailsForCreateReceipt(
@internalShipmentNum numeric(9),
@userName nvarchar(30),
 @culture nvarchar(10))
AS
	SET NOCOUNT ON;
SELECT
ERP_ORDER_LINE_NUM as N'ErpOrderLineNumber',  
ITEM as N'Item',  
ITEM_DESC as N'Description', 
COMPANY as N'Company',
TOTAL_QTY AS N'ShippedQuantity', 
TOTAL_QTY AS N'ReturnedQuantity',
QUANTITY_UM as N'QuantityUm', 
INTERNAL_SHIPMENT_LINE_NUM as InternalShipmentLineNum,
INTERNAL_SHIPMENT_NUM as N'InternalShipmentNum' FROM SHIPMENT_DETAIL
WHERE SHIPMENT_DETAIL.INTERNAL_SHIPMENT_NUM =@internalShipmentNum AND 
(EXISTS(select COMPANY_AUTH from USER_PROFILE where user_name = @userName and COMPANY_AUTH=N'All')
OR (COMPANY IN  (SELECT COMP.COMPANY FROM COMPANY_ACCESS COMP  WHERE  COMP.USER_NAME  = @userName )  OR  COMPANY IS NULL OR  COMPANY =N'' )) 
ORDER BY ITEM 
