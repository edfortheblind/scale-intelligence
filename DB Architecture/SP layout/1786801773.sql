/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	57617		| RAB		| 09/04/09	| Created.

	Saves the Total Quantity Wave Statistic.
*/
CREATE PROCEDURE WVST_TotalQuantity(
	@internalLaunchNum numeric(9))
AS
	SET NOCOUNT ON;

	declare @totalQuantity numeric(28,5);

	-- Total Quantity comes from the wave, assuming this procedure is run before
	-- any rejections occur.
	select
		@totalQuantity = total_qty
	from
		launch_statistics
	where
		internal_launch_num = @internalLaunchNum;

	exec STAT_SaveStatisticsValue N'WAVE', N'TOTAL_QUANTITY', @internalLaunchNum, @totalQuantity;

-- end WVST_TotalQuantity
