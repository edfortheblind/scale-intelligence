-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */









 

 CREATE PROCEDURE [dbo].[STH_UpdateOrderStatus] (
  @loadNumber numeric(9)  )    
 AS 
 
 BEGIN 
 
 DECLARE @externalStatus nvarchar(50)  
 DECLARE @internalOrderNumbersTable table ( INTERNAL_ORDER_NUM numeric(9) ) 
 
 /* [comment omitted] */
INSERT    
INTO    
   @internalOrderNumbersTable    
SELECT  
   DISTINCT OH.INTERNAL_ORDER_NUM  
FROM  
   ORDER_HEADER OH INNER JOIN SHIPMENT_DETAIL SD ON SD.INTERNAL_ORDER_NUM = OH.INTERNAL_ORDER_NUM INNER JOIN SHIPMENT_HEADER SH ON SD.INTERNAL_SHIPMENT_NUM = SH.INTERNAL_SHIPMENT_NUM  
   AND SH.SHIPPING_LOAD_NUM=@loadNumber  

    /* [comment omitted] */
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
   and FUNCTIONAL_AREA=N'<literal:1>'    
       
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
