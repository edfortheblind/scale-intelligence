-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */












CREATE PROCEDURE wm_RInventory01(@filterCriteriaName nvarchar(25),@filterWarehouse nvarchar(25))
AS
	DECLARE @filterCriteria nvarchar(max);
	DECLARE @filterStatement nvarchar(max);
	DECLARE @SQLString nvarchar(max);
	DECLARE @warehouseDate datetime;

	SELECT @warehouseDate = dbo.GetWarehouseTimezoneValue( @filterWarehouse,null);

	IF (@filterCriteriaName IS NOT NULL AND @filterCriteriaName <> N'<literal:1>')
	BEGIN
		SET @filterStatement = (SELECT FILTER_STATEMENT FROM FILTER_CONFIG_DETAIL WHERE FILTER_NAME = @filterCriteriaName and record_type = N'<literal:2>')
		-- [comment omitted]
		SET @filterCriteria = (SELECT SUBSTRING(@filterStatement, CHARINDEX(N'<literal:3>', @filterStatement)+5, LEN(@filterStatement)))
	END

	SET @SQLString = N'<literal:4>'





















































	IF (@filterCriteria IS NOT NULL AND @filterCriteria <> N'<literal:5>')
		BEGIN
			SET @SQLString = @SQLString + N'<literal:6>'
;
		END	 

	SET @SQLString = @SQLString + N'<literal:7>'












;


		IF (@filterCriteria IS NOT NULL AND @filterCriteria <> N'<literal:8>')
		BEGIN
			SET @SQLString = @SQLString + N'<literal:9>' + @filterCriteria + N'<literal:10>';
		END
		SET @SQLString = @SQLString + N'<literal:11>'
;
		EXECUTE sp_executesql @SQLString, N'<literal:12>',@WarehouseDate = @warehouseDate