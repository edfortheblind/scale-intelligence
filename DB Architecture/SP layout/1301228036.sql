-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	204146  | DN    | 06/06/17  | Created
	259322	| VS	| 10/07/20	| Added condition to check against shipment_level so that if duplicate internal_num comes in SHIPMENT_ACCESSORIALS table for both shipment and container level accessorial,
								  then it can distinguish between them.
*/
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE MetaTrans_ViewAccessorials(
@username nvarchar(30),
@culture nvarchar(10),
@internalNum int,
@internalNumType nvarchar(100))
AS

if(UPPER(@internalNumType) = N'SHIPMENT')
BEGIN
	--view model
	SELECT 
	N'SCALAR' AS N'EntityType',
    N'AccessorialsViewModel' AS N'EntityName',
	N'/scale/dist/accessorials/accessorialAssign.component.html' as AccessorialsTemplate,
	N'/scale/dist/accessorials/editAccessorials.component.html' as EditAccessorialsTemplate,
	N'/scale/dist/accessorials/editAccessorialsChild.component.html' as EditAccessorialsSubTemplate,		
	SHIPMENT_ID as Id, 
	ISNULL(CARRIER, N'') as Carrier, 
	ISNULL(CARRIER_SERVICE, N'') as CarrierService, 
	ISNULL(COMPANY, N'') as Company, 
	ISNULL((select DESCRIPTION from GENERIC_CONFIG_DETAIL where RECORD_TYPE=N'FR TERMS' and IDENTIFIER=FREIGHT_TERMS), N'') as FreightTerms, 
	@internalNum as InternalNum,
	@internalNumType as InternalNumType,
	WAREHOUSE as Warehouse
	FROM SHIPMENT_HEADER WHERE INTERNAL_SHIPMENT_NUM=@internalNum;
	
	--grid data
	IF EXISTS(SELECT TOP 1 1 FROM SHIPMENT_ACCESSORIALS WHERE INTERNAL_NUM = @internalNum)
	BEGIN
		SELECT 
		N'TABLE_Accessorials' AS N'EntityType',
		ROW_NUMBER() OVER (ORDER BY (select N'A')) AS N'RowId',
		N'false' as N'Deleted',
		SHIPMENT_ACCESSORIALS.OBJECT_ID as ObjectId,
		ACCESSORIAL_DETAIL.ACCESSORIAL_CODE as Code, 
		ACCESSORIAL_DETAIL.ACCESSORIAL_SUB_CODE AS SubCode, 
		ACCESSORIAL_HEADER.DESCRIPTION AS HeaderDesc,
		ACCESSORIAL_DETAIL.DESCRIPTION AS DetailDesc,
		ACCESSORIAL_DETAIL.OBJECT_ID AS DetailObjectId,
		CASE WHEN (UPPER(SHIPMENT_ACCESSORIALS.VALUE) = N'TRUE' OR UPPER(SHIPMENT_ACCESSORIALS.VALUE) = N'FALSE' )THEN UPPER(SHIPMENT_ACCESSORIALS.VALUE) ELSE SHIPMENT_ACCESSORIALS.VALUE END AS Value
		FROM 
		ACCESSORIAL_HEADER 
		INNER JOIN
		ACCESSORIAL_DETAIL ON ACCESSORIAL_HEADER.OBJECT_ID = ACCESSORIAL_DETAIL.HEADER_ID
		INNER JOIN 
		SHIPMENT_ACCESSORIALS ON ACCESSORIAL_DETAIL.OBJECT_ID = SHIPMENT_ACCESSORIALS.ACCESSORIAL_DETAIL_ID
		WHERE INTERNAL_NUM = @internalNum AND SHIPMENT_LEVEL= N'Y'
		GROUP BY ACCESSORIAL_DETAIL.ACCESSORIAL_CODE, ACCESSORIAL_DETAIL.ACCESSORIAL_SUB_CODE,ACCESSORIAL_HEADER.DESCRIPTION, ACCESSORIAL_DETAIL.DESCRIPTION, SHIPMENT_ACCESSORIALS.VALUE, ACCESSORIAL_DETAIL.OBJECT_ID, SHIPMENT_ACCESSORIALS.OBJECT_ID
	END
