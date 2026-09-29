-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

CREATE PROCEDURE [dbo].[TRAV_RESEED_DB]
(
@MsgID nvarchar(max),
@username NVARCHAR(200),   
@error NVARCHAR(2000) OUTPUT,  
@success NVARCHAR(2000) OUTPUT
)
AS
SET NOCOUNT ON

DBCC CHECKIDENT ('<literal:1>', RESEED, 86000);
