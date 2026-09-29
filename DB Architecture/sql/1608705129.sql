-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */









-- [comment omitted]


CREATE PROCEDURE INV_ValidateSerialNums(	
	@dQuantity numeric(19,5),	
	@stCompany nvarchar(25),	
	@stFromContId nvarchar(50),
	@stFromLoc nvarchar(25),	
	@stFromWhs nvarchar(25),	
	@stItem nvarchar(50),	
	@stLot nvarchar(25),		
	@stRecContID nvarchar(25),					
	@stTransType nvarchar(50),	
	@argumentGroupId nvarchar(32),
	@fromLocInvAttributeId numeric(9) = NULL)

AS
	SET NOCOUNT ON;

	declare @iRowCount int;
	declare @iIntLocInv numeric(9);
						
	SELECT @iIntLocInv = LI.INTERNAL_LOCATION_INV
		FROM LOCATION_INVENTORY LI ,
	  		LOCATION LOC
			WHERE LOC.LOCATION = LI.LOCATION
			AND LOC.WAREHOUSE = LI.WAREHOUSE	
			AND LI.LOCATION = @stFromLoc
			AND LI.WAREHOUSE = @stFromWhs
			AND LI.ITEM = @stItem
			AND (LI.COMPANY IS NULL OR (ISNULL(LI.COMPANY,N'<literal:1>') = ISNULL(@stCompany,N'<literal:2>')))
            AND (
			ISNULL(LI.LOC_INV_ATTRIBUTES_ID,0) = ISNULL(@fromLocInvAttributeId,0)	
			OR (LI.LOC_INV_ATTRIBUTES_ID IS NULL AND PERMANENT = N'<literal:3>')			
				)
			AND (
			ISNULL(LOT,N'<literal:4>') = ISNULL(@stLot,N'<literal:5>')
			OR (LOT IS NULL AND PERMANENT = N'<literal:6>')
			    )
			   
			AND (
			   	LOGISTICS_UNIT = @stRecContID
			   	OR
				(ISNULL(LOGISTICS_UNIT,N'<literal:7>')  = ISNULL(@stFromContId,N'<literal:8>')
						OR (LOGISTICS_UNIT IS NULL AND PERMANENT = N'<literal:9>'))
			)
			AND (LOC.LOCATION_CLASS=N'<literal:10>' OR LOC.LOCATION_CLASS=N'<literal:11>' OR LOC.LOCATION_CLASS=N'<literal:12>');
	
	SELECT @iRowCount = @@ROWCOUNT;

	declare @serialNumTracking int;
	set @serialNumTracking=(SELECT ISNULL(SERIAL_NUM_TRACKING, 0) FROM ITEM 
							WHERE ITEM = @stItem 
							AND (COMPANY = @stCompany OR COMPANY IS NULL));
			
	-- [comment omitted]
	if(@iRowCount > 0 AND @argumentGroupId IS NOT NULL 
		AND (@stTransType=N'<literal:13>' OR @stTransType=N'<literal:14>' OR @stTransType=N'<literal:15>' OR @stTransType=N'<literal:16>' OR @stTransType=N'<literal:17>' OR @stTransType=N'<literal:18>') AND @serialNumTracking=7)
	BEGIN
				
		declare @serialNumbersCount int;

		set @serialNumbersCount =(SELECT COUNT(*) FROM INVENTORY_ARGUMENT 
				WHERE GROUP_ID = @argumentGroupId
				AND ARGUMENT_NAME = N'<literal:19>');

		-- [comment omitted]
		if(@serialNumbersCount>0)
		BEGIN
					
			declare @numberOfMajorSerialNumsAtTheInvLoc int;

			set @numberOfMajorSerialNumsAtTheInvLoc=0;

			set @numberOfMajorSerialNumsAtTheInvLoc = 
			(SELECT COUNT(DISTINCT(GROUP_ID)) from SERIAL_NUMBER 
				WHERE OBJECT_ID IN 
					(SELECT ARGUMENT_VALUE FROM INVENTORY_ARGUMENT 
					WHERE GROUP_ID = @argumentGroupId
					AND ARGUMENT_NAME = N'<literal:20>') 
				AND LOC_INV_NUM = @iIntLocInv);

			-- [comment omitted]
			IF(@numberOfMajorSerialNumsAtTheInvLoc <> @dQuantity)					
			BEGIN				
				RAISERROR(N'<literal:21>' , 18, 1,@stFromLoc); 
				return -1;
			END				
		END

	END
	

