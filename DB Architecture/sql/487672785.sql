-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

 -- [comment omitted]
 -- [comment omitted]
 -- [comment omitted]
 -- [comment omitted]
 -- [comment omitted]
CREATE PROCEDURE [dbo].[RPT_Shippers_Export_Declaration] 

(
@INTERNAL_SHIPMENT_NUM INT 
)

AS
BEGIN

SET NOCOUNT ON;

	SELECT 
		  N'<literal:1>'			= C.NAME
		, N'<literal:2>'			= C.ADDRESS1
		, N'<literal:3>'			= C.ADDRESS2
		, N'<literal:4>'			= C.ADDRESS3
		, N'<literal:5>'			= C.CITY
		, N'<literal:6>'			= C.[STATE]
		, N'<literal:7>'			= C.POSTAL_CODE
		, N'<literal:8>'				= '<literal:9>'
		, N'<literal:10>'		= CASE WHEN SH.PARTIES IS NULL THEN NULL ELSE '<literal:11>' END
		, N'<literal:12>'	= CASE WHEN SH.PARTIES IS NULL THEN '<literal:13>' ELSE NULL END
		, N'<literal:14>'					= CONVERT(NVARCHAR(10),GETDATE(),101)
		, N'<literal:15>'					= NULL
		, N'<literal:16>'			= SH.SHIP_TO_NAME
		, N'<literal:17>'			= SH.SHIP_TO_ADDRESS1
		, N'<literal:18>'			= SH.SHIP_TO_ADDRESS2
		, N'<literal:19>'			= SH.SHIP_TO_CITY
		, N'<literal:20>'			= SH.SHIP_TO_STATE
		, N'<literal:21>'			= SH.SHIP_TO_POSTAL_CODE
		, N'<literal:22>'		= SH.SHIP_TO_COUNTRY
		, N'<literal:23>'			= SH.INTERMEDIATE_NAME
		, N'<literal:24>'			= SH.INTERMEDIATE_ADDRESS1
		, N'<literal:25>'			= SH.INTERMEDIATE_ADDRESS2
		, N'<literal:26>'			= SH.INTERMEDIATE_CITY
		, N'<literal:27>'			= SH.INTERMEDIATE_STATE
		, N'<literal:28>'			= SH.INTERMEDIATE_POSTAL_CODE
		, N'<literal:29>'		= SH.INTERMEDIATE_COUNTRY
		, N'<literal:30>'			= NULL
		, N'<literal:31>'			= NULL
		, N'<literal:32>'			= NULL
		, N'<literal:33>'			= NULL
		, N'<literal:34>'			= NULL
		, N'<literal:35>'			= NULL
		, N'<literal:36>'		= NULL
		, N'<literal:37>'				= NULL
		, N'<literal:38>'					= C.[STATE]
		, N'<literal:39>'					= SH.SHIP_TO_COUNTRY
		, N'<literal:40>'					= SH.LOADING_PIER
		, N'<literal:41>'					= '<literal:42>'
		, N'<literal:43>'					= SH.CARRIER
		, N'<literal:44>'					= '<literal:45>'
		, N'<literal:46>'					= SH.UNLOADING_PORT
		, N'<literal:47>'			= CASE WHEN SH.CONTAINERIZED IS NULL THEN NULL ELSE '<literal:48>' END
		, N'<literal:49>'				= CASE WHEN SH.CONTAINERIZED IS NULL THEN '<literal:50>' ELSE NULL END
		, N'<literal:51>'					= NULL
		, N'<literal:52>'					= SH.BOL_NUM_ALPHA
		, N'<literal:53>'					= NULL
		, N'<literal:54>'			= NULL -- [comment omitted]
		, N'<literal:55>'				= '<literal:56>'  -- [comment omitted]
		, N'<literal:57>'					= '<literal:58>'
		, N'<literal:59>'			= NULL -- [comment omitted]
		, N'<literal:60>'				= NULL  -- [comment omitted]
		, N'<literal:61>'					= SD.INTERNAL_SHIPMENT_NUM
		, N'<literal:62>'					= CASE WHEN SD.COUNTRY_OF_ORIGIN = NULL THEN '<literal:63>'
											ELSE (CASE SD.COUNTRY_OF_ORIGIN WHEN '<literal:64>' THEN '<literal:65>'
													ELSE '<literal:66>' 
													END)
											END
		, N'<literal:67>'		= SD.ITEM_DESC
		, N'<literal:68>'		= SD.HARMONIZED_DESC
		, N'<literal:69>'		= SD.HARMONIZED_CODE
		, N'<literal:70>'					= CAST(SD.TOTAL_QTY As INT)
		, N'<literal:71>'					= SD.ITEM_WEIGHT
		, N'<literal:72>'					= NULL
		, N'<literal:73>'					= CAST((SD.TOTAL_QTY * SD.ITEM_NET_PRICE) As DECIMAL(9,2))
		, N'<literal:74>'					= '<literal:75>'
		, N'<literal:76>'					= '<literal:77>'
		, N'<literal:78>'					= NULL
		, N'<literal:79>'					= NULL
		, N'<literal:80>'		= NULL
		, N'<literal:81>'			= '<literal:82>'
		, N'<literal:83>'			= CONVERT(NVARCHAR(10),GETDATE(),101)
		, N'<literal:84>'			= C.PHONE_NUM
		, N'<literal:85>'			= C.EMAIL_ADDRESS
		-- [comment omitted]
		-- [comment omitted]
		-- [comment omitted]
		-- [comment omitted]
		-- [comment omitted]
		-- [comment omitted]
		-- [comment omitted]
		-- [comment omitted]
		-- [comment omitted]
		-- [comment omitted]
		-- [comment omitted]
	FROM   ((dbo.SHIPMENT_HEADER SH  WITH(NOLOCK)
				  INNER JOIN dbo.SHIPMENT_DETAIL SD WITH(NOLOCK)
						 ON SH.INTERNAL_SHIPMENT_NUM = SD.INTERNAL_SHIPMENT_NUM) 
			LEFT OUTER JOIN dbo.COMPANY C WITH(NOLOCK)
				   ON SH.COMPANY = C.COMPANY) 
			INNER JOIN dbo.WAREHOUSE WAREHOUSE 
				   ON SH.warehouse=WAREHOUSE.warehouse
	WHERE  SH.INTERNAL_SHIPMENT_NUM = @INTERNAL_SHIPMENT_NUM
	ORDER BY SD.INTERNAL_SHIPMENT_NUM;

SET NOCOUNT OFF;

END;