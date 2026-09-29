-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */



	

CREATE PROCEDURE MetaTrans_CloseManifest(
@culture nvarchar(10)
)

AS
	SET NOCOUNT ON;
	Declare @printUPSManifest AS NCHAR(1)
	Declare @printUPSBarcode AS NCHAR(1)
	Declare @warehouse as Nvarchar(50)
	declare @Company AS Nvarchar(50)
	SELECT  @printUPSManifest = SYSTEM_VALUE  FROM SYSTEM_CONFIG_DETAIL WHERE RECORD_TYPE = N'<literal:1>'  AND SYS_KEY=N'<literal:2>'
	SELECT  @printUPSBarcode = SYSTEM_VALUE FROM SYSTEM_CONFIG_DETAIL WHERE RECORD_TYPE = N'<literal:3>'  AND SYS_KEY=N'<literal:4>'	

	SELECT N'<literal:5>' AS N'<literal:6>',
	N'<literal:7>' AS N'<literal:8>', 
	@printUPSManifest AS N'<literal:9>',
	N'<literal:10>' AS N'<literal:11>',
	@printUPSBarcode AS N'<literal:12>',
	N'<literal:13>' AS N'<literal:14>',
	NULL AS N'<literal:15>',
	NULL AS N'<literal:16>'


	

	
	
	

	


	
	



