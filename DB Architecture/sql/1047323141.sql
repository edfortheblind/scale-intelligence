-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





   


CREATE PROCEDURE wm_RItem07
	@Item nvarchar(50),
	@Company nvarchar(25)
AS
	SELECT * FROM ITEM
	WHERE ITEM = @Item
	AND (COMPANY = @Company OR COMPANY IS NULL)

