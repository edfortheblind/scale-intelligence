/*
	Mod Number	| Programmer		| Date   	| Modification Description
	--------------------------------------------------------------------
	20510		| TDA				| 12/15/06	| created
*/


CREATE PROCEDURE WAVE_TransferShipment(
	@intShipNum numeric(9),
	@toWaveNum numeric(9),
	@processStamp nvarchar(100),
	@userStamp nvarchar(30))
	
AS
begin

		SET NOCOUNT ON;

		--update shipment header
		update shipment_header
		set launch_num = @toWaveNum,
			process_stamp = @processStamp,
			user_stamp = @userStamp,
			date_time_stamp = GETUTCDATE()	
		where internal_shipment_num = @intShipNum;

		if (@@ERROR <> 0) return -1;

		--update shipment detail
		update shipment_detail
		set launch_num = @toWaveNum,
			previous_wave_num = @toWaveNum,
			process_stamp = @processStamp,
			user_stamp = @userStamp,
			date_time_stamp = GETUTCDATE()	
		where internal_shipment_num = @intShipNum;

		if (@@ERROR <> 0) return -1;

end --WAVE_TransferShipment


