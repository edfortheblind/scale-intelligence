/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	57617		| RAB		| 09/04/09	| Created.

	Saves the Immediate Needs Quantity Wave Statistic.
*/
CREATE PROCEDURE WVST_ImmediateNeedsQuantity(
	@internalLaunchNum numeric(9))
AS
	SET NOCOUNT ON;

	declare @immediateNeedsQuantity numeric(28,5);

	-- Immediate Needs quantity is the quantity at status 997.

	select
		@immediateNeedsQuantity = sum(
			case when status1 = 997 then quantity_at_sts1 else 0 end
			+ case when status2 = 997 then quantity_at_sts2 else 0 end
			+ case when status3 = 997 then quantity_at_sts3 else 0 end
			+ case when status4 = 997 then quantity_at_sts4 else 0 end
			+ case when status5 = 997 then quantity_at_sts5 else 0 end
			+ case when status6 = 997 then quantity_at_sts6 else 0 end
			+ case when status7 = 997 then quantity_at_sts7 else 0 end
			+ case when status8 = 997 then quantity_at_sts8 else 0 end
			+ case when status9 = 997 then quantity_at_sts9 else 0 end
			+ case when status10 = 997 then quantity_at_sts10 else 0 end)
	from
		shipment_detail
	where
		launch_num = @internalLaunchNum

	exec STAT_SaveStatisticsValue N'WAVE', N'IMMEDIATE_NEEDS_QUANTITY', @internalLaunchNum, @immediateNeedsQuantity;

-- end WVST_ImmediateNeedsQuantity
