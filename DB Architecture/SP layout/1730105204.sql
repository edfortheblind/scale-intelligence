/*
	Task 	| Programmer	| Date   	| Description
	--------|---------------|---------------------------------------
	14660	| LJM		| 2004.05.20	| created
	17275	| SKM		| 2005.09.09	| Constant values picked from ReportingConstants
*/
-- #DEFINE WMW.Reporting.dll Manh.WMW.Reporting.General.ReportingConstants ReportingConstants;



CREATE PROCEDURE wm_RTransactionHistory01
AS

	SELECT *
	FROM TRANSACTION_HISTORY
	WHERE UPLOAD_INTERFACE_BATCH IS NULL
	AND TRANSACTION_TYPE IN (
		SELECT IDENTIFIER
		FROM GENERIC_CONFIG_DETAIL
		WHERE RECORD_TYPE = N'HIST TR TY'
		AND SYS2VALUE = N'Y')
	AND (
		( TRANSACTION_TYPE NOT LIKE  N'40'  +N'%'
                  AND TRANSACTION_TYPE NOT LIKE N'50'+N'%'
                  AND TRANSACTION_TYPE NOT LIKE N'60'+N'%')


		OR (
			REFERENCE_TYPE IN (
				SELECT ADJUSTMENT_TYPE
				FROM ADJUSTMENT_TYPE
				WHERE INCLUDE_IN_INTERFACE_UPLOAD = N'Y')));