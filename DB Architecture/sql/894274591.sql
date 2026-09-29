-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_IShipmentHeaderVasActivity01
	@objectId numeric(9) OUTPUT,
	@vasActivityId numeric(9),
	@instructions nvarchar(2000),
	@internalShipmentNum numeric(9),
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
	@DateTimeStamp datetime
AS
	INSERT INTO SHIPMENT_HEADER_VAS_ACTIVITY(
		VAS_ACTIVITY_ID,
        INSTRUCTIONS,
        INTERNAL_SHIPMENT_NUM,
		USER_DEF1,
		USER_DEF2,
		USER_DEF3,
		USER_DEF4,
		USER_DEF5,
		USER_DEF6,
		USER_DEF7,
		USER_DEF8,
		USER_STAMP,
		PROCESS_STAMP,
		DATE_TIME_STAMP
	) VALUES (
		@vasActivityId,
		@instructions,
		@internalShipmentNum,
		@UserDef1,
		@UserDef2,
		@UserDef3,
		@UserDef4,
		@UserDef5,
		@UserDef6,
		@UserDef7,
		@UserDef8,
		@UserStamp,
		@ProcessStamp,
        @DateTimeStamp
	)
SELECT @objectId = SCOPE_IDENTITY()
