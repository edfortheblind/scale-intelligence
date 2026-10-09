
-- =============================================
-- Author:           Jimmy
-- Create date: 2009-12-10
-- Description:      ShipRec FinishedToday grid2
-- =============================================
CREATE PROCEDURE [dbo].[ShipRec_FinishedToday_Grid2] 
       -- Add the parameters for the stored procedure here
       @TheDate datetime = 0 
AS
BEGIN
    /* SET NOCOUNT ON added to prevent extra result sets from
		interfering with SELECT statements.						*/
	SET NOCOUNT ON;

	--DECLARE @TheDate DATETIME = '2019-03-18'

    /* Insert statements for procedure here */
	SELECT TrailingStatus, TRAILING_STS, CARRIER_TYPE, 
		SUM(CASE WHEN BLDG IN ('225','402','STZ') THEN CCOUNT ELSE 0 END) AS 'STZ'
	FROM (
			SELECT COUNT(SD.ERP_ORDER) AS CCOUNT,
			CASE SH.TRAILING_STS 
				WHEN 100 THEN 'In Pool'
				WHEN 200 THEN 'Wave Pending'
				WHEN 201 THEN 'In Wave'
				WHEN 300 THEN 'Picking Pending'
				WHEN 301 THEN 'In Picking'
				WHEN 400 THEN 'Packing Pending'
				WHEN 401 THEN 'In Packing'
				WHEN 600 THEN 'Staging Pending'
				WHEN 650 THEN 'Loading Pending'
				WHEN 700 THEN 'Ship Confirm Pending'
				WHEN 800 THEN 'Load Confirm Pending'
				WHEN 900 THEN 'Closed'
				ELSE CAST(SH.TRAILING_STS AS VARCHAR) 
			END As TrailingStatus,
			SH.TRAILING_STS AS TRAILING_STS,
			'STZ' as BLDG,
			CASE SH.CARRIER_TYPE
				WHEN 'TL' THEN 'TL/LTL'
				WHEN 'LTL' THEN 'TL/LTL'
				WHEN 'Parcel' THEN 'UPS'
				ELSE SH.CARRIER_TYPE END As CARRIER_TYPE
			FROM (
					SELECT DISTINCT ERP_ORDER,
						SUM(TOTAL_QTY) AS TOTAL_QTY, 
						MAX(INTERNAL_SHIPMENT_NUM) AS INTERNAL_SHIPMENT_NUM, 
						MAX(ITEM) AS ITEM, 
						MAX(ITEM_CATEGORY1) AS ITEM_CATEGORY1 
					FROM SHIPMENT_DETAIL 
					GROUP BY ERP_ORDER
				)  AS SD 
			INNER JOIN SHIPMENT_HEADER AS SH 
				ON SD.INTERNAL_SHIPMENT_NUM = SH.INTERNAL_SHIPMENT_NUM 
			WHERE SH.PLANNED_SHIP_DATE >= DATEADD(dd,DATEDIFF(dd,0, @TheDate ),0)  
			AND SH.PLANNED_SHIP_DATE < DATEADD(dd,DATEDIFF(dd,0, @TheDate + 1),0)  
			AND (SH.LAUNCH_NUM NOT IN (49906, 49910) OR SH.LAUNCH_NUM IS NULL)
			AND SH.CUSTOMER_CATEGORY2 = 'Normal'  
			GROUP BY SH.TRAILING_STS, SH.CARRIER_TYPE
		) AS DER 
	GROUP BY TrailingStatus, TRAILING_STS, CARRIER_TYPE
	ORDER BY CARRIER_TYPE, TRAILING_STS 

	SET NOCOUNT OFF
END