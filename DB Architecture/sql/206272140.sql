-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
CREATE PROCEDURE ValidateSerialNumberIsUnique (
@objectId numeric(9) = null,
@serialNum nvarchar(50) = null,
@allowDuplicates nchar(1) = null,
@templateId numeric(9) = null,
@locInvNum numeric(9) = null,
@recContNum numeric(9) = null,
@shipContNum numeric(9) = null)
AS
	SET NOCOUNT ON;				
	DECLARE @item nvarchar(50);
	DECLARE @company nvarchar(25);

	DECLARE @allowDuplicateSNInDB NCHAR(1) 
	DECLARE @serialNumCount INTEGER
    SET @allowDuplicateSNInDB = (SELECT SYSTEM_VALUE FROM SYSTEM_CONFIG_DETAIL WHERE RECORD_TYPE=N'<literal:1>' AND SYS_KEY = N'<literal:2>');
	-- [comment omitted]
	IF (@recContNum <> 0)
	BEGIN	
		SELECT @item =ITEM ,@company = COMPANY FROM RECEIPT_CONTAINER WHERE INTERNAL_REC_CONT_NUM = @recContNum;
	END
	ELSE IF (@locInvNum <> 0)
	BEGIN
		SELECT @item =ITEM ,@company = COMPANY FROM LOCATION_INVENTORY WHERE INTERNAL_LOCATION_INV = @locInvNum;
	END
	ELSE IF (@shipContNum <> 0)
	BEGIN
		SELECT @item =ITEM ,@company = COMPANY FROM SHIPPING_CONTAINER WHERE INTERNAL_CONTAINER_NUM = @shipContNum;
	END
	-- [comment omitted]
	IF (@allowDuplicateSNInDB = N'<literal:3>')
		BEGIN
			IF (@allowDuplicates = N'<literal:4>')			
			BEGIN
				-- [comment omitted]
				SET @serialNumCount = (SELECT COUNT(1) FROM SERIAL_NUMBER SN,RECEIPT_CONTAINER RC
									WHERE RC.ITEM = @item
									AND ((@company is null AND RC.COMPANY is null) OR (@company = RC.COMPANY))
									AND SN.REC_CONT_NUM = RC.INTERNAL_REC_CONT_NUM
									AND SN.SERIAL_NUMBER = @serialNum
									AND ISNULL(SN.TEMPLATE_ID, 0) = ISNULL(@templateId, 0)
									AND SN.OBJECT_ID <> @objectId
								  )
			    IF(@serialNumCount > 0)
				BEGIN
					select 0;
					return;
				END	
				-- [comment omitted]
				SET @serialNumCount = (SELECT COUNT(1) FROM SERIAL_NUMBER SN,LOCATION_INVENTORY LI
									WHERE LI.ITEM = @item
									AND ((@company is null AND LI.COMPANY is null) OR (@company = LI.COMPANY))
									AND SN.LOC_INV_NUM = LI.INTERNAL_LOCATION_INV
									AND SN.SERIAL_NUMBER = @serialNum
									AND ISNULL(SN.TEMPLATE_ID, 0) = ISNULL(@templateId, 0)
									AND SN.OBJECT_ID <> @objectId
								  )
			    IF(@serialNumCount > 0)
				BEGIN
					select 0;
					return;
				END	
				-- [comment omitted]
				SET @serialNumCount = (SELECT COUNT(1) FROM SERIAL_NUMBER SN,SHIPPING_CONTAINER SC
									WHERE SC.ITEM = @item
									AND ((@company is null AND SC.COMPANY is null) OR (@company = SC.COMPANY))
									AND SN.SHIP_CONT_NUM = SC.INTERNAL_CONTAINER_NUM
									AND SN.SERIAL_NUMBER = @serialNum
									AND ISNULL(SN.TEMPLATE_ID, 0) = ISNULL(@templateId, 0)
									AND SN.OBJECT_ID <> @objectId
								  )
			    IF(@serialNumCount > 0)
				BEGIN
					select 0;
					return;
				END	
			END		
			ELSE
			BEGIN
				-- [comment omitted]
				SET @serialNumCount = (
					SELECT COUNT(1)
					FROM SERIAL_NUMBER AS SN
					INNER JOIN RECEIPT_CONTAINER AS RC 
						ON SN.REC_CONT_NUM = RC.INTERNAL_REC_CONT_NUM
					WHERE 
						SERIAL_NUMBER = @serialNum 
						AND OBJECT_ID <> @objectId
						AND RC.ITEM = @item 
				)
				if(@serialNumCount > 0)
				BEGIN
					select 0;
					return;
				END
				-- [comment omitted]
				SET @serialNumCount = (
					SELECT COUNT(1)
					FROM SERIAL_NUMBER AS SN
					INNER JOIN LOCATION_INVENTORY AS LI 
						ON SN.LOC_INV_NUM = LI.INTERNAL_LOCATION_INV
					WHERE 
						SERIAL_NUMBER = @serialNum 
						AND OBJECT_ID <> @objectId
						AND LI.ITEM = @item 
				)
				if(@serialNumCount > 0)
				BEGIN
					select 0;
					return;
				END
				-- [comment omitted]
				SET @serialNumCount = (
					SELECT COUNT(1)
					FROM SERIAL_NUMBER AS SN
					INNER JOIN SHIPPING_CONTAINER AS SC 
						ON SN.SHIP_CONT_NUM = SC.INTERNAL_CONTAINER_NUM
					WHERE 
						SERIAL_NUMBER = @serialNum 
						AND OBJECT_ID <> @objectId
						AND SC.ITEM = @item 
				)
				if(@serialNumCount > 0)
				BEGIN
					select 0;
					return;
				END		
			END		
		END	
	ELSE
		BEGIN
			SET @serialNumCount = (SELECT COUNT(1) FROM SERIAL_NUMBER WHERE SERIAL_NUMBER = @serialNum AND OBJECT_ID <> @objectId)
			if(@serialNumCount > 0)
			BEGIN
				select 0;
				return;
			END			
		END	
	select 1;
