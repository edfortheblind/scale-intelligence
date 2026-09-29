-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE procedure [dbo].[REC_CreateNewUniqueContainerId]
(
	@containerId	nvarchar(25)
)
AS
	SET NOCOUNT ON;
	
	DECLARE @newContainerID			numeric(25);
	DECLARE @duplicateCount numeric(10)
	-- [comment omitted]
	SELECT @duplicateCount = (( SELECT COUNT(INTERNAL_LOCATION_INV) FROM LOCATION_INVENTORY WHERE LOGISTICS_UNIT=@containerId OR PARENT_LOGISTICS_UNIT=@containerId ) 
			+ 
			( SELECT COUNT(INTERNAL_REC_CONT_NUM) FROM RECEIPT_CONTAINER WHERE CONTAINER_ID=@containerId))
	
	-- [comment omitted]
	IF (@duplicateCount <> 0)
	BEGIN
		-- [comment omitted]
		SELECT @newContainerID =  CAST( MAX(MAXVAL)  AS NUMERIC(26)) FROM 
		(  
			(SELECT  MAX(CASE WHEN ( IsNumeric(LOGISTICS_UNIT) = 1  AND LOGISTICS_UNIT not like  N'<literal:1>' and LEN(LOGISTICS_UNIT) <= 25 ) THEN  TRY_CAST(LOGISTICS_UNIT AS numeric(25,0)) END) + 1 AS MAXVAL FROM LOCATION_INVENTORY ) 
				UNION  
			(SELECT  MAX(CASE WHEN ( IsNumeric(CONTAINER_ID) = 1  AND CONTAINER_ID not like  N'<literal:2>' and LEN(CONTAINER_ID) <= 25 ) THEN  TRY_CAST(CONTAINER_ID AS numeric(25,0)) END) + 1 AS MAXVAL FROM RECEIPT_CONTAINER ) 
				UNION  
			(SELECT  MAX(CASE WHEN ( IsNumeric(PARENT_LOGISTICS_UNIT) = 1  AND PARENT_LOGISTICS_UNIT not like  N'<literal:3>' and LEN(PARENT_LOGISTICS_UNIT) <= 25  ) THEN  TRY_CAST(PARENT_LOGISTICS_UNIT AS numeric(25,0)) END) + 1 AS MAXVAL FROM LOCATION_INVENTORY )
		) AS MAXVALS
		
		IF (@newContainerID >= 9999999999999999999999999)
		BEGIN
			SELECT @newContainerID = 1
			WHILE (exists(SELECT 1 FROM LOCATION_INVENTORY WHERE LOGISTICS_UNIT = CAST(@newContainerID as nvarchar(25)))
				  or exists(SELECT 1 FROM LOCATION_INVENTORY WHERE PARENT_LOGISTICS_UNIT = CAST(@newContainerID as nvarchar(25)))
				  or exists(SELECT 1 FROM RECEIPT_CONTAINER WHERE CONTAINER_ID = CAST(@newContainerID as nvarchar(25))))
			BEGIN
				SELECT @newContainerID = @newContainerID + 1
			END
		END
		
		SELECT @newContainerID
	END
	ELSE
	BEGIN
		SELECT @newContainerID = @containerId
	END
	
	-- [comment omitted]
	UPDATE RECEIPT_CONTAINER 
	SET CONTAINER_ID = @newContainerID
	WHERE INTERNAL_REC_CONT_NUM = @containerId
	
	SELECT @newContainerID;