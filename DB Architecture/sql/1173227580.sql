-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
-- [comment omitted]
-- [comment omitted]


/* [comment omitted] */





-- [comment omitted]


CREATE PROCEDURE MetaTrans_ShipmentLevelManifesting(
@internalNum numeric(9), @culture nvarchar(10))

AS
	SET NOCOUNT ON;

	-- [comment omitted]
	SELECT 
		N'<literal:1>' AS N'<literal:2>',
		N'<literal:3>' AS N'<literal:4>', 
		SHV.INTERNAL_SHIPMENT_NUM AS N'<literal:5>', 
		SHV.SHIPMENT_ID AS N'<literal:6>',
		SHV.TOTAL_CONTAINERS AS N'<literal:7>', 
		SHV.TOTAL_WEIGHT AS N'<literal:8>', 
		SHV.WEIGHT_UM AS N'<literal:9>', 
		SHV.SHIP_TO AS N'<literal:10>', 
		SHV.SHIP_TO_NAME AS N'<literal:11>', 
		SHV.SHIP_TO_ATTENTION_TO AS N'<literal:12>', 
		SHV.SHIP_TO_ADDRESS1 AS N'<literal:13>', 
		SHV.SHIP_TO_ADDRESS2 AS N'<literal:14>', 
		SHV.SHIP_TO_ADDRESS3 AS N'<literal:15>', 
		SHV.SHIP_TO_CITY AS N'<literal:16>', 
		SHV.SHIP_TO_STATE AS N'<literal:17>', 
		SHV.SHIP_TO_POSTAL_CODE AS N'<literal:18>', 
		SHV.SHIP_TO_COUNTRY AS N'<literal:19>', 
		SHV.SHIP_TO_PHONE_NUM AS N'<literal:20>', 
		SHV.SHIP_TO_FAX_NUM AS N'<literal:21>', 
		SHV.SHIP_TO_EMAIL_ADDRESS AS N'<literal:22>', 
		SHV.COMPANY AS N'<literal:23>', 
		SHV.WAREHOUSE AS N'<literal:24>'
	FROM 
		SHIPMENT_HEADER_VIEW SHV 
	WHERE 
		SHV.INTERNAL_SHIPMENT_NUM = @internalNum;