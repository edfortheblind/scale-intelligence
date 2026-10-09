/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	57617		| RAB		| 09/04/09	| Created.

	Saves the Lines Partially Rejected Wave Statistic.
*/
CREATE PROCEDURE WVST_LinesPartiallyRejected(
	@internalLaunchNum numeric(9))
AS
	SET NOCOUNT ON;

	declare @linesPartiallyRejected numeric(28,5);

	-- Lines Partially Rejected have some quantity not in
	-- the rejected statuses (998, 999), and other quantity in that status.
	select
		@linesPartiallyRejected = count(*)
	from
		shipment_detail
	where
		launch_num = @internalLaunchNum
		and
		(
			status1 not in (998, 999)
			and
			(
				status2 in (998, 999)
				or
				status3 in (998, 999)
				or
				status4 in (998, 999)
				or
				status5 in (998, 999)
				or
				status6 in (998, 999)
				or
				status7 in (998, 999)
				or
				status8 in (998, 999)
				or
				status9 in (998, 999)
				or
				status10 in (998, 999)
			)
		);

	exec STAT_SaveStatisticsValue N'WAVE', N'LINES_PARTIALLY_REJECTED', @internalLaunchNum, @linesPartiallyRejected;

-- end WVST_LinesPartiallyRejected
