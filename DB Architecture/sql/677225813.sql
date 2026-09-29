-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */



      
    
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
 N'<literal:1>' AS N'<literal:2>',   
 N'<literal:3>' AS N'<literal:4>', 
 N'<literal:5>' AS WAREHOUSE, 
 Item AS Item, DESCRIPTION AS Description, Company AS Company from ITEM WHERE ITEM=@item AND  (COMPANY= @company OR COMPANY IS NULL)
 
   
END
