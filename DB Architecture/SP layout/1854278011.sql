/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	14875	| LJM	| 08/26/04	| created
    134894  | SHS   | 05/22/14  | Removed Serial_Number_View
*/

CREATE PROCEDURE wm_RSerialNumber06
	@RecContNum numeric(9)
AS
SET NOCOUNT ON;

	SELECT *
	  FROM SERIAL_NUMBER SN
	 WHERE SN.REC_CONT_NUM = @RecContNum
	   AND SN.TEMPLATE_ID IS NULL

	UNION ALL 

	SELECT *
	  FROM AR_SERIAL_NUMBER ASN
	 WHERE ASN.REC_CONT_NUM = @RecContNum
	   AND ASN.TEMPLATE_ID IS NULL
	   

	UNION ALL
	

	SELECT SN.*
	  FROM SERIAL_NUMBER SN, SERIAL_NUM_TEMPLATE SNT
	 WHERE SN.REC_CONT_NUM = @RecContNum
	   AND SN.TEMPLATE_ID = SNT.OBJECT_ID
	   AND SNT.SEQUENCE = 0

	 UNION ALL

	 SELECT ASN.*
	  FROM AR_SERIAL_NUMBER ASN, SERIAL_NUM_TEMPLATE SNT
	 WHERE ASN.REC_CONT_NUM = @RecContNum
	   AND ASN.TEMPLATE_ID = SNT.OBJECT_ID
	   AND SNT.SEQUENCE = 0
       