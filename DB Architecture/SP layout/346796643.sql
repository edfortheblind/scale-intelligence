/*
	Task 	| Programmer	| Date   	| Description
	--------|---------------|---------------------------------------
	13543	| KMD			| 11/05/04	| Also upload manually closed receipts; break update into three statements 
	16514	| KMD			| 04/05/05	| Change criteria; upload all eligible logical containers, and any related physical containers
	19223	| VK			| 10/16/06	| Fixed to mark the receipts which have status greater than passed in status
	9898	| SMS			| 09/05/07	| Fixed to upload receipts which are closed and without containers
	30040	| BB			| 06/26/08	| Removed the update statement which marked the all the container in the
										| closed receipt as to be uploaded.
	51213	| MDL			| 05/11/09  | Replace <> NULL with IS NOT NULL	
	103962	| NRJ			| 11/02/12	| Included flag setting "Upload Receipt Details with 0 Quantity Received".
	107608  | KSS           | 02/18/13  | Include the OR condition with the receipt header update query. 
	139774	| DN			| 04/08/14	| Modified to use temporary variable for updating receipt container batch id row by row				
	176880	| NRJ			| 04/05/16	| modified such that interface batch id on the receipt header gets updated properly.	
	191074	| DN			| 01/23/17	| Updated parameter types		
	216263	| SHS			| 12/06/17	| Modified to add support for filter criteria		
	216969	| SHS			| 12/17/17	| Added record type condition
	216303	| MK			| 12/13/17	| Modified to consider Company config and Warehouse config.
	215965	| SHS			| 12/20/17	| Modified to consider Company config and Warehouse config for upload 0 qty receipts.
	217345	| SHS			| 01/03/17	| Modified to join Compnay and Warehouse with Header instead of detail
	220776	| SO			| 04/18/18	| Modified to pass warehouse as parameter.
	221909	| SO			| 05/08/18	| Modified to improve performance of filter statement.
	221171	| MK			| 05/10/18	| Modified to upload manually closed receipt which is partially checked in.		
*/

