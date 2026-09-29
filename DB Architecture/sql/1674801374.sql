-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE WVST_LinesPartiallyRejected(
	@internalLaunchNum numeric(9))
AS
	SET NOCOUNT ON;

	declare @linesPartiallyRejected numeric(28,5);

	-- [comment omitted]
	-- [comment omitted]
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

	exec STAT_SaveStatisticsValue N'<literal:1>', N'<literal:2>', @internalLaunchNum, @linesPartiallyRejected;

-- [comment omitted]
