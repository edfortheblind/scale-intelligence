-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */








CREATE PROCEDURE wm_IItemUnitOfMeasure01
	@InternalItemUm numeric(9),
	@Item nvarchar(50),
	@Company nvarchar(25),
	@Sequence numeric(3),
	@QuantityUm nvarchar(25),
	@ConversionQty numeric(19,5),
	@Length numeric(19,5),
	@Width numeric(19,5),
	@Height numeric(19,5),
	@DimensionUm nvarchar(25),
	@Weight numeric(19,5),
	@WeightUm nvarchar(25),
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
	@TreatFullPct numeric(3),
	@MovementCls nvarchar(25),
	@ItemClass nvarchar(50),
	@TreatAsLoose nchar(1),
	@EpcPackageId numeric(1),
	@SlottingID nchar(1),
	@SlottingPalletTI numeric(9),
	@SlottingPalletHI numeric(9)
AS
	INSERT INTO ITEM_UNIT_OF_MEASURE(
		COMPANY,
		CONVERSION_QTY,
		DATE_TIME_STAMP,
		DIMENSION_UM,
		EPC_PACKAGE_ID,
		HEIGHT,
		ITEM,
		ITEM_CLASS,
		LENGTH,
		MOVEMENT_CLS,
		PROCESS_STAMP,
		QUANTITY_UM,
		SEQUENCE,
		TREAT_AS_LOOSE,
		TREAT_FULL_PCT,
		USER_DEF1,
		USER_DEF2,
		USER_DEF3,
		USER_DEF4,
		USER_DEF5,
		USER_DEF6,
		USER_DEF7,
		USER_DEF8,
		USER_STAMP,
		WEIGHT,
		WEIGHT_UM,
		WIDTH,
		SLOTTING_ID,
		SLOTTING_PALLET_TI,
		SLOTTING_PALLET_HI	
	) VALUES (
		@Company,
		@ConversionQty,
		@DateTimeStamp,
		@DimensionUm,
		@EpcPackageId,
		@Height,
		@Item,
		@ItemClass,
		@Length,
		@MovementCls,
		@ProcessStamp,
		@QuantityUm,
		@Sequence,
		@TreatAsLoose,
		@TreatFullPct,
		@UserDef1,
		@UserDef2,
		@UserDef3,
		@UserDef4,
		@UserDef5,
		@UserDef6,
		@UserDef7,
		@UserDef8,
		@UserStamp,
		@Weight,
		@WeightUm,
		@Width,
		@SlottingID,
		@SlottingPalletTI,
		@SlottingPalletHI
	)




