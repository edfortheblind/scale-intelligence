-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE WVST_ShipmentsRejected(
	@internalLaunchNum numeric(9))
AS
	SET NOCOUNT ON;

	declare @originalShipments numeric(28,5);
	declare @currentShipments numeric(9);
	declare @shipmentsRejected numeric(28,5);
	declare @shipmentsConsolidated numeric(28,5);

	-- [comment omitted]
	-- [comment omitted]

	exec STAT_GetStatisticsValue N'<literal:1>', N'<literal:2>', @internalLaunchNum, @originalShipments out;
	exec STAT_GetStatisticsValue N'<literal:3>', N'<literal:4>', @internalLaunchNum, @shipmentsConsolidated out;

	-- [comment omitted]
	-- [comment omitted]
	-- [comment omitted]
	-- [comment omitted]
	select
		@currentShipments = count(distinct internal_shipment_num)
	from
		shipment_detail
	where
		status1 not in (998, 999)
		and
		launch_num = @internalLaunchNum;

	set @shipmentsRejected = @originalShipments - isnull(@currentShipments,0) - @shipmentsConsolidated;

	exec STAT_SaveStatisticsValue N'<literal:5>', N'<literal:6>', @internalLaunchNum, @shipmentsRejected;

-- [comment omitted]
