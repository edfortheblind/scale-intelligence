-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE WVST_LinesCompletelyRejected(
	@internalLaunchNum numeric(9))
AS
	SET NOCOUNT ON;

	declare @linesCompletelyRejected numeric(28,5);
	declare @originalLines numeric(28,5);
	declare @currentLines numeric(9);

	-- [comment omitted]
	-- [comment omitted]
	-- [comment omitted]
	select
		@linesCompletelyRejected = count(*)
	from
		shipment_detail
	where
		launch_num = @internalLaunchNum
		and
		status1 in (998, 999);

	exec STAT_GetStatisticsValue N'<literal:1>', N'<literal:2>', @internalLaunchNum, @originalLines out;

	select
		@currentLines = total_lines
	from
		launch_statistics
	where
		internal_launch_num = @internalLaunchNum;

	set @linesCompletelyRejected = @linesCompletelyRejected + (@originalLines - @currentLines);

	exec STAT_SaveStatisticsValue N'<literal:3>', N'<literal:4>', @internalLaunchNum, @linesCompletelyRejected;

-- [comment omitted]
