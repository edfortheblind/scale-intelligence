-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */








CREATE PROCEDURE SHP_SetXOfYForWave(
	@waveNumber numeric(9)
	)
AS
	SET NOCOUNT ON;
	
	DECLARE @LoopId  int;
	DECLARE @currentInternalId numeric(9,0);
	DECLARE @ShipmentsInWave TABLE
	( 
		LoopId  int  not null  identity(1,1),
		InternalId  numeric(9,0)  not null 
	);
	
	INSERT INTO @ShipmentsInWave (InternalId) 
		SELECT SH.INTERNAL_SHIPMENT_NUM 
		FROM SHIPMENT_HEADER SH WITH (NOLOCK)
		WHERE SH.LAUNCH_NUM = @waveNumber;
	
	SELECT @LoopId = COUNT(*) from @ShipmentsInWave;

	WHILE @LoopId > 0 
	BEGIN 
		SELECT @currentInternalId = InternalId from @ShipmentsInWave 
			WHERE LoopId = @LoopId;
		
		BEGIN TRAN 
			exec SHP_SetXOfYForShipment @currentInternalId;
		COMMIT;
		
		SET @LoopId = @LoopId - 1;
	END;