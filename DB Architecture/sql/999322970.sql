-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */




   


CREATE PROCEDURE wm_RItem04
	@Item nvarchar(50)
AS
	SELECT * FROM ITEM
	WHERE ITEM = @Item
	AND COMPANY IS NOT NULL

