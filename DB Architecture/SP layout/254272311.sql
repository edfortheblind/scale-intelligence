/*
	Mod Number	| Programmer		| Date   	| Modification Description
	--------------------------------------------------------------------
	20510		| TDA				| 12/15/06	| created
	224426		| MJ				| 05/22/18	| Passing trailing_sts_date and leading_sts_date wareshouse date.
*/

CREATE PROCEDURE WAVE_AddShipment(
	@intShipNum numeric(9),
	@toWaveNum numeric(9),
	@wavePendingSts numeric(3),
	@processStamp nvarchar(100),
	@userStamp nvarchar(30))
	
AS
begin

	SET NOCOUNT ON;

		--update shipment header
		update shipment_header
		set launch_num = @toWaveNum,
			trailing_sts = @wavePendingSts,
			leading_sts = @wavePendingSts,
			trailing_sts_date =  convert(date,dbo.GetWarehouseTimezoneValue(SHIPMENT_HEADER.warehouse,null)),
			leading_sts_date = convert(date,dbo.GetWarehouseTimezoneValue(SHIPMENT_HEADER.warehouse,null)),
			process_stamp = @processStamp,
			user_stamp = @userStamp,
			date_time_stamp = GETUTCDATE()	
		where internal_shipment_num = @intShipNum;

		if (@@ERROR <> 0) return -1;

		--update shipment detail
		update shipment_detail
		set launch_num = @toWaveNum,
			previous_wave_num = @toWaveNum,
			status1 = CASE WHEN STATUS1 < @wavePendingSts THEN @wavePendingSts ELSE STATUS1 END,
			process_stamp = @processStamp,
			user_stamp = @userStamp,
			date_time_stamp = GETUTCDATE()	
		where internal_shipment_num = @intShipNum;

		if (@@ERROR <> 0) return -1;

end --WAVE_AddShipment


