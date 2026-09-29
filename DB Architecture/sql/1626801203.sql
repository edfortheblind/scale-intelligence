-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE WVST_FullContainers(
	@internalLaunchNum numeric(9))
AS
	SET NOCOUNT ON;

	declare @cases numeric(28,5);

	-- [comment omitted]
	-- [comment omitted]

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

	exec STAT_SaveStatisticsValue N'<literal:1>', N'<literal:2>', @internalLaunchNum, @cases;

-- [comment omitted]
