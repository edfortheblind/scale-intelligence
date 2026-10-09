/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	149183		| MJ			| 11/11/14	| Created.
*/

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

	SET @ParmDefinition = N'@UMCount int OUTPUT ';
	SET @CurrentRow = 1;		
	SET @UMFound = 0;		

	--find all columns matches QUANTITY_UM or QTY_UM in DB except ARCHIVE tables.
	INSERT INTO @tempTable(TableName,ColumnName)
	SELECT TABLE_NAME,COLUMN_NAME 
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE 
	(@UMType = N'UMQUANTITY' and (COLUMN_NAME LIKE N'%QUANTITY_UM%' or COLUMN_NAME  like N'%QTY_UM%' or COLUMN_NAME  like N'%UNIT_OF_MEASURE%')) OR
	(@UMType = N'UMDIMENSN' and (COLUMN_NAME LIKE N'%DIMENSION_UM%')) OR
	(@UMType = N'UMWEIGHT ' and (COLUMN_NAME LIKE N'%WEIGHT_UM%')) OR
	(@UMType = N'UMVOLUME ' and (COLUMN_NAME LIKE N'%VOLUME_UM%')) AND
	TABLE_NAME not like N'AR_%'
	ORDER BY TABLE_NAME;		

	SET @rowCount = (SELECT COUNT(*) FROM @tempTable) 

	WHILE (@currentRow <= @rowCount)
	BEGIN 
		SELECT @currentColumn = t.ColumnName, @currentTable = t.TableName
		FROM @TempTable t
		WHERE t.RowNumber = @currentRow;
		
		SET @query = 	N'SELECT @UMCount =  COUNT(*) FROM ' + @currentTable + N' WHERE ' + @currentColumn + N'=''' + @UMToDelete + N'''';

		EXECUTE sp_executesql @query, @parmDefinition, @UMCount = @UMCount OUTPUT ; 
		
		IF ( @UMCount > 0)
		BEGIN
			SELECT @UMFound = 1 ;   break;
		END   
			 
		SELECT @CurrentRow = @CurrentRow + 1;
	END		
	
	-----------Check in ELIGIBLE_UMS List---------------------
	
	IF (@UMFound = 0 AND @UMType = N'UMQUANTITY')
	BEGIN
		
		INSERT INTO @UMTable(UM)
		SELECT  ELIGIBLE_UMS FROM ALLOCATION_RULE_DETAIL WHERE ELIGIBLE_UMS like N'%' +  @UMToDelete + N'%'
		UNION
		SELECT  QTY_UM_LIST FROM LOCATION WHERE QTY_UM_LIST like N'%' +  @UMToDelete + N'%';
		
		SET @CurrentRow = 1	;
		SET @rowCount = (SELECT COUNT(*) FROM @UMTable) 
		
		WHILE @currentRow <= @rowCount
		BEGIN
			SELECT @UMList = UM FROM @UMTable WHERE RowNumber = @currentRow;
			

			IF RIGHT(@UMList, 1) <> N','
			SELECT @UMList = @UMList + N','

			DECLARE @Pos    BIGINT,
					@OldPos BIGINT
			SELECT  @Pos    = 1,
					@OldPos = 1

			WHILE   @Pos < LEN(@UMList)
				BEGIN
					SELECT  @Pos = CHARINDEX(N',', @UMList, @OldPos)
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