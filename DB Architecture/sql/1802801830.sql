-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE WVST_TotalShipments(
	@internalLaunchNum numeric(9))
AS
	SET NOCOUNT ON;

	declare @totalShipments numeric(28,5);

	-- [comment omitted]
	-- [comment omitted]
	select
		@totalShipments = total_shipments
	from
		launch_statistics
	where
		internal_launch_num = @internalLaunchNum;

	exec STAT_SaveStatisticsValue N'<literal:1>', N'<literal:2>', @internalLaunchNum, @totalShipments;

-- [comment omitted]
