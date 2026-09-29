-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE WVST_RejectedQuantity(
	@internalLaunchNum numeric(9))
AS
	-- [comment omitted]

	SET NOCOUNT ON;

	declare @rejectedQuantity numeric(28,5);

	select
		@rejectedQuantity = sum(
			case when status1 in (998, 999) then quantity_at_sts1 else 0 end
			+ case when status2 in (998, 999) then quantity_at_sts2 else 0 end
			+ case when status3 in (998, 999) then quantity_at_sts3 else 0 end
			+ case when status4 in (998, 999) then quantity_at_sts4 else 0 end
			+ case when status5 in (998, 999) then quantity_at_sts5 else 0 end
			+ case when status6 in (998, 999) then quantity_at_sts6 else 0 end
			+ case when status7 in (998, 999) then quantity_at_sts7 else 0 end
			+ case when status8 in (998, 999) then quantity_at_sts8 else 0 end
			+ case when status9 in (998, 999) then quantity_at_sts9 else 0 end
			+ case when status10 in (998, 999) then quantity_at_sts10 else 0 end)
	from
		shipment_detail
	where
		launch_num = @internalLaunchNum

	set @rejectedQuantity = isnull(@rejectedQuantity, 0);

	exec STAT_SaveStatisticsValue N'<literal:1>', N'<literal:2>', @internalLaunchNum, @rejectedQuantity;

-- [comment omitted]
