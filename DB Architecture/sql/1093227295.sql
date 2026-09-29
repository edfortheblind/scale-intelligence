-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE MetaTrans_ManualReplenishment @internalNum int, @culture nvarchar(10)
AS
  SELECT
    N'<literal:1>' AS N'<literal:2>',
    N'<literal:3>' AS N'<literal:4>',
	dbo.RSCMfn_RtrvResource(N'<literal:5>',N'<literal:6>',@culture) as N'<literal:7>',
    N'<literal:8>' WAREHOUSE,
    N'<literal:9>' AS Company