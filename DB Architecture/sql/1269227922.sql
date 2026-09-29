-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
CREATE PROCEDURE MetaTrans_TpmPersonalViews
(
@username nvarchar(30),
@culture nvarchar(200)
)
AS
SET NOCOUNT ON;
SELECT
N'<literal:1>' AS N'<literal:2>',
@culture as Culture,
N'<literal:3>' WAREHOUSE,
N'<literal:4>' AS Company;