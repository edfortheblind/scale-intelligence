-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE PROCEDURE wm_UAppointmentSchedule01
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

	UPDATE APPOINTMENT_SCHEDULE
	SET	DOCK = @Dock,
		APPT_DATE_TIME = @ApptDateTime,
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
		END_DATE_TIME=@EndDateTime 
	WHERE 
		INTERNAL_RECEIPT_NUM = @InternalReceiptNum; 



