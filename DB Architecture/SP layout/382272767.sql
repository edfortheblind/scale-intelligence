/*  
 Mod Number | Programmer | Date     | Modification Description  
 --------------------------------------------------------------------   
 252248	    | SO         | 05/20/20 | Created.  
 252248		| SO		 | 05/28/20	| Modified to use new generic config detail WORLDEASEGROUPSTATUS
 
*/  
  
CREATE PROCEDURE WEG_InsightDetailPaneData(@WorldEaseID numeric(25), @culture nvarchar(10))    
AS   
BEGIN  
  
 -- Detail pane details  
 SELECT top 1 N'SCALAR' AS SCALAR,  
  WORLD_EASE_ID AS WorldEaseID, 
 dbo.GENCONFIGfn_RtrvDesc(N'WORLDEASEGROUPSTATUS', WORLD_EASE_GROUP_STATUS)  AS WorldEaseGroupStatus, 
  WAREHOUSE AS Warehouse,
  INTERNAL_SHIPMENT_NUM AS InternalShipmentNum  
 FROM SHIPPING_CONTAINER  
 WHERE WORLD_EASE_ID = @WorldEaseID;  
  
 --Containers
 SELECT top 1 N'SCALAR' AS SCALAR,  
  COUNT(distinct CONTAINER_ID) as Containers   
 FROM  
 SHIPPING_CONTAINER  
 WHERE  
 WORLD_EASE_ID = @WorldEaseID;   
  
END