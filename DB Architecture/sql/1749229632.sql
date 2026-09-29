-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */



	

CREATE PROCEDURE PMN_TableSizes
AS

SET NOCOUNT ON

EXEC sp_spaceused -- [comment omitted]

DECLARE @TableUsage TABLE(
	name		NVARCHAR(128),
	[rows]		CHAR(11),
	reserved	VARCHAR(18),
	data		VARCHAR(18),
	index_size	VARCHAR(18), 
	unused		VARCHAR(18));
 
INSERT @TableUsage
EXEC sp_msForEachTable N'<literal:1>'
SELECT * FROM @TableUsage Order by name;

SET NOCOUNT OFF