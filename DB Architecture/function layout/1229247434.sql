/*
	Mod Number	| Programmer	| Date   	  | Modification Description
	----------------------------------------------------------------------
	261046		| AC			| 01/21/2021  | Created SQL function to fetch Lot expiration date during upload on status change.
*/

CREATE   FUNCTION [dbo].[GetLotExpirationDateForUpload]
 (
 @warehouse nvarchar(25),
 @item nvarchar(50),
 @company nvarchar(25),
 @lot nvarchar(25)
 )
RETURNS DATETIME
AS
 BEGIN 
	RETURN (SELECT TOP 1 EXPIRATION_DATE from (SELECT EXPIRATION_DATE, OBJECT_ID from LOT
where ITEM = @item AND  ((COMPANY IS NULL and @company is null) or (COMPANY = @company)) and WAREHOUSE= @warehouse and LOT =@lot
UNION  
Select EXPIRATION_DATE, OBJECT_ID from AR_LOT
where ITEM = @item AND  ((COMPANY IS NULL and @company is null) or (COMPANY = @company)) and WAREHOUSE= @warehouse and LOT =@lot
) AS T
ORDER BY OBJECT_ID DESC);	
 END