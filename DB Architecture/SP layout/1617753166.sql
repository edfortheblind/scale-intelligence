/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	184494	| NRJ	| 08/16/16	| Created
	186835	| RJR	| 09/13/16	| Open screens in current tab.
	186888	| NRJ	| 09/21/16	| Removed containers and shipping loads information.
	186891	| SD	| 12/19/16	| Reformat the detail pane.
	195660	| RJR	| 01/11/17	| Added warehouse.
*/


CREATE PROCEDURE SHP_InsighInPoolDetailPaneData(@internalShipmentNum numeric(9), @culture nvarchar(10))  
AS 
BEGIN

SELECT top 1 N'SCALAR' AS SCALAR,
    SHIPMENT_ID AS ShipmentID,
	INTERNAL_SHIPMENT_NUM AS InternalShipmentNum,
    SHIP_TO_NAME AS ShipTo,
    dbo.STSfn_RtrvStsName(N'outbound' ,TRAILING_STS) AS TrailingSts ,
    dbo.STSfn_RtrvStsName (N'outbound' ,LEADING_STS) AS LeadingSts ,
	TOTAL_LINES as SummaryDetails,
	IN_DELETION as InDeletion, 
	WAREHOUSE as WAREHOUSE
FROM SHIPMENT_HEADER_VIEW 
WHERE INTERNAL_SHIPMENT_NUM = @internalShipmentNum;
END