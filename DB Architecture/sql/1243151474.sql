-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
CREATE PROCEDURE TRAV_SetShipByAndDeliverByForReturns 
	-- [comment omitted]

AS
BEGIN
	-- [comment omitted]
	-- [comment omitted]
	SET NOCOUNT ON;

    -- [comment omitted]
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
			WHERE SH.CUSTOMER_CATEGORY2 IN ('<literal:1>', '<literal:2>') 
		) AS DER 
		WHERE DER.SHIPMENT_ID = SH.SHIPMENT_ID 

	/* [comment omitted] */





END