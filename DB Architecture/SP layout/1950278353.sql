/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	16023	| KMD	| 01/13/05	| Created
*/

CREATE PROCEDURE wm_RSerialNumber12
	@LocInvNum numeric(9)
AS
	SELECT *
	  FROM SERIAL_NUMBER
	 WHERE LOC_INV_NUM = @LocInvNum


