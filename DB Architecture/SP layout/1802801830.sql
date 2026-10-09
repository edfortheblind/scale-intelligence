/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	57617		| RAB		| 09/04/09	| Created.

	Saves the Total Shipments Wave Statistic.
*/
CREATE PROCEDURE WVST_TotalShipments(
	@internalLaunchNum numeric(9))
AS
	SET NOCOUNT ON;

	declare @totalShipments numeric(28,5);

	-- Total Shipments comes from the wave, assuming this procedure is run before
	-- any rejections or consolidations occur.
	select
		@totalShipments = total_shipments
	from
		launch_statistics
	where
		internal_launch_num = @internalLaunchNum;

	exec STAT_SaveStatisticsValue N'WAVE', N'TOTAL_SHIPMENTS', @internalLaunchNum, @totalShipments;

-- end WVST_TotalShipments
