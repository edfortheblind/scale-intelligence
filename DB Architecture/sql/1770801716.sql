-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE WVST_TotalLines(
	@internalLaunchNum numeric(9))
AS
	SET NOCOUNT ON;

	declare @totalLines numeric(28,5);

	-- [comment omitted]
	-- [comment omitted]
	select
		@totalLines = total_lines
	from
		launch_statistics
	where
		internal_launch_num = @internalLaunchNum;

	exec STAT_SaveStatisticsValue N'<literal:1>', N'<literal:2>', @internalLaunchNum, @totalLines;

-- [comment omitted]
