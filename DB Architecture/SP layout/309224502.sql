/*          
 Mod Number | Programmer | Date     | Modification Description          
 --------------------------------------------------------------------          
 234081		| MK        | 04/29/2019 | Created. 
*/    
  
CREATE PROCEDURE MetaDetails_GetITEMUOM  
(   
@item nvarchar(50) = null ,  
@company nvarchar(25) = null 
)  
AS  
 SET NOCOUNT ON;  
  
BEGIN    
 
   SELECT  SEQUENCE, QUANTITY_UM, CONVERSION_QTY, LENGTH, WIDTH, HEIGHT, WEIGHT, MOVEMENT_CLS, INTERNAL_ITEM_UM
	FROM ITEM_UNIT_OF_MEASURE WHERE ITEM=@item AND  (COMPANY= @company OR COMPANY IS NULL)
 
END