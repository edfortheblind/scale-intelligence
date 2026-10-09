/*

	Task	| By	| Date			| Modification Description

	-------------------------------------------------

	147977	| kss	| 10/07/14	| Created.
	162377	| AA	| 07/30/15	| Modified the procedure to handle the null condition for ERP order.

	

*/



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