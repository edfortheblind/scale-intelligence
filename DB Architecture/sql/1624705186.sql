-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */






-- [comment omitted]

CREATE PROCEDURE InventoryInsightDetailPaneTransactionHistoryData(@location nvarchar(25) , @item nvarchar(50) , @company nvarchar(25) , @warehouse nvarchar(25) )  
AS 
BEGIN

SELECT TOP 10 dbo.GENCONFIGfn_RtrvDesc(N'<literal:1>', transaction_type) 	AS TRANSTYPE, 
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
