-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE WVST_Pallets(
	@internalLaunchNum numeric(9))
AS
	SET NOCOUNT ON;

	declare @pallets numeric(28,5);

	-- [comment omitted]
	-- [comment omitted]

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

	exec STAT_SaveStatisticsValue N'<literal:1>', N'<literal:2>', @internalLaunchNum, @pallets;

-- [comment omitted]
