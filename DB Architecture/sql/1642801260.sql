-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE WVST_ImmediateNeedsQuantity(
	@internalLaunchNum numeric(9))
AS
	SET NOCOUNT ON;

	declare @immediateNeedsQuantity numeric(28,5);

	-- [comment omitted]

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

	exec STAT_SaveStatisticsValue N'<literal:1>', N'<literal:2>', @internalLaunchNum, @immediateNeedsQuantity;

-- [comment omitted]
