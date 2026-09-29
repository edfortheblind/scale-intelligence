-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */















CREATE PROCEDURE INV_InsertLocation(
	@stLoc nvarchar(25),
	@stUserName nvarchar(30),
	@stWhs nvarchar(25))

AS
	SET NOCOUNT ON;

	-- [comment omitted]

	INSERT INTO LOCATION
		(ACTIVE, DATE_TIME_STAMP, LAST_CYCLE_COUNT_DATE, LOCATION, 
		 LOCATION_CLASS, LOCATION_STS, MULTI_ITEM, PICKING_SEQ,
		 PROCESS_STAMP, PUTAWAY_SEQ, TEMPLATE_FIELD1, TRACK_CONTAINERS, 
		 USER_STAMP, VERIFICATION_METH, WAREHOUSE)
	VALUES
		(N'<literal:1>', GETUTCDATE(), CONVERT(date,dbo.GetWarehouseTimezoneValue(@stWhs,null)), @stLoc,
		 N'<literal:2>', N'<literal:3>', N'<literal:4>', 0,
		 N'<literal:5>', 0, @stLoc, N'<literal:6>',
		 @stUserName, N'<literal:7>', @stWhs);
	if (@@ERROR <> 0) return -1;
-- [comment omitted]
