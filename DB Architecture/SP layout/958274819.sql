/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
    15114       | BTD           | 12/13/05  | Modified numeric sizes to match increases

*/


CREATE PROCEDURE wm_IWarehouseAlertRequest01
	@InternalAlertReqNum numeric(9) OUTPUT,
	@AlertType nvarchar(25),
	@InternalAlertNum numeric(9),
	@InternalSourceNum numeric(9),
	@Warehouse nvarchar(25),
	@Processed nchar(1),
	@ActivityDateTime datetime,
	@ReviewedDateTime datetime,
	@ReviewedUserStamp nvarchar(25),
	@ClosedDateTime datetime,
	@ClosedUserStamp nvarchar(25),
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
	@Priority numeric(3),
	@Message nvarchar(2000),
	@Identifier1 nvarchar(25)
AS
	INSERT INTO WAREHOUSE_ALERT_REQUEST(
		ACTIVITY_DATE_TIME,
		ALERT_TYPE,
		CLOSED_DATE_TIME,
		CLOSED_USER_STAMP,
		DATE_TIME_STAMP,
		IDENTIFIER1,
		INTERNAL_ALERT_NUM,
		INTERNAL_SOURCE_NUM,
		MESSAGE,
		PRIORITY,
		PROCESS_STAMP,
		PROCESSED,
		REVIEWED_DATE_TIME,
		REVIEWED_USER_STAMP,
		USER_DEF1,
		USER_DEF2,
		USER_DEF3,
		USER_DEF4,
		USER_DEF5,
		USER_DEF6,
		USER_DEF7,
		USER_DEF8,
		USER_STAMP,
		WAREHOUSE
	) VALUES (
		@ActivityDateTime,
		@AlertType,
		@ClosedDateTime,
		@ClosedUserStamp,
		@DateTimeStamp,
		@Identifier1,
		@InternalAlertNum,
		@InternalSourceNum,
		@Message,
		@Priority,
		@ProcessStamp,
		@Processed,
		@ReviewedDateTime,
		@ReviewedUserStamp,
		@UserDef1,
		@UserDef2,
		@UserDef3,
		@UserDef4,
		@UserDef5,
		@UserDef6,
		@UserDef7,
		@UserDef8,
		@UserStamp,
		@Warehouse
	);

SELECT @InternalAlertReqNum = SCOPE_IDENTITY();



