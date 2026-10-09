/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	15053	| MD	| 09/19/04	| Created
*/

CREATE PROCEDURE wm_RAppointmentSchedule02
	@ObjectId numeric(9)
AS
	SELECT *
	  FROM APPOINTMENT_SCHEDULE
	 WHERE OBJECT_ID = @ObjectId


