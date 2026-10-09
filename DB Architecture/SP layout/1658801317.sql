/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	57617		| RAB		| 09/04/09	| Created.

	Saves the Lines Completely Rejected Wave Statistic.
*/
CREATE PROCEDURE WVST_LinesCompletelyRejected(
	@internalLaunchNum numeric(9))
AS
	SET NOCOUNT ON;

	declare @linesCompletelyRejected numeric(28,5);
	declare @originalLines numeric(28,5);
	declare @currentLines numeric(9);

	-- Lines Completely Rejected is the sum of lines with only
	-- quantity in the the rejected statuses (998, 999) and the decrease
	-- in original total lines.
	select
		@linesCompletelyRejected = count(*)
	from
		shipment_detail
	where
		launch_num = @internalLaunchNum
		and
		status1 in (998, 999);

	exec STAT_GetStatisticsValue N'WAVE', N'TOTAL_LINES', @internalLaunchNum, @originalLines out;

	select
		@currentLines = total_lines
	from
		launch_statistics
	where
		internal_launch_num = @internalLaunchNum;

	set @linesCompletelyRejected = @linesCompletelyRejected + (@originalLines - @currentLines);

	exec STAT_SaveStatisticsValue N'WAVE', N'LINES_COMPLETELY_REJECTED', @internalLaunchNum, @linesCompletelyRejected;

-- end WVST_LinesCompletelyRejected