CREATE PROCEDURE wm_RUReceiptHeader03
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
	IF (@filterCriteriaName IS NOT NULL AND @filterCriteriaName <> N'')
	BEGIN
		SET @filterStatement = (SELECT FILTER_STATEMENT FROM FILTER_CONFIG_DETAIL WHERE FILTER_NAME = @filterCriteriaName and record_type = N'RECINTUPLCRIT')
		--fetch only where condition
		SET @filterCriteria = (SELECT SUBSTRING(@filterStatement, CHARINDEX(N'WHERE', @filterStatement)+5, LEN(@filterStatement)))
	END
	
	-- add logical containers, ready for upload into the temporary variable
	SET @SQLString = N'
	UPDATE RECEIPT_CONTAINER
	SET UPLOAD_INTERFACE_BATCH = @PBatchID
	FROM RECEIPT_CONTAINER
	INNER JOIN RECEIPT_HEADER ON RECEIPT_HEADER.INTERNAL_RECEIPT_NUM = RECEIPT_CONTAINER.INTERNAL_RECEIPT_NUM
	WHERE RECEIPT_CONTAINER.UPLOAD_INTERFACE_BATCH is null
	AND RECEIPT_CONTAINER.STATUS >= @PSts
	AND ISNULL(RECEIPT_CONTAINER.INTERNAL_RECEIPT_LINE_NUM, 0) > 0
	AND RECEIPT_CONTAINER.UPLOAD_INTERFACE_BATCH IS NULL 
	AND ((RECEIPT_HEADER.LEADING_STS >= @PSts AND RECEIPT_HEADER.TRAILING_STS >= @PSts)
		OR (RECEIPT_HEADER.CLOSE_DATE IS NOT NULL
			AND @PSts <= (SELECT MIN(IRC.STATUS)
						FROM RECEIPT_CONTAINER IRC
						WHERE IRC.INTERNAL_RECEIPT_NUM = RECEIPT_CONTAINER.INTERNAL_RECEIPT_NUM)
		   )
		)  
	'

	IF (@filterCriteriaName IS NOT NULL AND @filterCriteriaName <> N'')
	BEGIN
		SET @SQLString = @SQLString + N' AND ' + @filterCriteria + N' ; ';
	END

	SET @ParmDefinition = N'@PSts numeric(3) , @PBatchId nvarchar(50), @WarehouseDate DATETIME';
	EXECUTE sp_executesql @SQLString, @ParmDefinition, @Sts, @BatchId, @WarehouseDate;
	
	-- add physical containers for any logical container in this batch into the temporary variable
	SET @SQLString = N'
	UPDATE RECEIPT_CONTAINER
	SET UPLOAD_INTERFACE_BATCH = @PBatchID
	FROM RECEIPT_CONTAINER
	INNER JOIN RECEIPT_HEADER ON RECEIPT_HEADER.INTERNAL_RECEIPT_NUM = RECEIPT_CONTAINER.INTERNAL_RECEIPT_NUM
	WHERE RECEIPT_CONTAINER.UPLOAD_INTERFACE_BATCH IS NULL 
	AND ISNULL(RECEIPT_CONTAINER.INTERNAL_RECEIPT_LINE_NUM, 0) = 0
	AND RECEIPT_CONTAINER.INTERNAL_REC_CONT_NUM IN (SELECT PARENT FROM RECEIPT_CONTAINER WHERE UPLOAD_INTERFACE_BATCH = @PBatchID)  '

	IF (@filterCriteriaName IS NOT NULL AND @filterCriteriaName <> N'')
	BEGIN
		SET @SQLString = @SQLString + N' AND ' + @filterCriteria + N' ; ';
	END

	SET @ParmDefinition = N'@PBatchId nvarchar(50), @WarehouseDate DATETIME';
	EXECUTE sp_executesql @SQLString, @ParmDefinition, @BatchId, @WarehouseDate;
	
	--UPLOAD RECEIPT LINES WITH ZERO QTY 
			
	SET @SQLString = N'
	UPDATE RECEIPT_HEADER   
	SET RECEIPT_HEADER.UPLOAD_INTERFACE_BATCH = @PBatchId
	FROM RECEIPT_HEADER 
	INNER JOIN RECEIPT_DETAIL ReceiptDetail 
	ON RECEIPT_HEADER.INTERNAL_RECEIPT_NUM=ReceiptDetail.INTERNAL_RECEIPT_NUM
	INNER JOIN WAREHOUSE WHS
	ON WHS.WAREHOUSE = ReceiptDetail.WAREHOUSE
	LEFT JOIN COMPANY CMP
	ON CMP.COMPANY = ReceiptDetail.COMPANY
	WHERE RECEIPT_HEADER.UPLOAD_INTERFACE_BATCH IS NULL
	AND RECEIPT_HEADER.CLOSE_DATE IS NOT NULL
	AND ((ReceiptDetail.COMPANY IS NOT NULL  AND CMP.UPLOAD_REC_LINES_ZERO_QTY = ''Y'')
	OR  (ReceiptDetail.WAREHOUSE IS NOT NULL AND WHS.UPLOAD_REC_LINES_ZERO_QTY = ''Y''))'
	IF (@filterCriteriaName IS NOT NULL AND @filterCriteriaName <> N'')
	BEGIN
		SET @SQLString = @SQLString + N' AND ' + @filterCriteria + N' ; ';
	END
	SET @ParmDefinition = N'@PBatchId nvarchar(50), @WarehouseDate DATETIME';
	EXECUTE sp_executesql @SQLString, @ParmDefinition, @BatchId, @WarehouseDate; 

	--UPLOAD RECEIPT WITH ZERO QTY
			
	SET @SQLString = N'
	UPDATE RECEIPT_HEADER 
	SET UPLOAD_INTERFACE_BATCH = @PBatchId
	FROM RECEIPT_HEADER
	INNER JOIN WAREHOUSE WHS ON WHS.WAREHOUSE = RECEIPT_HEADER.WAREHOUSE
	LEFT JOIN COMPANY CMP ON CMP.COMPANY = RECEIPT_HEADER.COMPANY 	
	WHERE UPLOAD_INTERFACE_BATCH IS NULL
	AND CLOSE_DATE IS NOT NULL 
	AND TOTAL_CONTAINERS=0 
	AND ((RECEIPT_HEADER.COMPANY IS NOT NULL AND CMP.UPLOAD_CLOSED_RECEIPT_ZERO_QTY = ''Y'')
	OR  (RECEIPT_HEADER.WAREHOUSE IS NOT NULL AND RECEIPT_HEADER.COMPANY IS NULL  AND WHS.UPLOAD_CLOSED_RECEIPT_ZERO_QTY = ''Y'')) '

	IF (@filterCriteriaName IS NOT NULL AND @filterCriteriaName <> N'')
	BEGIN
		SET @SQLString = @SQLString + N' AND ' + @filterCriteria + N' ; ';
	END
	SET @ParmDefinition = N'@PBatchId nvarchar(50), @WarehouseDate DATETIME';
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
		

