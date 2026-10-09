/*
	Mod Number	| Programmer	| Date   	| Modification Description
	204183		| KSS		    | 06/30/17	| Created.
	
*/	

CREATE PROCEDURE MetaTrans_CloseManifest(
@culture nvarchar(10)
)

AS
	SET NOCOUNT ON;
	Declare @printUPSManifest AS NCHAR(1)
	Declare @printUPSBarcode AS NCHAR(1)
	Declare @warehouse as Nvarchar(50)
	declare @Company AS Nvarchar(50)
	SELECT  @printUPSManifest = SYSTEM_VALUE  FROM SYSTEM_CONFIG_DETAIL WHERE RECORD_TYPE = N'Gen Rating'  AND SYS_KEY=N'Print UPS Manifest'
	SELECT  @printUPSBarcode = SYSTEM_VALUE FROM SYSTEM_CONFIG_DETAIL WHERE RECORD_TYPE = N'Gen Rating'  AND SYS_KEY=N'Print UPS Barcode Label'	

	SELECT N'SCALAR' AS N'EntityType',
	N'CloseManifest' AS N'EntityName', 
	@printUPSManifest AS N'PrintUPSManifest',
	N'Y' AS N'TransmitManifest',
	@printUPSBarcode AS N'PrintUPSBarCode',
	N'' AS N'IneligibleContainers',
	NULL AS N'Warehouse',
	NULL AS N'Company'


	

	
	
	

	


	
	



