-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RSerialNumTemplate04
	@Name nvarchar(25),
	@Sequence numeric(3)
AS
	SELECT *
	  FROM SERIAL_NUM_TEMPLATE
	 WHERE NAME = @name
	   AND SEQUENCE = @sequence ;


