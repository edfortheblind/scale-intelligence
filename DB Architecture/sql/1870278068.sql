-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */








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