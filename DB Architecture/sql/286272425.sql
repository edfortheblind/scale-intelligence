-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE PROCEDURE WAVE_RemoveShipment(
	@intShipNum numeric(9),
	@inPoolSts numeric(3),
	@wavePendingSts numeric(3),
	@processStamp nvarchar(100),
	@userStamp nvarchar(30))
	
AS
begin

	SET NOCOUNT ON;

	-- [comment omitted]
	update shipment_header
	set launch_num = 0,
		trailing_sts = @inPoolSts,
		leading_sts = @inPoolSts,
		trailing_sts_date = convert(date,dbo.GetWarehouseTimezoneValue(SHIPMENT_HEADER.warehouse,null)),
		leading_sts_date = convert(date,dbo.GetWarehouseTimezoneValue(SHIPMENT_HEADER.warehouse,null)),
		process_stamp = @processStamp,
		user_stamp = @userStamp,
		date_time_stamp = GETUTCDATE()	
	where internal_shipment_num = @intShipNum;

	if (@@ERROR <> 0) return -1;

	-- [comment omitted]
	update shipment_detail
	set launch_num = 0,
		status1 = CASE WHEN STATUS1 = @wavePendingSts THEN @inPoolSts ELSE STATUS1 END,
		process_stamp = @processStamp,
		user_stamp = @userStamp,
		date_time_stamp = GETUTCDATE()	
	where internal_shipment_num = @intShipNum;

	if (@@ERROR <> 0) return -1;

end -- [comment omitted]


