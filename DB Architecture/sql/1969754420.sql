-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE PROCEDURE SpGetBuildVersion
AS BEGIN
	DECLARE @BUILD NVARCHAR(50)
	SELECT @BUILD = BUILD FROM VERSION
	SELECT SUBSTRING(@BUILD,0, CHARINDEX(N'<literal:1>',@BUILD)) + N'<literal:2>';
END