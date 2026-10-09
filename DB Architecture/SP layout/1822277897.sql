/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	14636	| RAB	| 07/21/04	| Created
*/

CREATE PROCEDURE wm_RSerialNumber04
	@RecContNum numeric(9)
AS
	SELECT *
	  FROM SERIAL_NUMBER SN
	 WHERE SN.REC_CONT_NUM = @RecContNum
	   AND SN.TEMPLATE_ID IS NULL
	
	UNION ALL
	
	SELECT SN.*
	  FROM SERIAL_NUMBER SN, SERIAL_NUM_TEMPLATE SNT
	 WHERE SN.REC_CONT_NUM = @RecContNum
	   AND SN.TEMPLATE_ID = SNT.OBJECT_ID
	   AND SNT.SEQUENCE = 0


