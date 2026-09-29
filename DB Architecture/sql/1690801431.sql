-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE WVST_LooseContainers(
	@internalLaunchNum numeric(9))
AS
	SET NOCOUNT ON;

	declare @looseContainers numeric(28,5);

	-- [comment omitted]
	-- [comment omitted]

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

	exec STAT_SaveStatisticsValue N'<literal:1>', N'<literal:2>', @internalLaunchNum, @looseContainers;

-- [comment omitted]
