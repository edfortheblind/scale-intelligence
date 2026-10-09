/*



	Task	| By	| Date			| Modification Description



	-------------------------------------------------



	147977	| kss	| 10/07/14	| Created.



	



*/



CREATE PROCEDURE wm_RConsolidatedShipmentHeader





@ERPOrderNum nvarchar(25),



@Warehouse nvarchar(25)







AS







 SELECT * FROM SHIPMENT_HEADER WHERE INTERNAL_SHIPMENT_NUM =(select  top 1  INTERNAL_SHIPMENT_NUM FROM SHIPMENT_DETAIL WHERE WAREHOUSE =  @Warehouse



 and   ERP_ORDER = @ERPOrderNum)  AND CONSOLIDATED =N'Y'