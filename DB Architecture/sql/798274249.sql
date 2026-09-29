-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE wm_ISerialNumber01
	@ObjectId numeric(9) OUTPUT,
	@GroupId nvarchar(32),
	@SerialNumber nvarchar(50),
	@TemplateId nvarchar(32),
	@LocContNum nvarchar(32),
	@LocInvNum nvarchar(32),
	@ShipContNum nvarchar(32),
	@RecContNum nvarchar(32),
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
	INSERT INTO SERIAL_NUMBER(
		GROUP_ID,
		SERIAL_NUMBER,
		TEMPLATE_ID,
		LOC_CONT_NUM,
		LOC_INV_NUM,
		SHIP_CONT_NUM,
		REC_CONT_NUM,
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
		@GroupId,
		@SerialNumber,
		@TemplateId,
		@LocContNum,
		@LocInvNum,
		@ShipContNum,
		@RecContNum,
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
	SELECT @ObjectId = SCOPE_IDENTITY()


