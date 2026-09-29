-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE wm_IAppointmentSchedule01
	@ObjectId numeric(9) OUTPUT,
	@InternalReceiptNum numeric(9),
	@Dock nvarchar(25),
	@ApptDateTime datetime,
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
	@EndDateTime datetime
AS
	INSERT INTO APPOINTMENT_SCHEDULE(
		INTERNAL_RECEIPT_NUM,
		DOCK,
		APPT_DATE_TIME,
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
		DATE_TIME_STAMP,
		END_DATE_TIME
       	) VALUES (
		@InternalReceiptNum,
		@Dock,
		@ApptDateTime,
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
		@DateTimeStamp,
		@EndDateTime 
	)
	SELECT @ObjectId = SCOPE_IDENTITY()


