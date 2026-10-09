/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	224422  | MHM	| 05/21/18	| Created.	
*/
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

	RETURN CONVERT(date,@date AT TIME ZONE N'UTC' AT TIME ZONE @timezoneId)
 END
	