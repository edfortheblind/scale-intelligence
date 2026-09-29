-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE WVST_AllocatedQuantity(
	@internalLaunchNum numeric(9))
AS
	SET NOCOUNT ON;

	declare @allocatedQuantity numeric(28,5);

	-- [comment omitted]

	select
		@allocatedQuantity = total_qty
	from
		launch_statistics
	where
		internal_launch_num = @internalLaunchNum;

	exec STAT_SaveStatisticsValue N'<literal:1>', N'<literal:2>', @internalLaunchNum, @allocatedQuantity;

-- [comment omitted]
