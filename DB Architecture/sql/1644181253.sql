-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE FUNCTION DATEFn_GetWeekStartDate(
	@date datetime = null,
	@warehouse nvarchar(25) = null
)
RETURNS datetime
BEGIN

	-- [comment omitted]
	IF @date IS NULL 
	BEGIN
		SET @date = GETUTCDATE();
		IF @warehouse IS NOT NULL 
		BEGIN		
			-- [comment omitted]
			set @date = dbo.GetWarehouseTimezoneValue(@warehouse, GETUTCDATE())
		END
	END
	
	DECLARE @weekStartDate DATE;

	set @weekStartDate = DATEADD(day, 2 - DATEPART(weekday, @date), @date);
	
	RETURN @weekStartDate;
END