-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */




   

CREATE PROCEDURE wm_RItem03
	@Item nvarchar(50)
AS
	SELECT * FROM ITEM
	WHERE ITEM = @Item
	AND COMPANY IN(
		SELECT COMPANY FROM ITEM
		WHERE ITEM = @Item
		GROUP BY COMPANY
		HAVING COUNT(DISTINCT COMPANY) = 1)

