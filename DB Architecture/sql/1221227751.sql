-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE MetaTrans_SignBOL @username nvarchar(30), @culture nvarchar(10)
AS

  SELECT
    N'<literal:1>' AS N'<literal:2>',
    N'<literal:3>' AS N'<literal:4>',
	N'<literal:5>' as N'<literal:6>',
	N'<literal:7>' as N'<literal:8>',
	N'<literal:9>' as SignatureBOLTemplate,
    N'<literal:10>' WAREHOUSE,
	N'<literal:11>' AS Company,
	@culture as Culture

	