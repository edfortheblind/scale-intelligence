-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */








CREATE PROCEDURE PROCHST_InsightDetailPaneData(@internalId numeric(9) , @culture nvarchar(10))  
AS 
BEGIN

SET NOCOUNT ON;

select * INTO #tempProcHst
FROM PROCESS_HISTORY
WHERE INTERNAL_ID = @internalId;

SELECT top 1 N'<literal:1>' AS SCALAR,
    dbo.GENCONFIGfn_RtrvDesc(N'<literal:2>', ph.PROCESS) as Process,
	dbo.GENCONFIGfn_RtrvDesc(N'<literal:3>', ph.ACTION) as Action,
	ph.ACTIVITY_DATE_TIME as ActivityDateTime,
	ph.USER_STAMP as Username,
	ph.INTERNAL_ID as InternalId
FROM #tempProcHst ph;

select N'<literal:4>' AS Table_DetailPaneDetailsProcessInfo, 
	dbo.GENCONFIGfn_RtrvDesc(N'<literal:5>', PROCESS) as PROCESS,
	dbo.GENCONFIGfn_RtrvDesc(N'<literal:6>', ACTION) as ACTION,
	ACTIVITY_DATE_TIME as ACTIVITYDATETIME,
	IDENTIFIER1 as IDENTIFIER1,
	IDENTIFIER2 as IDENTIFIER2,
	IDENTIFIER3 as IDENTIFIER3,
	IDENTIFIER4 as IDENTIFIER4,
	MESSAGE as MESSAGE
FROM #tempProcHst;

select N'<literal:7>' AS Table_DetailPaneDetailsReferenceInfo, 
	INTERNAL_ID as INTERNALID,
	WAREHOUSE as WAREHOUSE,
	USER_STAMP as USERNAME
FROM #tempProcHst;

select N'<literal:8>' AS Table_DetailPaneDetailsUserDefined, 
	USER_DEF1 as UDPROCESSHISTORY1,
	USER_DEF2 as UDPROCESSHISTORY2,
	USER_DEF3 as UDPROCESSHISTORY3,
	USER_DEF4 as UDPROCESSHISTORY4,
	USER_DEF5 as UDPROCESSHISTORY5,
	USER_DEF6 as UDPROCESSHISTORY6,
	USER_DEF7 as UDPROCESSHISTORY7,
	USER_DEF8 as UDPROCESSHISTORY8
FROM #tempProcHst;

END