-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RLocation04
	@dock nvarchar(25),
	@whs nvarchar(25)
AS
	SELECT *
	FROM LOCATION
	WHERE LOCATION = @dock AND LOCATION_CLASS = N'<literal:1>' AND WAREHOUSE = @whs ;


