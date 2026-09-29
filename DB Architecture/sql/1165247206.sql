-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
CREATE FUNCTION [dbo].[ILSStatusToText] 
(
	-- [comment omitted]
	@TRAILING_STS int
)
RETURNS VARchar(30)
AS
BEGIN
	-- [comment omitted]
	DECLARE @Result VARchar(30)

	-- [comment omitted]
	-- [comment omitted]
	
	SET @Result = (
	SELECT CASE @TRAILING_STS
	WHEN 100 THEN '<literal:1>'
	WHEN 200 THEN '<literal:2>'
	WHEN 201 THEN '<literal:3>'
	WHEN 300 THEN '<literal:4>'
	WHEN 301 THEN '<literal:5>'
	WHEN 400 THEN '<literal:6>'
	WHEN 401 THEN '<literal:7>'
	WHEN 600 THEN '<literal:8>'
	WHEN 650 THEN '<literal:9>'
	WHEN 700 THEN '<literal:10>'
	WHEN 800 THEN '<literal:11>'
	WHEN 900 THEN '<literal:12>'
	ELSE cast(@TRAILING_STS AS VARCHAR)
	END
	)
	-- [comment omitted]
	RETURN @Result

END