-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */








CREATE PROCEDURE MCA_InsightDetailPaneData(@ObjectId numeric(9), @Item nvarchar(50), @Company nvarchar(25), @Location nvarchar(25),
 @Warehouse nvarchar(25), @NumberOfHits numeric(9), @culture nvarchar(10))  
AS 
BEGIN
	-- [comment omitted]
	SELECT top 1 N'<literal:1>' AS SCALAR,
		@Item AS Item,
		@NumberOfHits AS NumberOfHits,
		@Location AS Location,
		@Company AS Company,
		@Warehouse AS Warehouse		
	
	SELECT top 1 N'<literal:2>' AS SCALAR,
		INTERNAL_ITEM_NUM AS InternalItemNum,
		WEB_THUMBNAIL_IMG AS WebThumbnailImage,
		DESCRIPTION AS ItemDesc,
		ITEM_CLASS AS ItemClass
	FROM ITEM I WHERE ITEM = @Item AND COALESCE(NULLIF(COMPANY,N'<literal:3>'), N'<literal:4>') = COALESCE(NULLIF(@Company,N'<literal:5>'), N'<literal:6>')

	-- [comment omitted]
	SELECT top 1 N'<literal:7>' AS SCALAR, COUNT(DISTINCT(LOCATION)) as TotalLocations FROM LOCATION_INVENTORY WITH (NOLOCK) WHERE ITEM = @Item AND WAREHOUSE = @Warehouse AND 
	COALESCE(COMPANY, N'<literal:8>') = COALESCE(@Company, N'<literal:9>')

END