END
ELSE
BEGIN
	--view model
	SELECT 
	N'SCALAR' AS N'EntityType',
    N'AccessorialsViewModel' AS N'EntityName',
	N'/scale/dist/accessorials/accessorialAssign.component.html' as AccessorialsTemplate,	
	N'/scale/dist/accessorials/editAccessorials.component.html' as EditAccessorialsTemplate,	
	N'/scale/dist/accessorials/editAccessorialsChild.component.html' as EditAccessorialsSubTemplate,	
	SHIPPING_CONTAINER.CONTAINER_ID as Id, 
	ISNULL(SHIPMENT_HEADER.CARRIER, N'') as Carrier, 
	ISNULL(SHIPMENT_HEADER.CARRIER_SERVICE, N'') as CarrierService, 
	ISNULL(SHIPMENT_HEADER.COMPANY, N'') as Company, 
	ISNULL((select DESCRIPTION from GENERIC_CONFIG_DETAIL where RECORD_TYPE=N'FR TERMS' and IDENTIFIER=SHIPMENT_HEADER.FREIGHT_TERMS), N'') as FreightTerms, 
	@internalNum as InternalNum,
	@internalNumType as InternalNumType,
	SHIPMENT_HEADER.WAREHOUSE as Warehouse
	FROM SHIPPING_CONTAINER INNER JOIN SHIPMENT_HEADER ON SHIPPING_CONTAINER.INTERNAL_SHIPMENT_NUM = SHIPMENT_HEADER.INTERNAL_SHIPMENT_NUM
	WHERE INTERNAL_CONTAINER_NUM=@internalNum;
	
	--grid data
	IF EXISTS(SELECT TOP 1 1 FROM SHIPMENT_ACCESSORIALS WHERE INTERNAL_NUM = @internalNum)
	BEGIN
		SELECT 
		N'TABLE_Accessorials' AS N'EntityType',
		ROW_NUMBER() OVER (ORDER BY (select N'A')) AS N'RowId',
		N'false' as N'Deleted',
		SHIPMENT_ACCESSORIALS.OBJECT_ID as ObjectId,
		ACCESSORIAL_DETAIL.ACCESSORIAL_CODE as Code, 
		ACCESSORIAL_DETAIL.ACCESSORIAL_SUB_CODE AS SubCode, 
		ACCESSORIAL_HEADER.DESCRIPTION AS HeaderDesc,
		ACCESSORIAL_DETAIL.DESCRIPTION AS DetailDesc,
		ACCESSORIAL_DETAIL.OBJECT_ID AS DetailObjectId,
		CASE WHEN (UPPER(SHIPMENT_ACCESSORIALS.VALUE) = N'TRUE' OR UPPER(SHIPMENT_ACCESSORIALS.VALUE) = N'FALSE' )THEN UPPER(SHIPMENT_ACCESSORIALS.VALUE) ELSE SHIPMENT_ACCESSORIALS.VALUE END AS Value
		FROM 
		ACCESSORIAL_HEADER 
		INNER JOIN
		ACCESSORIAL_DETAIL ON ACCESSORIAL_HEADER.OBJECT_ID = ACCESSORIAL_DETAIL.HEADER_ID
		INNER JOIN
		SHIPMENT_ACCESSORIALS ON ACCESSORIAL_DETAIL.OBJECT_ID = SHIPMENT_ACCESSORIALS.ACCESSORIAL_DETAIL_ID
		WHERE INTERNAL_NUM = @internalNum AND SHIPMENT_LEVEL= N'N'
		GROUP BY ACCESSORIAL_DETAIL.ACCESSORIAL_CODE, ACCESSORIAL_DETAIL.ACCESSORIAL_SUB_CODE, ACCESSORIAL_HEADER.DESCRIPTION, ACCESSORIAL_DETAIL.DESCRIPTION, SHIPMENT_ACCESSORIALS.VALUE, ACCESSORIAL_DETAIL.OBJECT_ID, SHIPMENT_ACCESSORIALS.OBJECT_ID
	END
END
