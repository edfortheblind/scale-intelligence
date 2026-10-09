/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	14875	| LJM	| 08/26/04	| created
	135689	| JY	| 02/17/14	| Modified the table of upload and added new filter.
	138673	| JY	| 03/14/14	| Removed filter.
    134894  | SHS   | 05/22/14  | Removed Serial_Number_View and also Interface_Link_Id as it is not used
*/

CREATE PROCEDURE wm_RSerialNumber07
	@ObjectId numeric(9)
AS
SET NOCOUNT ON;

	SELECT SN.*
	  FROM SERIAL_NUMBER SN
	 WHERE SN.OBJECT_ID = @ObjectId
	 
	 UNION ALL
	 
	 SELECT ASN.*
	  FROM AR_SERIAL_NUMBER ASN
	 WHERE ASN.OBJECT_ID = @ObjectId