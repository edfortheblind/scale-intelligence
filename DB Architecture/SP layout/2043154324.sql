-- =============================================
-- Author:		Jimmy
-- Create date: 12-10-2009
-- Description:	ShipRec Finished Today
-- =============================================
CREATE PROCEDURE [dbo].[ShipRec_FinishedToday_Grid1] 
	-- Add the parameters for the stored procedure here
	 @TheDate datetime = 0 

AS
BEGIN
--	-- SET NOCOUNT ON added to prevent extra result sets from
--	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
/* declare @TheDate as datetime  set @TheDate = '08-27-2010'  */
	SELECT  
	SUM(CASE WHEN SH.CARRIER = 'UPS' THEN 1 ELSE 0 END) AS 'Parcel', 
	SUM(CASE WHEN SH.CARRIER = 'UPS' THEN 0 ELSE 1 END) AS 'LTL',
	/*CASE WHEN I.ITEM_CATEGORY1 IN ('Air Force', 'Coast Guard') THEN 'AF Bldg' ELSE 'MC Bldg' END as BLDG  */
	CASE WHEN LEFT(SD.ALLOCATION_RULE, 3) = '225' THEN 'MC Bldg' ELSE 'STZ Bldg' END as BLDG 
	FROM 	(SELECT  ERP_ORDER,  MAX(INTERNAL_SHIPMENT_NUM) AS INTERNAL_SHIPMENT_NUM 
		, MAX(ALLOCATION_RULE) AS ALLOCATION_RULE , SUM(TOTAL_QTY) AS TOTAL_QTY
		 FROM SHIPMENT_DETAIL 
		 GROUP BY ERP_ORDER)  AS SD
	INNER JOIN SHIPMENT_HEADER AS SH ON SH.INTERNAL_SHIPMENT_NUM = SD.INTERNAL_SHIPMENT_NUM
	WHERE 
	(
		 (
		SH.ACTUAL_SHIP_DATE_TIME >= DATEADD(dd,DATEDIFF(dd,0,@TheDate),0) 
		AND SH.ACTUAL_SHIP_DATE_TIME < DATEADD(dd,DATEDIFF(dd,0,@TheDate + 1),0) 
		 ) 
		OR 
		(
		SH.TRAILING_STS >= 700 
		AND SH.TRAILING_STS_DATE >= DATEADD(dd,DATEDIFF(dd,0,@TheDate),0) 
		AND SH.TRAILING_STS_DATE < DATEADD(dd,DATEDIFF(dd,0,@TheDate + 1),0) 
		 )  
	)
	AND SH.CUSTOMER_CATEGORY2 = 'Normal' 
	AND SD.TOTAL_QTY > 0
	GROUP BY CASE WHEN LEFT(SD.ALLOCATION_RULE, 3) = '225' THEN 'MC Bldg' ELSE 'STZ Bldg' END 
	ORDER BY BLDG


END