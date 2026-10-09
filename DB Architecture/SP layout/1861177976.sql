
/*
 Mod     | Programmer    | Date       | Modification Description
 --------------------------------------------------------------------
  EX01   | rphilip	     | 03/10/2023 | EX01 - Resend PS Data Action from Insight Screen 
*/



CREATE PROCEDURE [dbo].[TRAV_EX01_MarkForPS]
(
@INTERNAL nvarchar(max),
@username NVARCHAR(200),   
@error NVARCHAR(2000) OUTPUT,  
@success NVARCHAR(2000) OUTPUT
)
AS
SET NOCOUNT ON

UPDATE LAUNCH_STATISTICS SET USER_DEF1 = 'Y' WHERE INTERNAL_LAUNCH_NUM = @INTERNAL
SET @success = N'MSG_TRAV_EX01_MARKFORPS'

