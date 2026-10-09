
 --==============================================================================
 --Author:		Jason Franklin
 --Create date: 2016-12-3
 --Description:	SCALE 2010-2016 upgrade; migration from Crystal Reports to SSRS
 --==============================================================================
CREATE PROCEDURE [dbo].[RPT_Shippers_Export_Declaration] 

(
@INTERNAL_SHIPMENT_NUM INT 
)

AS
BEGIN

SET NOCOUNT ON;

	SELECT 
		  N'fld_01a_1name'			= C.NAME
		, N'fld_01a_2add1'			= C.ADDRESS1
		, N'fld_01a_3add2'			= C.ADDRESS2
		, N'fld_01a_4add3'			= C.ADDRESS3
		, N'fld_01a_5city'			= C.CITY
		, N'fld_01a_6state'			= C.[STATE]
		, N'fld_01a_7zip'			= C.POSTAL_CODE
		, N'fld_01b'				= '74-1143060'
		, N'fld_01c_1related'		= CASE WHEN SH.PARTIES IS NULL THEN NULL ELSE 'X' END
		, N'fld_01c_2nonrelated'	= CASE WHEN SH.PARTIES IS NULL THEN 'X' ELSE NULL END
		, N'fld_02'					= CONVERT(NVARCHAR(10),GETDATE(),101)
		, N'fld_03'					= NULL
		, N'fld_04a_1name'			= SH.SHIP_TO_NAME
		, N'fld_04a_2add1'			= SH.SHIP_TO_ADDRESS1
		, N'fld_04a_3add2'			= SH.SHIP_TO_ADDRESS2
		, N'fld_04a_4city'			= SH.SHIP_TO_CITY
		, N'fld_04a_5state'			= SH.SHIP_TO_STATE
		, N'fld_04a_6zip'			= SH.SHIP_TO_POSTAL_CODE
		, N'fld_04a_7country'		= SH.SHIP_TO_COUNTRY
		, N'fld_04b_1name'			= SH.INTERMEDIATE_NAME
		, N'fld_04b_2add1'			= SH.INTERMEDIATE_ADDRESS1
		, N'fld_04b_3add2'			= SH.INTERMEDIATE_ADDRESS2
		, N'fld_04b_4city'			= SH.INTERMEDIATE_CITY
		, N'fld_04b_5state'			= SH.INTERMEDIATE_STATE
		, N'fld_04b_6zip'			= SH.INTERMEDIATE_POSTAL_CODE
		, N'fld_04b_7country'		= SH.INTERMEDIATE_COUNTRY
		, N'fld_05a_1name'			= NULL
		, N'fld_05a_2add1'			= NULL
		, N'fld_05a_3add2'			= NULL
		, N'fld_05a_4city'			= NULL
		, N'fld_05a_5state'			= NULL
		, N'fld_05a_6zip'			= NULL
		, N'fld_05a_7country'		= NULL
		, N'fld_05b'				= NULL
		, N'fld_06'					= C.[STATE]
		, N'fld_07'					= SH.SHIP_TO_COUNTRY
		, N'fld_08'					= SH.LOADING_PIER
		, N'fld_09'					= 'AIRCRAFT'
		, N'fld_10'					= SH.CARRIER
		, N'fld_11'					= 'LOUISVILLE'
		, N'fld_12'					= SH.UNLOADING_PORT
		, N'fld_13_1yes'			= CASE WHEN SH.CONTAINERIZED IS NULL THEN NULL ELSE 'X' END
		, N'fld_13_2no'				= CASE WHEN SH.CONTAINERIZED IS NULL THEN 'X' ELSE NULL END
		, N'fld_14'					= NULL
		, N'fld_15'					= SH.BOL_NUM_ALPHA
		, N'fld_16'					= NULL
		, N'fld_17_1yes'			= NULL --CASE WHEN ? IS NULL THEN NULL ELSE 'X' END
		, N'fld_17_2no'				= 'X'  --CASE WHEN ? IS NULL THEN 'X' ELSE NULL END
		, N'fld_18'					= 'NO'
		, N'fld_19_1yes'			= NULL --CASE WHEN ? IS NULL THEN NULL ELSE 'X' END
		, N'fld_19_2no'				= NULL  --CASE WHEN ? IS NULL THEN 'X' ELSE NULL END
		, N'fld_20'					= SD.INTERNAL_SHIPMENT_NUM
		, N'fld_21'					= CASE WHEN SD.COUNTRY_OF_ORIGIN = NULL THEN 'F'
											ELSE (CASE SD.COUNTRY_OF_ORIGIN WHEN 'US' THEN 'D'
													ELSE 'F' 
													END)
											END
		, N'fld_22_1item_desc'		= SD.ITEM_DESC
		, N'fld_22_2harm_desc'		= SD.HARMONIZED_DESC
		, N'fld_22_3harm_code'		= SD.HARMONIZED_CODE
		, N'fld_23'					= CAST(SD.TOTAL_QTY As INT)
		, N'fld_24'					= SD.ITEM_WEIGHT
		, N'fld_25'					= NULL
		, N'fld_26'					= CAST((SD.TOTAL_QTY * SD.ITEM_NET_PRICE) As DECIMAL(9,2))
		, N'fld_27'					= '74-1143060'
		, N'fld_28'					= 'EAR99'
		, N'fld_29'					= NULL
		, N'fld_30'					= NULL
		, N'fld_30_1signature'		= NULL
		, N'fld_30_2title'			= 'SHIPPER'
		, N'fld_30_3date'			= CONVERT(NVARCHAR(10),GETDATE(),101)
		, N'fld_30_4phone'			= C.PHONE_NUM
		, N'fld_30_4email'			= C.EMAIL_ADDRESS
		--, SH.AUTHORIZED_EMPL_NAME
		--, SD.WEIGHT_UM
		--, WAREHOUSE.[DESCRIPTION]
		--, WAREHOUSE.ADDRESS1
		--, WAREHOUSE.ADDRESS2
		--, WAREHOUSE.CITY
		--, WAREHOUSE.[STATE]
		--, WAREHOUSE.POSTAL_CODE
		--, WAREHOUSE.EMAIL_ADDRESS
		--, WAREHOUSE.PHONE_NUM
		--, SD.USER_DEF4
	FROM   ((dbo.SHIPMENT_HEADER SH  WITH(NOLOCK)
				  INNER JOIN dbo.SHIPMENT_DETAIL SD WITH(NOLOCK)
						 ON SH.INTERNAL_SHIPMENT_NUM = SD.INTERNAL_SHIPMENT_NUM) 
			LEFT OUTER JOIN dbo.COMPANY C WITH(NOLOCK)
				   ON SH.COMPANY = C.COMPANY) 
			INNER JOIN dbo.WAREHOUSE WAREHOUSE 
				   ON SH.warehouse=WAREHOUSE.warehouse
	WHERE  SH.INTERNAL_SHIPMENT_NUM = @INTERNAL_SHIPMENT_NUM
	ORDER BY SD.INTERNAL_SHIPMENT_NUM;

SET NOCOUNT OFF;

END;