/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	219206	| MHM	| 02/16/18	| Created.
	219206	| MHM	| 04/03/18	| Fixed the collation issue.
	220775  | MJ    | 04/11/18  | Modified @date input parameter to null. 
	221909	| SO	| 05/08/18	| Modified to use AT TIME ZONE function to get warehouse date.
	224171	| SO	| 05/10/18	| Modified to return date time.
	224287	| SO	| 05/10/18	| Modified to remove hardcoded value.
	  	
*/
CREATE FUNCTION GetWarehouseTimezoneValue
 (
 @warehouse nvarchar(25),
 @date datetime = null
 )
RETURNS DATETIME
AS
 BEGIN 
	SET @date = ISNULL(@date, GETUTCDATE());	
	declare @timezoneid nvarchar(50)
	select @timezoneId=time_zone from WAREHOUSE where warehouse=@warehouse

	RETURN @date AT TIME ZONE N'UTC' AT TIME ZONE @timezoneId
 END
	