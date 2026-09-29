-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE PROCEDURE TRAV_EX01_ResendPSData
(
@INTERNAL nvarchar(max),
@username NVARCHAR(200),   
@error NVARCHAR(2000) OUTPUT,  
@success NVARCHAR(2000) OUTPUT
)
AS
SET NOCOUNT ON

IF NOT EXISTS ( SELECT 1 FROM LAUNCH_STATISTICS WITH(NOLOCK) WHERE INTERNAL_LAUNCH_NUM =  @INTERNAL AND RELEASED = N'<literal:1>')
BEGIN
	SET @error=N'<literal:2>';
END

ELSE IF NOT EXISTS ( SELECT 1 FROM LAUNCH_STATISTICS WITH(NOLOCK) WHERE INTERNAL_LAUNCH_NUM =  @INTERNAL AND USER_DEF1 = N'<literal:3>')
BEGIN
	SET @error=N'<literal:4>';
END

ELSE 
BEGIN
	EXEC TRAV_EX01_InsertDataForPS  @INTERNAL
	SET @success = N'<literal:5>';
END