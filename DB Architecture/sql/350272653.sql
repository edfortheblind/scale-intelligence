-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
CREATE PROCEDURE WAVE_UpdateStatistics01(
	@waveNum numeric(9),
	@processStamp nvarchar(100),
	@userStamp nvarchar(30),
	@nextStep nvarchar(25) )
AS
BEGIN
	DECLARE @Warehouse NVARCHAR(50);

	BEGIN TRANSACTION;

	SELECT @Warehouse = WAREHOUSE 
	FROM LAUNCH_STATISTICS WITH(NOLOCK) 
	WHERE INTERNAL_LAUNCH_NUM = @waveNum;

	IF (@nextStep = N'<literal:1>' OR @nextStep = N'<literal:2>')
	BEGIN
		IF EXISTS (
			SELECT N'<literal:3>' 
			FROM LAUNCH_STATISTICS WITH (TABLOCKX)
			WHERE 
				(CURRENT_LAUNCH_STEP = N'<literal:4>' OR CURRENT_LAUNCH_STEP = N'<literal:5>')
				AND INTERNAL_LAUNCH_NUM <> @waveNum 
				AND WAREHOUSE = @Warehouse
		)
		BEGIN
			ROLLBACK;
			RETURN 0;
		END
	END
	ELSE IF 	(@nextStep = N'<literal:6>')
			BEGIN
				IF EXISTS (SELECT N'<literal:7>' FROM LAUNCH_STATISTICS
						WITH (TABLOCKX)
						WHERE 
						(CURRENT_LAUNCH_STEP = N'<literal:8>')
						AND INTERNAL_LAUNCH_NUM <> @waveNum AND WAREHOUSE = @Warehouse)
				BEGIN
					ROLLBACK;
					RETURN 0;
				END
			END

	IF (@@ERROR <> 0) 
	BEGIN
		ROLLBACK;
		RETURN 0;
	END

	UPDATE LAUNCH_STATISTICS 
	SET 
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
		weight_um = ISNULL(weight_um,shipHdr.weightum),
		launch_date_time_started = CASE WHEN launch_date_time_started IS NULL THEN GETUTCDATE() ELSE launch_date_time_started END,
		launch_date_time_ended = GETUTCDATE(),
		last_launch_step = CASE WHEN (current_launch_step IS NULL OR current_launch_step = N'<literal:9>' OR current_launch_step = N'<literal:10>') THEN N'<literal:11>' ELSE current_launch_step END,
		current_launch_step = @nextStep
	FROM 
		(SELECT 
			COUNT(internal_shipment_num) AS shipcount, 
			SUM(total_lines) AS linecount,
			SUM(total_qty) AS qtycount,
			SUM(total_value) AS valuecount, 
			SUM(total_weight) AS weightcount,
			SUM(total_volume) AS volumecount,
			MAX(quantity_um) AS quantityum,
			MAX(volume_um) AS volumeum,
			MAX(weight_um) AS weightum
		FROM shipment_header_view WITH (NOLOCK) 
		WHERE launch_num = @waveNum
	) shipHdr
	WHERE internal_launch_num = @waveNum;

	COMMIT;
	RETURN @@ROWCOUNT;
END

