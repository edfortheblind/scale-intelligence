-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RSerialNumber12
	@LocInvNum numeric(9)
AS
	SELECT *
	  FROM SERIAL_NUMBER
	 WHERE LOC_INV_NUM = @LocInvNum


