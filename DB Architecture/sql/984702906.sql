-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */




CREATE FUNCTION GetWarehouseDate
 (
 @warehouse nvarchar(25),
 @date datetime = null
 )
RETURNS DATETIME
AS
 BEGIN 
	SET @date = ISNULL(@date, GETUTCDATE());	
	declare @timezoneid nvarchar(50)
	select @timezoneId=time_zone from WAREHOUSE where warehouse = @warehouse

	RETURN CONVERT(date,@date AT TIME ZONE N'<literal:1>' AT TIME ZONE @timezoneId)
 END
	