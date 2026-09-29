-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE wm_RSerialNumTemplate01
	@Name nvarchar(25)
AS
	SELECT TOP 1 NAME
	  FROM SERIAL_NUM_TEMPLATE
	 WHERE NAME = @Name
           AND ACTIVE = N'<literal:1>'
	 ORDER BY NAME


