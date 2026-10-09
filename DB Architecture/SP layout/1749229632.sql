/*
	Task	| By	| Date			| Modification Description
	-------------------------------------------------
	100852	| MMM	| 07/23/2012	| Created.
*/	

CREATE PROCEDURE PMN_TableSizes
AS

SET NOCOUNT ON

EXEC sp_spaceused -- Table row counts and sizes.

DECLARE @TableUsage TABLE(
	name		NVARCHAR(128),
	[rows]		CHAR(11),
	reserved	VARCHAR(18),
	data		VARCHAR(18),
	index_size	VARCHAR(18), 
	unused		VARCHAR(18));
 
INSERT @TableUsage
EXEC sp_msForEachTable N'EXEC sp_spaceused "?"'
SELECT * FROM @TableUsage Order by name;

SET NOCOUNT OFF