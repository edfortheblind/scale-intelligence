/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	57617		| RAB		| 09/04/09	| Created.

	Saves the Full Containers Wave Statistic.
*/
CREATE PROCEDURE WVST_FullContainers(
	@internalLaunchNum numeric(9))
AS
	SET NOCOUNT ON;

	declare @cases numeric(28,5);

	-- The number of full containers is the number of containers with IDs that are
	-- also associated with a shipment detail.

	select
		@cases = count(*)
	from
		shipping_container

	where
		launch_num = @internalLaunchNum
		and
		internal_shipment_line_num > 0
		and
		container_id is not null;

	exec STAT_SaveStatisticsValue N'WAVE', N'FULL_CONTAINERS', @internalLaunchNum, @cases;

-- end WVST_FullContainers
