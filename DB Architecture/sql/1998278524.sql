-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RSerialNumTemplate03
	@Name nvarchar(25),
	@Description nvarchar(50)
AS
	SELECT *
	  FROM SERIAL_NUM_TEMPLATE
	 WHERE NAME = @Name
	   AND DESCRIPTION = @Description


