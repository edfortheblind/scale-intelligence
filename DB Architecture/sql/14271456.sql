-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE TH_InsightDetailPaneData(@objectId numeric(9), @culture nvarchar(10))  
AS 
BEGIN

SELECT top 1 N'<literal:1>' AS SCALAR,
th.OBJECT_ID as ObjectId,
	th.TOTE_ID as ToteId, 
    th.CONDITION as Condition,
	th.MARK_FOR_SORTING as MarkForSorting,
	th.USER_ASSIGNED as UserAssigned,
	th.PROCESS_STAMP as ProcessStamp,
	th.WAREHOUSE as Warehouse
FROM TOTE_HEADER th WHERE th.OBJECT_ID=@objectId;

SELECT	N'<literal:2>' AS SCALAR, 
		tv.TOTAL_LINES as TotalLines
		FROM METADATA_INSIGHT_TOTE_VIEW tv 
		WHERE tv.OBJECT_ID = @objectId;
	
END
