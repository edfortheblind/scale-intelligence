-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */







CREATE PROCEDURE [dbo].[TRAV_EX01_MarkForPS]
(
@INTERNAL nvarchar(max),
@username NVARCHAR(200),   
@error NVARCHAR(2000) OUTPUT,  
@success NVARCHAR(2000) OUTPUT
)
AS
SET NOCOUNT ON

UPDATE LAUNCH_STATISTICS SET USER_DEF1 = '<literal:1>' WHERE INTERNAL_LAUNCH_NUM = @INTERNAL
SET @success = N'<literal:2>'

