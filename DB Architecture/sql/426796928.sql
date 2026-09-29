-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RVasActivity01
	@name nvarchar(50)
			
AS
	
		SELECT * FROM VAS_ACTIVITY
		WHERE NAME = @name;
	
