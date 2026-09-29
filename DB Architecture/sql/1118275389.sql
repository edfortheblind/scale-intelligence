-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */










CREATE PROCEDURE wm_RCompany02
	@Company nvarchar(25)
AS
	 SELECT *
     	   FROM COMPANY
		WHERE COMPANY = @Company AND ACTIVE = N'<literal:1>'


