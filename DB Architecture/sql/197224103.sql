-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





-- [comment omitted]
CREATE PROCEDURE MarkLocationforReplenishment(@location nvarchar(25) , @warehouse nvarchar(25), @userName nvarchar(30), @success nvarchar(2000) output, @error nvarchar(2000) output)  
AS
BEGIN
	DECLARE @RPLN_EVALUATION nchar(1)
	DECLARE @REAL_TIME_RPLN nchar(1)
	DECLARE @HISTORYMESSAGE nvarchar(2000)
	DECLARE @PARAMETERLIST nvarchar(2000)
	DECLARE @CULTURE nvarchar(50)
	DECLARE @ACTION int
	DECLARE @IDENTIFIER4 nvarchar(50)
	DECLARE @PROCESSSTAMP nvarchar(50)

	SELECT TOP 1 @RPLN_EVALUATION = LOC.RPLN_EVALUATION, @REAL_TIME_RPLN = LOC.REAL_TIME_RPLN FROM LOCATION LOC 
	WHERE 
		LOC.Location = @location  AND LOC.warehouse = @warehouse;

	IF (@REAL_TIME_RPLN = N'<literal:1>')
		BEGIN
			IF (@RPLN_EVALUATION =N'<literal:2>')
				BEGIN
					SET @error = N'<literal:3>';
					SET @success = N'<literal:4>';
					SET @HISTORYMESSAGE = N'<literal:5>';
					SET @ACTION = 150;
				END
			ELSE
				BEGIN
					-- [comment omitted]
					UPDATE LOCATION SET RPLN_EVALUATION = N'<literal:6>' WHERE REAL_TIME_RPLN = N'<literal:7>' AND WAREHOUSE = @warehouse AND LOCATION = @location 

					SET @error = N'<literal:8>';
					SET @success = N'<literal:9>';
					SET @HISTORYMESSAGE = N'<literal:10>';
					SET @ACTION = 300;
				END
		END

	ELSE 
		BEGIN
			SET @error = N'<literal:11>';
			SET @success = N'<literal:12>';
			SET @HISTORYMESSAGE = N'<literal:13>';
			SET @ACTION = 140;
		END

	SELECT TOP 1 @CULTURE = SYSTEM_VALUE FROM SYSTEM_CONFIG_DETAIL WHERE SYS_KEY = N'<literal:14>' AND RECORD_TYPE = N'<literal:15>'
	SET @HISTORYMESSAGE = dbo.[RSCMfn_RtrvResource](@HISTORYMESSAGE, N'<literal:16>', @CULTURE);
	SET @PARAMETERLIST = @location + N'<literal:17>' + @warehouse;

	-- [comment omitted]
	EXEC 	[dbo].[SH_FillStringWithVarData]
			@HISTORYMESSAGE OUTPUT,
			@PARAMETERLIST,
			 N'<literal:18>'

	SET @IDENTIFIER4 = dbo.[RSCMfn_RtrvResource](N'<literal:19>', N'<literal:20>', @CULTURE)+dbo.[RSCMfn_RtrvResource](N'<literal:21>', N'<literal:22>', @CULTURE) + @location;
	SET @PROCESSSTAMP = dbo.[RSCMfn_RtrvResource](N'<literal:23>', N'<literal:24>', @CULTURE);
	-- [comment omitted]
	EXEC	[dbo].[HIST_SaveProcHist]
			250,				   -- [comment omitted]
			@ACTION,			   -- [comment omitted]
			NULL,				   -- [comment omitted]
			NULL,				   -- [comment omitted]
			NULL,				   -- [comment omitted]
			@IDENTIFIER4,		   -- [comment omitted]
			@HISTORYMESSAGE,	   -- [comment omitted]
			@PROCESSSTAMP,         -- [comment omitted]
			@userName,			   -- [comment omitted]
			@warehouse,			   -- [comment omitted]
			N'<literal:25>'					   -- [comment omitted]


END