/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	20096	| AU	| 07/12/22	| Created.
*/

CREATE PROCEDURE AD_InsightDetailPaneData(@archiveId nvarchar(25),@culture nvarchar(10))  
AS 
BEGIN

SELECT top 1 N'SCALAR' AS SCALAR,
ap.ARCHIVE_ID as ArchiveId,
ap.ARCHIVE_NAME as ArchiveName,
ap.LAST_ARCH_DATE_TIME as LastArchiveDateTime,
ap.TABLE_DO_NAME as TableName

FROM ARCHIVE_PREFERENCES ap where ap.ARCHIVE_ID=@archiveId;

END
