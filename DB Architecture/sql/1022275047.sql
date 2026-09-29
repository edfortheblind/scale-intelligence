-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RAppointmentSchedule03
	@IntRecNum numeric(9)
AS
	SELECT *
	FROM APPOINTMENT_SCHEDULE
	WHERE Internal_Receipt_Num = @IntRecNum 


