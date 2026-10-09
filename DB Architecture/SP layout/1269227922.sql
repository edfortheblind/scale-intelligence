CREATE PROCEDURE MetaTrans_TpmPersonalViews
(
@username nvarchar(30),
@culture nvarchar(200)
)
AS
SET NOCOUNT ON;
SELECT
N'SCALAR' AS N'EntityType',
@culture as Culture,
N'' WAREHOUSE,
N'' AS Company;