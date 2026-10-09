/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	57617		| RAB		| 09/04/09	| Created.

	Saves the Total Lines Wave Statistic.
*/
CREATE PROCEDURE WVST_TotalLines(
	@internalLaunchNum numeric(9))
AS
	SET NOCOUNT ON;

	declare @totalLines numeric(28,5);

	-- Total Lines comes from the wave, assuming this procedure is run before
	-- any rejections or consolidations occur.
	select
		@totalLines = total_lines
	from
		launch_statistics
	where
		internal_launch_num = @internalLaunchNum;

	exec STAT_SaveStatisticsValue N'WAVE', N'TOTAL_LINES', @internalLaunchNum, @totalLines;

-- end WVST_TotalLines
