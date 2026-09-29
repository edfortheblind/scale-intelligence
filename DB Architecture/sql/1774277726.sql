-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RSerialNumber01
	@ObjectId numeric(9)
AS
	SELECT *
	  FROM SERIAL_NUMBER
	 WHERE OBJECT_ID = @ObjectId


