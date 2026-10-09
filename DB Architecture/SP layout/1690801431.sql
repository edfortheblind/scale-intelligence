/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	57617		| RAB		| 09/04/09	| Created.

	Saves the Loose Containers Wave Statistic.
*/
CREATE PROCEDURE WVST_LooseContainers(
	@internalLaunchNum numeric(9))
AS
	SET NOCOUNT ON;

	declare @looseContainers numeric(28,5);

	-- The number of loose containers is the number of containers with IDs
	-- that do not have other containers with IDs in them (as that is a "pallet").

	select
		@looseContainers = count(*)
	from	
		shipping_container loose
	where
		loose.launch_num = @internalLaunchNum
		and
		loose.container_id is not null
		and
		isnull(loose.internal_shipment_line_num, 0) = 0
		and
		loose.internal_container_num not in (
			select
				distinct nested.tree_unit
			from
				shipping_container nested
			where
				nested.launch_num = @internalLaunchNum
				and
				nested.parent = nested.tree_unit
				and
				nested.container_id is not null
		);

	exec STAT_SaveStatisticsValue N'WAVE', N'LOOSE_CONTAINERS', @internalLaunchNum, @looseContainers;

-- end WVST_LooseContainers
