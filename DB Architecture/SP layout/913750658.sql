/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	4854	| SMS	| 06/15/07	| Created.
	41741	| SMS	| 11/25/08	| Modified GENERIC_CONFIG_DETAIL condition to select YARDLOCAREA

	Returns a rowset used for header section in Yard Visibility Report.rpt
	
	Parameters:
		Warehouse - Warehouse name


	Returns:
		Summary information about total yard locations, filled locations,
		empty locations for the warehouse along with total receipts, trailer 
		information

*/

CREATE PROCEDURE RPT_YardVisibilityHdrDetails
(
	@paramwarehouse nvarchar(25)
)
AS
	BEGIN
			SELECT		
			COUNT(DISTINCT(D.DOCK_LOCATION)) N'TOTAL_LOCATIONS', 
			COUNT(CASE WHEN T.TRAILER_ID IS NOT NULL THEN NULL ELSE N'EMPTY' END) N'EMPTY_LOCATIONS',			
			COUNT(DISTINCT(T.TRAILER_ID)) N'TOTAL_TRAILERS',			
			COUNT(DISTINCT(R.RECEIPT_ID)) N'RECEIPT_ID',
			COUNT(L.ITEM) N'ITEM_COUNT',
			SUM(L.TOTAL_QTY) N'TOTAL_ITEM_QTY'
	FROM (
			SELECT	DOCK_LOCATION 
			FROM	DOCK_LOCATION WITH (NOLOCK)
			WHERE	WAREHOUSE = @paramwarehouse 
			AND DOCK_LOCATION_AREA IN
			(	SELECT	IDENTIFIER 
				FROM	GENERIC_CONFIG_DETAIL WITH (NOLOCK)
				WHERE	RECORD_TYPE = N'YARDLOCAREA' )
			)D
	LEFT OUTER JOIN TRAILER_YARD_STATUS T WITH (NOLOCK)
	ON	(D.DOCK_LOCATION = T.TRAILER_LOCATION)
	LEFT OUTER JOIN RECEIPT_HEADER R WITH (NOLOCK)
	ON T.TRAILER_ID = R.TRAILER_ID 
	LEFT OUTER JOIN APPOINTMENT_SCHEDULE A WITH (NOLOCK)
	ON R.INTERNAL_RECEIPT_NUM = A.INTERNAL_RECEIPT_NUM
	LEFT OUTER JOIN RECEIPT_DETAIL L WITH (NOLOCK)
	ON R.INTERNAL_RECEIPT_NUM = L.INTERNAL_RECEIPT_NUM
END


