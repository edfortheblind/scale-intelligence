
CREATE PROCEDURE wm_UUserActivity01
	@RowsAffected int OUTPUT,
	@AutoLogoutInterval numeric(19,5),
	@LogoffNote nvarchar(50)
AS
	UPDATE USER_ACTIVITY
	SET LOGOFF_DATE_TIME = GETUTCDATE(), LOGOFF_NOTE = @LogoffNote
	WHERE LOGOFF_DATE_TIME IS NULL
	AND DATEDIFF(S, LAST_ACTION_DATE_TIME, GETUTCDATE()) / 86400.0 >= @AutoLogoutInterval

	SET @RowsAffected = @@ROWCOUNT



