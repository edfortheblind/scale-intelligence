/*   
 Mod Number | Programmer  | Date		| Modification Description  
 -----------------------------------------------------------------
 90552		| SAM		  | 01/25/12	| Created
 112369 | KSS  | 07/15/13 | Modified the Select query to consider the INTERNAL_ORDER_NUM of SHIPMENT_DETAIL table which has the INTERNAL_ORDER_NUM of consolidated shipment
 112369		| SHS		  | 07/23/13	| Modified Delete query to join with Shipemnt_Detail instead of Shipment_Header which will have the correct Internal_Order_Num
 
 Parameters:
 @loadNumber : shipment load number
 
 */ 

 CREATE PROCEDURE [dbo].[STH_UpdateOrderStatus] (
  @loadNumber numeric(9)  )    
 AS 
 
 BEGIN 
 
 DECLARE @externalStatus nvarchar(50)  
 DECLARE @internalOrderNumbersTable table ( INTERNAL_ORDER_NUM numeric(9) ) 
 
 /* RETRIEVE ALL ORDERS THAT HAVE ALL SHIPMENT CONFIRMED */
INSERT    
INTO    
   @internalOrderNumbersTable    
SELECT  
   DISTINCT OH.INTERNAL_ORDER_NUM  
FROM  
   ORDER_HEADER OH INNER JOIN SHIPMENT_DETAIL SD ON SD.INTERNAL_ORDER_NUM = OH.INTERNAL_ORDER_NUM INNER JOIN SHIPMENT_HEADER SH ON SD.INTERNAL_SHIPMENT_NUM = SH.INTERNAL_SHIPMENT_NUM  
   AND SH.SHIPPING_LOAD_NUM=@loadNumber  

    /* FILTER ORDERS OF @internalOrderNumbersTable THAT HAVE ATLEAST ONE SHIPMENT WITH TRAILING STATUS LESS THAN 900 */
   DELETE
from
   @internalOrderNumbersTable
where
   INTERNAL_ORDER_NUM IN (
SELECT
   DISTINCT T.INTERNAL_ORDER_NUM
FROM
   @internalOrderNumbersTable T INNER JOIN SHIPMENT_DETAIL SD ON T.INTERNAL_ORDER_NUM = SD.INTERNAL_ORDER_NUM   
   AND SD.STATUS1<900
   ) 
    
SELECT    
   @externalStatus=EXTERNAL_STS    
FROM    
   FUNCTIONAL_AREA_STATUS_FLOW    
WHERE    
   status=900    
   and FUNCTIONAL_AREA=N'Outbound'    
       
UPDATE    
   ORDER_HEADER    
SET    
   CONDITION=@externalStatus,
   CONDITION_DATE_TIME = GETUTCDATE()    
WHERE    
   ORDER_HEADER.INTERNAL_ORDER_NUM IN (    
SELECT    
   INTERNAL_ORDER_NUM    
FROM    
   @internalOrderNumbersTable )     
       
UPDATE    
   ORDER_DETAIL    
SET    
   CONDITION=@externalStatus    
WHERE    
   ORDER_DETAIL.INTERNAL_ORDER_NUM IN (    
      SELECT    
         INTERNAL_ORDER_NUM    
      FROM    
         @internalOrderNumbersTable     
   ) 
END
