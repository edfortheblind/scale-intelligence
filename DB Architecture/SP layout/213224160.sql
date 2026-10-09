/*
	Mod Number	| Programmer	| Date   	| Modification Description
	-------------------------------------------------------------------- 
	204458		| DP			| 07/06/17	| Created.
	204458      | PA            | 07/11/17  | Query optimization.
	204458		| RS			| 07/11/17	| Added InternalItemNum and WebThumbnailImage.

*/

CREATE PROCEDURE MCA_InsightDetailPaneData(@ObjectId numeric(9), @Item nvarchar(50), @Company nvarchar(25), @Location nvarchar(25),
 @Warehouse nvarchar(25), @NumberOfHits numeric(9), @culture nvarchar(10))  
AS 
BEGIN
	-- Detail pane details
	SELECT top 1 N'SCALAR' AS SCALAR,
		@Item AS Item,
		@NumberOfHits AS NumberOfHits,
		@Location AS Location,
		@Company AS Company,
		@Warehouse AS Warehouse		
	
	SELECT top 1 N'SCALAR' AS SCALAR,
		INTERNAL_ITEM_NUM AS InternalItemNum,
		WEB_THUMBNAIL_IMG AS WebThumbnailImage,
		DESCRIPTION AS ItemDesc,
		ITEM_CLASS AS ItemClass
	FROM ITEM I WHERE ITEM = @Item AND COALESCE(NULLIF(COMPANY,N''), N'!') = COALESCE(NULLIF(@Company,N''), N'!')

	-- Locations count
	SELECT top 1 N'SCALAR' AS SCALAR, COUNT(DISTINCT(LOCATION)) as TotalLocations FROM LOCATION_INVENTORY WITH (NOLOCK) WHERE ITEM = @Item AND WAREHOUSE = @Warehouse AND 
	COALESCE(COMPANY, N'!') = COALESCE(@Company, N'!')

END

