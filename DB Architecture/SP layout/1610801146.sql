/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	57617		| RAB		| 09/04/09	| Created.

	Saves the Allocated Quantity Wave Statistic.
*/
CREATE PROCEDURE WVST_AllocatedQuantity(
	@internalLaunchNum numeric(9))
AS
	SET NOCOUNT ON;

	declare @allocatedQuantity numeric(28,5);

	-- Allocated quantity is simply the current total quantity of the wave.

	select
		@allocatedQuantity = total_qty
	from
		launch_statistics
	where
		internal_launch_num = @internalLaunchNum;

	exec STAT_SaveStatisticsValue N'WAVE', N'ALLOCATED_QUANTITY', @internalLaunchNum, @allocatedQuantity;

-- end WVST_AllocatedQuantity
