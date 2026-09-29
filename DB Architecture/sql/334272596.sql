-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */








CREATE PROCEDURE WAVE_UpdateStatistics(
	@waveNum numeric(9),
	@processStamp nvarchar(100),
	@userStamp nvarchar(30))
	
AS
begin

		SET NOCOUNT ON;

		update launch_statistics 
		set 
			user_stamp = @userStamp,
			process_stamp = @processStamp,
			date_time_stamp = GETUTCDATE(),
			total_shipments = ISNULL(shipHdr.shipcount,0), 
			total_lines = ISNULL(shipHdr.linecount,0),
			total_qty = ISNULL(shipHdr.qtycount,0),
			total_value = ISNULL(shipHdr.valuecount,0),
			total_weight = ISNULL(shipHdr.weightcount,0),
			total_volume = ISNULL(shipHdr.volumecount,0),
			quantity_um = ISNULL(quantity_um,shipHdr.quantityum),
			volume_um = ISNULL(volume_um,shipHdr.volumeum),
			weight_um = ISNULL(weight_um,shipHdr.weightum)
	
		from 
			(select 
				count(internal_shipment_num) shipcount, 
				sum(total_lines) linecount,
				sum(total_qty) qtycount,
				sum(total_value) valuecount, 
				sum(total_weight) weightcount,
				sum(total_volume) volumecount,
				MAX(quantity_um) quantityum,
				MAX(volume_um) volumeum,
				MAX(weight_um) weightum
			 from shipment_header_view with (nolock) 
			 where launch_num = @waveNum) shipHdr
		where
			internal_launch_num = @waveNum;

		if (@@ERROR <> 0) return -1;

end -- [comment omitted]


