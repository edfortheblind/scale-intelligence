/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	138100	| AA	| 04/02/14	| Created
*/

--Marks the eligible location for replenishment
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

	IF (@REAL_TIME_RPLN = N'Y')
		BEGIN
			IF (@RPLN_EVALUATION =N'Y')
				BEGIN
					SET @error = N'MSG_MARKREPLENISH03';
					SET @success = N'';
					SET @HISTORYMESSAGE = N'MSG_PROCHIST_REPLENISH09';
					SET @ACTION = 150;
				END
			ELSE
				BEGIN
					--Mark location for real time replenishment
					UPDATE LOCATION SET RPLN_EVALUATION = N'Y' WHERE REAL_TIME_RPLN = N'Y' AND WAREHOUSE = @warehouse AND LOCATION = @location 

					SET @error = N'';
					SET @success = N'MSG_MARKREPLENISH01';
					SET @HISTORYMESSAGE = N'MSG_PROCHIST_REPLENISH07';
					SET @ACTION = 300;
				END
		END

	ELSE 
		BEGIN
			SET @error = N'MSG_MARKREPLENISH02';
			SET @success = N'';
			SET @HISTORYMESSAGE = N'MSG_PROCHIST_REPLENISH08';
			SET @ACTION = 140;
		END

	SELECT TOP 1 @CULTURE = SYSTEM_VALUE FROM SYSTEM_CONFIG_DETAIL WHERE SYS_KEY = N'80' AND RECORD_TYPE = N'TECHNICAL'
	SET @HISTORYMESSAGE = dbo.[RSCMfn_RtrvResource](@HISTORYMESSAGE, N'Msg', @CULTURE);
	SET @PARAMETERLIST = @location + N'-#$' + @warehouse;

	--Relace the optional parameter with the actual values
	EXEC 	[dbo].[SH_FillStringWithVarData]
			@HISTORYMESSAGE OUTPUT,
			@PARAMETERLIST,
			 N'-#$'

	SET @IDENTIFIER4 = dbo.[RSCMfn_RtrvResource](N'LOCATION', N'Text', @CULTURE)+dbo.[RSCMfn_RtrvResource](N'COLON', N'Text', @CULTURE) + @location;
	SET @PROCESSSTAMP = dbo.[RSCMfn_RtrvResource](N'REPLENISHMENT', N'Text', @CULTURE);
	--Write process history
	EXEC	[dbo].[HIST_SaveProcHist]
			250,				   --A process constant.
			@ACTION,			   --An action constant.
			NULL,				   --Identifier one
			NULL,				   --Identifier two
			NULL,				   --Identifier three.
			@IDENTIFIER4,		   --Identifier four.
			@HISTORYMESSAGE,	   --The message to record
			@PROCESSSTAMP,         --The process stamp.
			@userName,			   --The current user.
			@warehouse,			   --The warehouse.
			N'Y'					   --Process history active


END