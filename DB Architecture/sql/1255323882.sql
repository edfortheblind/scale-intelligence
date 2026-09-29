-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RPackingClass01
	@PackingClass nvarchar(25)
AS
	SELECT * FROM PACKING_CLASS
	WHERE PACKING_CLASS = @PackingClass
