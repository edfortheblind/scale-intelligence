-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]

CREATE FUNCTION [dbo].[ILSTransactionTypeToText_fn] 
(
	@status INT
)
RETURNS VARCHAR(30)
AS
BEGIN

	DECLARE @Result VARCHAR(30)

	SET @Result = (
			SELECT CASE @status
				WHEN 10 THEN '<literal:1>'
				WHEN 20 THEN '<literal:2>'
				WHEN 30 THEN '<literal:3>'
				WHEN 40 THEN '<literal:4>'
				WHEN 50 THEN '<literal:5>'
				WHEN 60 THEN '<literal:6>'
				WHEN 70 THEN '<literal:7>'
				WHEN 80 THEN '<literal:8>'
				WHEN 90 THEN '<literal:9>'
				WHEN 100 THEN '<literal:10>'
				WHEN 110 THEN '<literal:11>'
				WHEN 120 THEN '<literal:12>'
				WHEN 130 THEN '<literal:13>'
				WHEN 140 THEN '<literal:14>'
				WHEN 150 THEN '<literal:15>'
				WHEN 160 THEN '<literal:16>'
				WHEN 165 THEN '<literal:17>'
				WHEN 170 THEN '<literal:18>'
				WHEN 180 THEN '<literal:19>'
				WHEN 190 THEN '<literal:20>'
				WHEN 200 THEN '<literal:21>'
				WHEN 210 THEN '<literal:22>'
				WHEN 220 THEN '<literal:23>'
				WHEN 230 THEN '<literal:24>'
				WHEN 240 THEN '<literal:25>'
				WHEN 250 THEN '<literal:26>'
				WHEN 260 THEN '<literal:27>'
				WHEN 270 THEN '<literal:28>'
				WHEN 280 THEN '<literal:29>'
				WHEN 290 THEN '<literal:30>'
				WHEN 300 THEN '<literal:31>'
				WHEN 310 THEN '<literal:32>'
				WHEN 320 THEN '<literal:33>'
				WHEN 330 THEN '<literal:34>'
				WHEN 340 THEN '<literal:35>'
				WHEN 350 THEN '<literal:36>'
				WHEN 360 THEN '<literal:37>'
				WHEN 370 THEN '<literal:38>'
				WHEN 380 THEN '<literal:39>'
				WHEN 390 THEN '<literal:40>'
				WHEN 400 THEN '<literal:41>'
				WHEN 410 THEN '<literal:42>'
				WHEN 420 THEN '<literal:43>'
				WHEN 430 THEN '<literal:44>'
				WHEN 440 THEN '<literal:45>'
				WHEN 450 THEN '<literal:46>'
				ELSE CAST(@status AS VARCHAR)
				END
		)

	RETURN @Result

END