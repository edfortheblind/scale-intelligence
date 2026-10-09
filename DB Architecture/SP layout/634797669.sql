
CREATE PROCEDURE wm_UShipmentAccessorials01
	@RowsAffected int OUTPUT,
	@InternalNum numeric(9),
	@ShipmentLevel nchar(1),
	@AccessorialCode nvarchar(25),
	@AccessorialSubCode nvarchar(25),
	@Value nvarchar(50),
	@UserDef1 nvarchar(25),
	@UserDef2 nvarchar(25),
	@UserDef3 nvarchar(25),
	@UserDef4 nvarchar(25),
	@UserDef5 nvarchar(25),
	@UserDef6 nvarchar(25),
	@UserDef7 numeric(19,5),
	@UserDef8 numeric(19,5),
	@UserStamp nvarchar(30),
	@ProcessStamp nvarchar(100),
	@DateTimeStamp datetime,
	@CarrierFreightCharge numeric(19,5),
	@PaidFreightCharge numeric(19,5),
	@BilledFreightCharge numeric(19,5)
AS
	UPDATE SHIPMENT_ACCESSORIALS
	   SET
		INTERNAL_NUM=@InternalNum,
		SHIPMENT_LEVEL=@ShipmentLevel,
		ACCESSORIAL_CODE=@AccessorialCode,
		ACCESSORIAL_SUB_CODE=@AccessorialSubCode,
		VALUE=@Value,
		USER_DEF1=@UserDef1,
		USER_DEF2=@UserDef2,
		USER_DEF3=@UserDef3,
		USER_DEF4=@UserDef4,
		USER_DEF5=@UserDef5,
		USER_DEF6=@UserDef6,
		USER_DEF7=@UserDef7,
		USER_DEF8=@UserDef8,
		USER_STAMP=@UserStamp,
		PROCESS_STAMP=@ProcessStamp,
		DATE_TIME_STAMP=@DateTimeStamp,
		CARRIER_FREIGHT_CHARGE=@CarrierFreightCharge,
		PAID_FREIGHT_CHARGE=@PaidFreightCharge,
		BILLED_FREIGHT_CHARGE=@BilledFreightCharge
	 WHERE INTERNAL_NUM = @InternalNum
	 AND SHIPMENT_LEVEL = @ShipmentLevel
	 AND ACCESSORIAL_CODE = @AccessorialCode
	 AND ACCESSORIAL_SUB_CODE = @AccessorialSubCode

	SET @RowsAffected = @@ROWCOUNT


