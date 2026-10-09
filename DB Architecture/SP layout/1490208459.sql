/*
 Mod     | Programmer    | Date       | Modification Description
 --------------------------------------------------------------------
  EX01   | rphilip	     | 03/10/2023 | EX01 - Resend PS Data Action from Insight Screen 
*/



CREATE PROCEDURE TRAV_EX01_ResendPSData
(
@INTERNAL nvarchar(max),
@username NVARCHAR(200),   
@error NVARCHAR(2000) OUTPUT,  
@success NVARCHAR(2000) OUTPUT
)
AS
SET NOCOUNT ON

IF NOT EXISTS ( SELECT 1 FROM LAUNCH_STATISTICS WITH(NOLOCK) WHERE INTERNAL_LAUNCH_NUM =  @INTERNAL AND RELEASED = N'Y')
BEGIN
	SET @error=N'MSG_TRAV_EX01_WAVENOTRELEASED';
END

ELSE IF NOT EXISTS ( SELECT 1 FROM LAUNCH_STATISTICS WITH(NOLOCK) WHERE INTERNAL_LAUNCH_NUM =  @INTERNAL AND USER_DEF1 = N'Y')
BEGIN
	SET @error=N'MSG_TRAV_EX01_WAVENOTELIGIBLE';
END

ELSE 
BEGIN
	EXEC TRAV_EX01_InsertDataForPS  @INTERNAL
	SET @success = N'MSG_TRAV_EX01_WAVEDATASENT';
END