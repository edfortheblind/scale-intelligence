-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RAppointmentSchedule02
	@ObjectId numeric(9)
AS
	SELECT *
	  FROM APPOINTMENT_SCHEDULE
	 WHERE OBJECT_ID = @ObjectId


