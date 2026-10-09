/*            
 Mod Number | Programmer | Date     | Modification Description            
 --------------------------------------------------------------------            
 235344  | MK        | 05/17/2019 | Created.   
*/      
    
CREATE PROCEDURE MetaTrans_GetItem  
(     
@item nvarchar(50) = null ,    
@company nvarchar(25) = null   
)    
AS    
 SET NOCOUNT ON;    
    
BEGIN      
   
    SELECT   
 TOP 1  
 N'SCALAR' AS N'EntityType',   
 N'itemUOMHeader' AS N'EntityName', 
 N'' AS WAREHOUSE, 
 Item AS Item, DESCRIPTION AS Description, Company AS Company from ITEM WHERE ITEM=@item AND  (COMPANY= @company OR COMPANY IS NULL)
 
   
END
