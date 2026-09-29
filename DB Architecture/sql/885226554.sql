-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */








CREATE PROCEDURE MetaTrans_GetNewWave(
@warehouse nvarchar(25),
@culture nvarchar(200),
@username nvarchar(30),
@transfer nvarchar(1) = N'<literal:1>'
)

AS
	SET NOCOUNT ON;				
	SELECT N'<literal:2>' AS N'<literal:3>',
	N'<literal:4>' AS N'<literal:5>',
	@warehouse as N'<literal:6>',	
	N'<literal:7>' as N'<literal:8>'	,
	N'<literal:9>' as N'<literal:10>',
	N'<literal:11>' as N'<literal:12>',
	N'<literal:13>' as N'<literal:14>',
	N'<literal:15>' as N'<literal:16>',
	@transfer as N'<literal:17>';