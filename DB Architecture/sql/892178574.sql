-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE AD_InsightDetailPaneData(@archiveId nvarchar(25),@culture nvarchar(10))  
AS 
BEGIN

SELECT top 1 N'<literal:1>' AS SCALAR,
ap.ARCHIVE_ID as ArchiveId,
ap.ARCHIVE_NAME as ArchiveName,
ap.LAST_ARCH_DATE_TIME as LastArchiveDateTime,
ap.TABLE_DO_NAME as TableName

FROM ARCHIVE_PREFERENCES ap where ap.ARCHIVE_ID=@archiveId;

END
