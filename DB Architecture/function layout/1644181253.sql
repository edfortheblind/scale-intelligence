/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	219648		| MMM			| 03/20/18 | Created.  
	220653		| SHS			| 04/02/18 | Modified to correct week start date in case of mondays

	Returns week start date based on the specified date value, assumes Monday-Sunday as week cycle
*/
CREATE FUNCTION DATEFn_GetWeekStartDate(
	@date datetime = null,
	@warehouse nvarchar(25) = null
)
RETURNS datetime
BEGIN

	-- Get current date time value if date parametre is not passed
	IF @date IS NULL 
	BEGIN
		SET @date = GETUTCDATE();
		IF @warehouse IS NOT NULL 
		BEGIN		
			-- Get the todays date time with warehouse offset
			set @date = dbo.GetWarehouseTimezoneValue(@warehouse, GETUTCDATE())
		END
	END
	
	DECLARE @weekStartDate DATE;

	set @weekStartDate = DATEADD(day, 2 - DATEPART(weekday, @date), @date);
	
	RETURN @weekStartDate;
END