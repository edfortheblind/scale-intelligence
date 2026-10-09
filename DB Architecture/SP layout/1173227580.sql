---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------


/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	182250	| RJR	| 07/08/16	| Created
	191074	| DN	| 01/23/17	| Updated parameter types
*/
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE MetaTrans_ShipmentLevelManifesting(
@internalNum numeric(9), @culture nvarchar(10))

AS
	SET NOCOUNT ON;

	-- please note company and warehouse are required
	SELECT 
		N'SCALAR' AS N'EntityType',
		N'ShipManifest' AS N'EntityName', 
		SHV.INTERNAL_SHIPMENT_NUM AS N'InternalNum', 
		SHV.SHIPMENT_ID AS N'ShipmentId',
		SHV.TOTAL_CONTAINERS AS N'TotalContainers', 
		SHV.TOTAL_WEIGHT AS N'TotalWeight', 
		SHV.WEIGHT_UM AS N'WeightUm', 
		SHV.SHIP_TO AS N'ShipTo', 
		SHV.SHIP_TO_NAME AS N'ShipToName', 
		SHV.SHIP_TO_ATTENTION_TO AS N'ShipToAttentionTo', 
		SHV.SHIP_TO_ADDRESS1 AS N'ShipToAddress1', 
		SHV.SHIP_TO_ADDRESS2 AS N'ShipToAddress2', 
		SHV.SHIP_TO_ADDRESS3 AS N'ShipToAddress3', 
		SHV.SHIP_TO_CITY AS N'ShipToCity', 
		SHV.SHIP_TO_STATE AS N'ShipToState', 
		SHV.SHIP_TO_POSTAL_CODE AS N'ShipToPostalCode', 
		SHV.SHIP_TO_COUNTRY AS N'ShipToCountry', 
		SHV.SHIP_TO_PHONE_NUM AS N'ShipToPhoneNum', 
		SHV.SHIP_TO_FAX_NUM AS N'ShipToFaxNum', 
		SHV.SHIP_TO_EMAIL_ADDRESS AS N'ShipToEmailAddress', 
		SHV.COMPANY AS N'Company', 
		SHV.WAREHOUSE AS N'Warehouse'
	FROM 
		SHIPMENT_HEADER_VIEW SHV 
	WHERE 
		SHV.INTERNAL_SHIPMENT_NUM = @internalNum;