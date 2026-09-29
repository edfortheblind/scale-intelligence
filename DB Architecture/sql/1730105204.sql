-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





-- [comment omitted]



CREATE PROCEDURE wm_RTransactionHistory01
AS

	SELECT *
	FROM TRANSACTION_HISTORY
	WHERE UPLOAD_INTERFACE_BATCH IS NULL
	AND TRANSACTION_TYPE IN (
		SELECT IDENTIFIER
		FROM GENERIC_CONFIG_DETAIL
		WHERE RECORD_TYPE = N'<literal:1>'
		AND SYS2VALUE = N'<literal:2>')
	AND (
		( TRANSACTION_TYPE NOT LIKE  N'<literal:3>'  +N'<literal:4>'
                  AND TRANSACTION_TYPE NOT LIKE N'<literal:5>'+N'<literal:6>'
                  AND TRANSACTION_TYPE NOT LIKE N'<literal:7>'+N'<literal:8>')


		OR (
			REFERENCE_TYPE IN (
				SELECT ADJUSTMENT_TYPE
				FROM ADJUSTMENT_TYPE
				WHERE INCLUDE_IN_INTERFACE_UPLOAD = N'<literal:9>')));