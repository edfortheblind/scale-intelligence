-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE MetaTrans_SinglesPacking @username nvarchar(30), @culture nvarchar(10)
AS
declare @packingId nvarchar(100);

select @packingId = N'<literal:1>'

  SELECT
    N'<literal:2>' AS N'<literal:3>',
    N'<literal:4>' AS N'<literal:5>',
	dbo.RSCMfn_RtrvResource(@packingId,N'<literal:6>',@culture) as N'<literal:7>',
	N'<literal:8>' as N'<literal:9>',
	N'<literal:10>' as N'<literal:11>',
	@packingId as N'<literal:12>',
	N'<literal:13>' as SingleUnitPackingTemplate,
    N'<literal:14>' WAREHOUSE,
    N'<literal:15>' AS Company,
	@culture as Culture

	