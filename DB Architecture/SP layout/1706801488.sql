/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	57617		| RAB		| 09/04/09	| Created.

	Saves the Pallets Wave Statistic.
*/
CREATE PROCEDURE WVST_Pallets(
	@internalLaunchNum numeric(9))
AS
	SET NOCOUNT ON;

	declare @pallets numeric(28,5);

	-- The number of pallets is the number of "tree unit" or "top level"
	-- shipping container records that have nested containers with IDs.

	select
		@pallets = count(distinct tree_unit)
	from
		shipping_container

	where
		launch_num = @internalLaunchNum
		and
		parent = tree_unit
		and
		container_id is not null;

	exec STAT_SaveStatisticsValue N'WAVE', N'PALLETS', @internalLaunchNum, @pallets;

-- end WVST_PALLETS
