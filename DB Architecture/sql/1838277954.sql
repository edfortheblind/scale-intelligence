-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RSerialNumber05
	@ShipContNum numeric(9)
AS
	SELECT *
	  FROM SERIAL_NUMBER SN
	 WHERE SN.SHIP_CONT_NUM = @ShipContNum
	   AND SN.TEMPLATE_ID IS NULL
	
	UNION ALL
	
	SELECT SN.*
	  FROM SERIAL_NUMBER SN, SERIAL_NUM_TEMPLATE SNT
	 WHERE SN.SHIP_CONT_NUM = @ShipContNum
	   AND SN.TEMPLATE_ID = SNT.OBJECT_ID
	   AND SNT.SEQUENCE = 0


