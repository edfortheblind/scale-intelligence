-- =============================================
-- Author:		Jimmy
-- Create date: July 12, 2010
-- Description:	Sets planned ship date and planned delivery date for manually created shipments (Returns)
-- =============================================
CREATE PROCEDURE TRAV_SetShipByAndDeliverByForReturns 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		UPDATE SHIPMENT_HEADER 
		SET PLANNED_SHIP_DATE = DER.NEW_PLANNED_SHIP_DATE, 
			PLANNED_DELIVERY_DATE_TIME = DER.NEW_PLANNED_DELIVERY_DATE_TIME  
		FROM SHIPMENT_HEADER AS SH, 
		(
			SELECT 
			SH.SHIPMENT_ID, 
			SH.CREATION_DATE_TIME_STAMP, 
			Shawn.dbo.FindWorkdayDate (7, SH.CREATION_DATE_TIME_STAMP) AS NEW_PLANNED_SHIP_DATE, 
			Shawn.dbo.FindWorkdayDate (14, SH.CREATION_DATE_TIME_STAMP) AS NEW_PLANNED_DELIVERY_DATE_TIME 
			FROM dbo.SHIPMENT_HEADER AS SH 
			WHERE SH.CUSTOMER_CATEGORY2 IN ('Reship No Rebill', 'Reship Yes Rebill') 
		) AS DER 
		WHERE DER.SHIPMENT_ID = SH.SHIPMENT_ID 

	/* 
		This is actually kind-of sloppy.  It refers to a function in db Shawn, so that'll be slow
		And it updates ALL returns, not just those that need to be updated.
		Jimmy will clean soon.  
	*/

END