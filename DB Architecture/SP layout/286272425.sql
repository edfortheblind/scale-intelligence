/*
	Mod Number	| Programmer		| Date   	| Modification Description
	--------------------------------------------------------------------
	20510		| TDA				| 12/15/06	| created
	224225		| SO				| 05/28/18	| Modified To updated trailing/leading status date with warehouse date. 
*/


CREATE PROCEDURE WAVE_RemoveShipment(
	@intShipNum numeric(9),
	@inPoolSts numeric(3),
	@wavePendingSts numeric(3),
	@processStamp nvarchar(100),
	@userStamp nvarchar(30))
	
AS
begin

	SET NOCOUNT ON;

	--update shipment header
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

	--update shipment detail
	update shipment_detail
	set launch_num = 0,
		status1 = CASE WHEN STATUS1 = @wavePendingSts THEN @inPoolSts ELSE STATUS1 END,
		process_stamp = @processStamp,
		user_stamp = @userStamp,
		date_time_stamp = GETUTCDATE()	
	where internal_shipment_num = @intShipNum;

	if (@@ERROR <> 0) return -1;

end --WAVE_RemoveShipment


