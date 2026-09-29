-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */










CREATE PROCEDURE SHP_InsighInPoolDetailPaneData(@internalShipmentNum numeric(9), @culture nvarchar(10))  
AS 
BEGIN

SELECT top 1 N'<literal:1>' AS SCALAR,
    SHIPMENT_ID AS ShipmentID,
	INTERNAL_SHIPMENT_NUM AS InternalShipmentNum,
    SHIP_TO_NAME AS ShipTo,
    dbo.STSfn_RtrvStsName(N'<literal:2>' ,TRAILING_STS) AS TrailingSts ,
    dbo.STSfn_RtrvStsName (N'<literal:3>' ,LEADING_STS) AS LeadingSts ,
	TOTAL_LINES as SummaryDetails,
	IN_DELETION as InDeletion, 
	WAREHOUSE as WAREHOUSE
FROM SHIPMENT_HEADER_VIEW 
WHERE INTERNAL_SHIPMENT_NUM = @internalShipmentNum;
END