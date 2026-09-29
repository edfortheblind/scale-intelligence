-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

CREATE PROCEDURE wm_UWarehouseAlert01
	@RowsAffected int OUTPUT,
	@InternalAlertNum numeric(9),
	@AlertType nvarchar(25),
	@Priority numeric(3),
	@Action nvarchar(25),
	@Message nvarchar(2000),
	@EmailTemplate nvarchar(500),
	@WebDescription nvarchar(50),
	@Active nchar(1),
	@SystemCreated nchar(1),
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
	@Title nvarchar(50),
	@Description nvarchar(50)
AS
	UPDATE WAREHOUSE_ALERT
	   SET
		ALERT_TYPE=@AlertType,
		PRIORITY=@Priority,
		ACTION=@Action,
		MESSAGE=@Message,
		EMAIL_TEMPLATE=@EmailTemplate,
		WEB_DESCRIPTION=@WebDescription,
		ACTIVE=@Active,
		SYSTEM_CREATED=@SystemCreated,
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
		TITLE=@Title,
		DESCRIPTION=@Description
	 WHERE INTERNAL_ALERT_NUM = @InternalAlertNum

	SET @RowsAffected = @@ROWCOUNT




