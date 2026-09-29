-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE ITM_DoesUmReferenceExist
(
 @UMType		NVARCHAR(100),
 @UMToDelete	NVARCHAR(100),
 @UMFound		BIT = 0			OUTPUT
)
AS    
BEGIN  
	SET NOCOUNT ON;

	DECLARE @currentColumn nvarchar(250);
	DECLARE @currentTable nvarchar(250);
	DECLARE @query nvarchar(1000);
	DECLARE @UMCount int;
	DECLARE @parmDefinition nvarchar(500);
	DECLARE @currentRow int;
	DECLARE @rowCount INT
	DECLARE @UMList nvarchar(max)	
	DECLARE @temp table(UM nvarchar(100));
	
	DECLARE @UMTable TABLE(RowNumber INT IDENTITY(1,1),UM NVARCHAR(250));
	DECLARE @tempTable TABLE(RowNumber INT IDENTITY(1,1),TableName NVARCHAR(250), ColumnName NVARCHAR(250));

	SET @ParmDefinition = N'<literal:1>';
	SET @CurrentRow = 1;		
	SET @UMFound = 0;		

	-- [comment omitted]
	INSERT INTO @tempTable(TableName,ColumnName)
	SELECT TABLE_NAME,COLUMN_NAME 
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE 
	(@UMType = N'<literal:2>' and (COLUMN_NAME LIKE N'<literal:3>' or COLUMN_NAME  like N'<literal:4>' or COLUMN_NAME  like N'<literal:5>')) OR
	(@UMType = N'<literal:6>' and (COLUMN_NAME LIKE N'<literal:7>')) OR
	(@UMType = N'<literal:8>' and (COLUMN_NAME LIKE N'<literal:9>')) OR
	(@UMType = N'<literal:10>' and (COLUMN_NAME LIKE N'<literal:11>')) AND
	TABLE_NAME not like N'<literal:12>'
	ORDER BY TABLE_NAME;		

	SET @rowCount = (SELECT COUNT(*) FROM @tempTable) 

	WHILE (@currentRow <= @rowCount)
	BEGIN 
		SELECT @currentColumn = t.ColumnName, @currentTable = t.TableName
		FROM @TempTable t
		WHERE t.RowNumber = @currentRow;
		
		SET @query = 	N'<literal:13>' + @currentTable + N'<literal:14>' + @currentColumn + N'<literal:15>' + @UMToDelete + N'<literal:16>';

		EXECUTE sp_executesql @query, @parmDefinition, @UMCount = @UMCount OUTPUT ; 
		
		IF ( @UMCount > 0)
		BEGIN
			SELECT @UMFound = 1 ;   break;
		END   
			 
		SELECT @CurrentRow = @CurrentRow + 1;
	END		
	
	-- [comment omitted]
	
	IF (@UMFound = 0 AND @UMType = N'<literal:17>')
	BEGIN
		
		INSERT INTO @UMTable(UM)
		SELECT  ELIGIBLE_UMS FROM ALLOCATION_RULE_DETAIL WHERE ELIGIBLE_UMS like N'<literal:18>' +  @UMToDelete + N'<literal:19>'
		UNION
		SELECT  QTY_UM_LIST FROM LOCATION WHERE QTY_UM_LIST like N'<literal:20>' +  @UMToDelete + N'<literal:21>';
		
		SET @CurrentRow = 1	;
		SET @rowCount = (SELECT COUNT(*) FROM @UMTable) 
		
		WHILE @currentRow <= @rowCount
		BEGIN
			SELECT @UMList = UM FROM @UMTable WHERE RowNumber = @currentRow;
			

			IF RIGHT(@UMList, 1) <> N'<literal:22>'
			SELECT @UMList = @UMList + N'<literal:23>'

			DECLARE @Pos    BIGINT,
					@OldPos BIGINT
			SELECT  @Pos    = 1,
					@OldPos = 1

			WHILE   @Pos < LEN(@UMList)
				BEGIN
					SELECT  @Pos = CHARINDEX(N'<literal:24>', @UMList, @OldPos)
					INSERT INTO @temp
					SELECT  LTRIM(RTRIM(SUBSTRING(@UMList, @OldPos, @Pos - @OldPos))) UM

					SELECT  @OldPos = @Pos + 1
				END

			IF EXISTS(SELECT TOP 1* FROM @temp WHERE UM = @UMToDelete)
			BEGIN
				SELECT @UMFound = 1 ;   BREAK;
			END
		END	
	END		
END