
/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	138902	| MDL	| 04/08/14	| Created
	141896  | SAM   | 05/14/14	| Removed conversion of activity_date_time to varchar
*/

-- Get Data for InventoryInsightDetailPane Transaction grid which internal convert into JSON and send to client

CREATE PROCEDURE InventoryInsightDetailPaneTransactionHistoryData(@location nvarchar(25) , @item nvarchar(50) , @company nvarchar(25) , @warehouse nvarchar(25) )  
AS 
BEGIN

SELECT TOP 10 dbo.GENCONFIGfn_RtrvDesc(N'HIST TR TY', transaction_type) 	AS TRANSTYPE, 
              direction                                            	AS DIRECTION, 
              quantity                                             	AS QTY#30, 
              [user_name]                                          	AS USERNAME,       	
			  activity_date_time AS ACTIVITYDATETIME 				           
FROM   transaction_history 
WHERE  location = @location 
       AND warehouse = @warehouse 
       AND ( item = @item 
              OR @item IS NULL ) 
       AND ( company = @company 
              OR @company IS NULL ) 

ORDER BY activity_date_time DESC

END
