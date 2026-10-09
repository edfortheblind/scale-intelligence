/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	14636	| RAB	| 07/21/04	| Created
*/

CREATE PROCEDURE wm_RSerialNumber02
	@SerialNumber nvarchar(50),
	@RecContNum numeric(9)
AS
	-- Only select master serial numbers.
	SELECT *
	  FROM SERIAL_NUMBER
	 WHERE SERIAL_NUMBER = @SerialNumber
	   AND REC_CONT_NUM = @RecContNum
	   AND TEMPLATE_ID is null
	   
	UNION ALL
	
	SELECT SN.*
	  FROM SERIAL_NUMBER SN, SERIAL_NUM_TEMPLATE SNT
	 WHERE SN.SERIAL_NUMBER = @SerialNumber
	   AND SN.REC_CONT_NUM = @RecContNum
	   AND SN.TEMPLATE_ID = SNT.OBJECT_ID
	   AND SNT.SEQUENCE = 0


