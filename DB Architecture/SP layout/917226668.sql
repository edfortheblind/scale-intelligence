---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	152486	| DN	| 01/22/15	| Created
	180058	| RJR	| 06/29/16	| Added culture parameter.
	214656	| AH	| 10/24/17	| Setting ApptDateTime and EndDateTime to current time if null
	230295	| SHS	| 01/30/19	| Added changes for add new appointment from appointment calendar where receipt is unknown
	230326	| TDA	| 02/19/19	| Add an hour to the End Date when Start/End is not specified
*/
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE MetaTrans_GetRecAppSchedule(
@internalNum numeric(9), @culture nvarchar(10), @warehouse nvarchar(25))

AS
	SET NOCOUNT ON;
	IF @internalNum = 0
	BEGIN
	--company and warehouse are required to check on access
		SELECT 
		N'SCALAR' AS N'EntityType',
		--N'ILS.NHibernate.Entities' AS N'AssemblyName',
		N'ReceiptHeader' AS N'EntityName', 
		0 AS N'InternalReceiptNum', 
		N'' AS N'ReceiptId',
		N'' AS N'Carrier',
		N'' AS N'Company',
		N'' AS N'ShipFrom',
		N'' AS N'ShipFromName',
		N'' AS N'ShipFromAddress1',
		N'' AS N'ShipFromAddress2',
		N'' AS N'ShipFromAddress3',
		N'' AS N'ShipFromCity',
		N'' AS N'ShipFromState',
		N'' AS N'ShipFromPostalCode',
		N'' AS N'ShipFromCountry',
		N'' AS N'TrailerId',
		@warehouse AS N'Warehouse',
		N'' as N'ReceiptCloseDate'
	
	END
	ELSE
	BEGIN 
	--company and warehouse are required to check on access
		SELECT 
		N'SCALAR' AS N'EntityType',
		--N'ILS.NHibernate.Entities' AS N'AssemblyName',
		N'ReceiptHeader' AS N'EntityName', 
		RECEIPT_HEADER.INTERNAL_RECEIPT_NUM AS N'InternalReceiptNum', 
		RECEIPT_HEADER.RECEIPT_ID AS N'ReceiptId',
		RECEIPT_HEADER.CARRIER AS N'Carrier',
		RECEIPT_HEADER.COMPANY AS N'Company',
		RECEIPT_HEADER.SHIP_FROM AS N'ShipFrom',
		RECEIPT_HEADER.SHIP_FROM_NAME AS N'ShipFromName',
		RECEIPT_HEADER.SHIP_FROM_ADDRESS1 AS N'ShipFromAddress1',
		RECEIPT_HEADER.SHIP_FROM_ADDRESS2 AS N'ShipFromAddress2',
		RECEIPT_HEADER.SHIP_FROM_ADDRESS3 AS N'ShipFromAddress3',
		RECEIPT_HEADER.SHIP_FROM_CITY AS N'ShipFromCity',
		RECEIPT_HEADER.SHIP_FROM_STATE AS N'ShipFromState',
		RECEIPT_HEADER.SHIP_FROM_POSTAL_CODE AS N'ShipFromPostalCode',
		RECEIPT_HEADER.SHIP_FROM_COUNTRY AS N'ShipFromCountry',
		RECEIPT_HEADER.TRAILER_ID AS N'TrailerId',
		RECEIPT_HEADER.WAREHOUSE AS N'Warehouse',
		RECEIPT_HEADER.CLOSE_DATE as N'ReceiptCloseDate'
		FROM RECEIPT_HEADER WHERE RECEIPT_HEADER.INTERNAL_RECEIPT_NUM = @internalNum ;
	END
	
	--return empty row if no row exists
	SELECT 
	N'SCALAR' as N'EntityType',
	--N'ILS.NHibernate.Entities' AS N'AssemblyName',
	N'AppointmentSchedule' AS N'EntityName',
	APPOINTMENT_SCHEDULE.OBJECT_ID AS N'ObjectId', 
	APPOINTMENT_SCHEDULE.INTERNAL_RECEIPT_NUM AS N'InternalReceiptNum', 
	APPOINTMENT_SCHEDULE.DOCK AS N'Dock',
	CASE WHEN APPOINTMENT_SCHEDULE.APPT_DATE_TIME is not null THEN APPOINTMENT_SCHEDULE.APPT_DATE_TIME ELSE null END AS N'ApptDateTime',
	CASE WHEN APPOINTMENT_SCHEDULE.END_DATE_TIME is not null THEN APPOINTMENT_SCHEDULE.END_DATE_TIME ELSE null END  AS N'EndDateTime',
	APPOINTMENT_SCHEDULE.USER_DEF1 AS N'UserDef1',
	APPOINTMENT_SCHEDULE.USER_DEF2 AS N'UserDef2',
	APPOINTMENT_SCHEDULE.USER_DEF3 AS N'UserDef3',
	APPOINTMENT_SCHEDULE.USER_DEF4 AS N'UserDef4',
	APPOINTMENT_SCHEDULE.USER_DEF5 AS N'UserDef5',
	APPOINTMENT_SCHEDULE.USER_DEF6 AS N'UserDef6',
	ISNULL(APPOINTMENT_SCHEDULE.USER_DEF7, 0) AS N'UserDef7',
	ISNULL(APPOINTMENT_SCHEDULE.USER_DEF8, 0) AS N'UserDef8'
	FROM (SELECT 1 AS A) A
	LEFT JOIN (
	SELECT  
	APPOINTMENT_SCHEDULE.OBJECT_ID, 
	APPOINTMENT_SCHEDULE.INTERNAL_RECEIPT_NUM, 
	APPOINTMENT_SCHEDULE.DOCK,
	APPOINTMENT_SCHEDULE.APPT_DATE_TIME,
	APPOINTMENT_SCHEDULE.END_DATE_TIME,
	APPOINTMENT_SCHEDULE.USER_DEF1,
	APPOINTMENT_SCHEDULE.USER_DEF2,
	APPOINTMENT_SCHEDULE.USER_DEF3,
	APPOINTMENT_SCHEDULE.USER_DEF4,
	APPOINTMENT_SCHEDULE.USER_DEF5,
	APPOINTMENT_SCHEDULE.USER_DEF6,
	ISNULL(APPOINTMENT_SCHEDULE.USER_DEF7, 0) as N'USER_DEF7',
	ISNULL(APPOINTMENT_SCHEDULE.USER_DEF8, 0) as N'USER_DEF8'
	FROM APPOINTMENT_SCHEDULE WHERE INTERNAL_RECEIPT_NUM = @internalNum) APPOINTMENT_SCHEDULE ON 1=1;
