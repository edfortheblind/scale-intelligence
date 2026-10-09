/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	57617		| RAB		| 09/04/09	| Created.

	Saves the Shipments Consolidated Wave Statistic.
*/
CREATE PROCEDURE WVST_ShipmentsConsolidated(
	@internalLaunchNum numeric(9))
AS
	SET NOCOUNT ON;

	declare @originalShipments numeric(28,5);
	declare @currentShipments numeric(9);
	declare @shipmentsRejected numeric(28,5);
	declare @shipmentsConsolidated numeric(28,5);

	-- Shipments Consolidated can only be assumed to be the decrease in 
	-- total shipments, while accounting for anything rejected.

	exec STAT_GetStatisticsValue N'WAVE', N'TOTAL_SHIPMENTS', @internalLaunchNum, @originalShipments out;
	exec STAT_GetStatisticsValue N'WAVE', N'SHIPMENTS_REJECTED', @internalLaunchNum, @shipmentsRejected out;

	-- note that we cannot look at the LAUNCH_STATISTICS.TOTAL_SHIPMENTS
	-- value, as rejected shipments are not deleted until Complete Wave.
	-- also, the trailing/leading statuses of headers are not updated
	-- until complete wave either.
	select
		@currentShipments = count(distinct internal_shipment_num)
	from
		shipment_detail
	where
		status1 not in (998, 999)
		and
		launch_num = @internalLaunchNum;

	set @shipmentsConsolidated = @originalShipments - @currentShipments - @shipmentsRejected;

	exec STAT_SaveStatisticsValue N'WAVE', N'SHIPMENTS_CONSOLIDATED', @internalLaunchNum, @shipmentsConsolidated;

-- end WVST_ShipmentsConsolidated
