-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RSerialNumTemplate02
	@ObjectId numeric(9)
AS
	SELECT *
	  FROM SERIAL_NUM_TEMPLATE
	 WHERE OBJECT_ID = @ObjectId


