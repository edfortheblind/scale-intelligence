/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	14875	| LJM	| 08/26/04	| created
    134894  | SHS   | 05/22/14  | Removed Serial_Number_View
*/


CREATE PROCEDURE wm_RSerialNumber08
	@SerialNumber nvarchar(50),
	@RecContNum numeric(9)
AS
SET NOCOUNT ON;

	-- Only select master serial numbers.
	SELECT *
	  FROM SERIAL_NUMBER
	 WHERE SERIAL_NUMBER = @SerialNumber
	   AND REC_CONT_NUM = @RecContNum
	   AND TEMPLATE_ID is null
	 
	 UNION ALL
	 
	 SELECT *
	  FROM AR_SERIAL_NUMBER
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
	
	UNION ALL
	
	SELECT ASN.*
	  FROM AR_SERIAL_NUMBER ASN, SERIAL_NUM_TEMPLATE SNT
	 WHERE ASN.SERIAL_NUMBER = @SerialNumber
	   AND ASN.REC_CONT_NUM = @RecContNum
	   AND ASN.TEMPLATE_ID = SNT.OBJECT_ID
	   AND SNT.SEQUENCE = 0

