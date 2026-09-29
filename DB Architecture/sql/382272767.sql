-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





  
  
CREATE PROCEDURE WEG_InsightDetailPaneData(@WorldEaseID numeric(25), @culture nvarchar(10))    
AS   
BEGIN  
  
 -- [comment omitted]
 SELECT top 1 N'<literal:1>' AS SCALAR,  
  WORLD_EASE_ID AS WorldEaseID, 
 dbo.GENCONFIGfn_RtrvDesc(N'<literal:2>', WORLD_EASE_GROUP_STATUS)  AS WorldEaseGroupStatus, 
  WAREHOUSE AS Warehouse,
  INTERNAL_SHIPMENT_NUM AS InternalShipmentNum  
 FROM SHIPPING_CONTAINER  
 WHERE WORLD_EASE_ID = @WorldEaseID;  
  
 -- [comment omitted]
 SELECT top 1 N'<literal:3>' AS SCALAR,  
  COUNT(distinct CONTAINER_ID) as Containers   
 FROM  
 SHIPPING_CONTAINER  
 WHERE  
 WORLD_EASE_ID = @WorldEaseID;   
  
END