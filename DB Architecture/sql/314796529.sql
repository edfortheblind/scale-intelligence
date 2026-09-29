-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */























CREATE PROCEDURE wm_RUReceiptHeader01
	@Sts numeric(3),
	@BatchId nvarchar(50),
	@filterCriteriaName nvarchar(25),
	@filterWarehouse nvarchar(25)
AS
	DECLARE @ParmDefinition nvarchar(500); 
	DECLARE @filterCriteria nvarchar(max);
	DECLARE @filterStatement nvarchar(max);
	DECLARE @SQLString nvarchar(max); 
	DECLARE @WarehouseDate datetime;

	SELECT @WarehouseDate = dbo.GetWarehouseTimezoneValue( @filterWarehouse,null);
	IF (@filterCriteriaName IS NOT NULL AND @filterCriteriaName <> N'<literal:1>')
	BEGIN
		SET @filterStatement = (SELECT FILTER_STATEMENT FROM FILTER_CONFIG_DETAIL WHERE FILTER_NAME = @filterCriteriaName  and record_type = N'<literal:2>')
		-- [comment omitted]
		SET @filterCriteria = (SELECT SUBSTRING(@filterStatement, CHARINDEX(N'<literal:3>', @filterStatement)+5, LEN(@filterStatement)))
	END
	
	-- [comment omitted]
	SET @SQLString = N'<literal:4>'









	IF (@filterCriteriaName IS NOT NULL AND @filterCriteriaName <> N'<literal:5>')
	BEGIN
		SET @SQLString = @SQLString + N'<literal:6>' + @filterCriteria + N'<literal:7>';
	END

	SET @ParmDefinition = N'<literal:8>';
	EXECUTE sp_executesql @SQLString, @ParmDefinition, @Sts, @BatchId, @WarehouseDate;
	
	-- [comment omitted]
	SET @SQLString = N'<literal:9>'








	IF (@filterCriteriaName IS NOT NULL AND @filterCriteriaName <> N'<literal:10>')
	BEGIN
		SET @SQLString = @SQLString + N'<literal:11>' + @filterCriteria + N'<literal:12>';
	END

	SET @ParmDefinition = N'<literal:13>';
	EXECUTE sp_executesql @SQLString, @ParmDefinition, @BatchId, @WarehouseDate;	

	-- [comment omitted]

	SET @SQLString = N'<literal:14>'













	IF (@filterCriteriaName IS NOT NULL AND @filterCriteriaName <> N'<literal:15>')
	BEGIN
		SET @SQLString = @SQLString + N'<literal:16>' + @filterCriteria + N'<literal:17>';
	END
	SET @ParmDefinition = N'<literal:18>';
	EXECUTE sp_executesql @SQLString, @ParmDefinition, @BatchId, @WarehouseDate;   

	-- [comment omitted]
			
	SET @SQLString = N'<literal:19>'











	IF (@filterCriteriaName IS NOT NULL AND @filterCriteriaName <> N'<literal:20>')
	BEGIN
		SET @SQLString = @SQLString + N'<literal:21>' + @filterCriteria + N'<literal:22>';
	END
	SET @ParmDefinition = N'<literal:23>';
	EXECUTE sp_executesql @SQLString, @ParmDefinition, @BatchId, @WarehouseDate;
				
		

	SELECT * FROM RECEIPT_HEADER
	WHERE INTERNAL_RECEIPT_NUM 
	IN 
		(SELECT INTERNAL_RECEIPT_NUM 
			FROM RECEIPT_CONTAINER
			WHERE UPLOAD_INTERFACE_BATCH = @BatchId)
	UNION
	SELECT * FROM RECEIPT_HEADER
	WHERE UPLOAD_INTERFACE_BATCH = @BatchId	



