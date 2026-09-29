-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE LA_InsightDetailPaneData(@InternalDetailNumber numeric(9) ,@culture nvarchar(10)) 
AS 
BEGIN

	-- [comment omitted]
	SELECT top 1 N'<literal:1>' AS SCALAR,
		dbo.RSCMfn_RtrvResource(LD.ACTIVITY_SCREEN,N'<literal:2>', null) AS ActivityScreen,
		dbo.LABORCONFIGfn_RtrvDesc(LD.ACTIVITY_TYPE) AS ActivityType,
		LD.USER_NAME AS UserName,
		LD.INTERNAL_DETAIL_NUM AS InternalDetailNumber
	FROM LABOR_MANAGEMENT_DETAIL LD
	WHERE LD.INTERNAL_DETAIL_NUM = @InternalDetailNumber;

END

