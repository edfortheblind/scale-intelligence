-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE WAVE_TransferShipment(
	@intShipNum numeric(9),
	@toWaveNum numeric(9),
	@processStamp nvarchar(100),
	@userStamp nvarchar(30))
	
AS
begin

		SET NOCOUNT ON;

		-- [comment omitted]
		update shipment_header
		set launch_num = @toWaveNum,
			process_stamp = @processStamp,
			user_stamp = @userStamp,
			date_time_stamp = GETUTCDATE()	
		where internal_shipment_num = @intShipNum;

		if (@@ERROR <> 0) return -1;

		-- [comment omitted]
		update shipment_detail
		set launch_num = @toWaveNum,
			previous_wave_num = @toWaveNum,
			process_stamp = @processStamp,
			user_stamp = @userStamp,
			date_time_stamp = GETUTCDATE()	
		where internal_shipment_num = @intShipNum;

		if (@@ERROR <> 0) return -1;

end -- [comment omitted]


