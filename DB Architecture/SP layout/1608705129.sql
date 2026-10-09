/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	260752		| NRJ			| 11/09/2020| Created.			
	260752		| NRJ			| 01/05/2020| Modified to validate only for inventory tracked serial number items.
	263598		| NRJ			| 02/09/2021| Included putaway confirmation transaction as well to validate serial nums.
	264021		| NRJ			| 02/12/2021| Modified to include 120 and 460 transaction types for serial number checks.
	255791		| NRJ			| 03/03/2021| Modified to change error text.
*/

-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;


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
			AND (LI.COMPANY IS NULL OR (ISNULL(LI.COMPANY,N'!') = ISNULL(@stCompany,N'!')))
            AND (
			ISNULL(LI.LOC_INV_ATTRIBUTES_ID,0) = ISNULL(@fromLocInvAttributeId,0)	
			OR (LI.LOC_INV_ATTRIBUTES_ID IS NULL AND PERMANENT = N'Y')			
				)
			AND (
			ISNULL(LOT,N'!') = ISNULL(@stLot,N'!')
			OR (LOT IS NULL AND PERMANENT = N'Y')
			    )
			   
			AND (
			   	LOGISTICS_UNIT = @stRecContID
			   	OR
				(ISNULL(LOGISTICS_UNIT,N'!')  = ISNULL(@stFromContId,N'!')
						OR (LOGISTICS_UNIT IS NULL AND PERMANENT = N'Y'))
			)
			AND (LOC.LOCATION_CLASS=N'Inventory' OR LOC.LOCATION_CLASS=N'Equipment' OR LOC.LOCATION_CLASS=N'Shipping Dock');
	
	SELECT @iRowCount = @@ROWCOUNT;

	declare @serialNumTracking int;
	set @serialNumTracking=(SELECT ISNULL(SERIAL_NUM_TRACKING, 0) FROM ITEM 
							WHERE ITEM = @stItem 
							AND (COMPANY = @stCompany OR COMPANY IS NULL));
			
	--Validate serial numbers exists in the from location.
	if(@iRowCount > 0 AND @argumentGroupId IS NOT NULL 
		AND (@stTransType=N'40' OR @stTransType=N'120' OR @stTransType=N'130' OR @stTransType=N'140' OR @stTransType=N'460' OR @stTransType=N'360') AND @serialNumTracking=7)
	BEGIN
				
		declare @serialNumbersCount int;

		set @serialNumbersCount =(SELECT COUNT(*) FROM INVENTORY_ARGUMENT 
				WHERE GROUP_ID = @argumentGroupId
				AND ARGUMENT_NAME = N'SERIALNUMBER');

		--if serial numbers exist for augument group Id.
		if(@serialNumbersCount>0)
		BEGIN
					
			declare @numberOfMajorSerialNumsAtTheInvLoc int;

			set @numberOfMajorSerialNumsAtTheInvLoc=0;

			set @numberOfMajorSerialNumsAtTheInvLoc = 
			(SELECT COUNT(DISTINCT(GROUP_ID)) from SERIAL_NUMBER 
				WHERE OBJECT_ID IN 
					(SELECT ARGUMENT_VALUE FROM INVENTORY_ARGUMENT 
					WHERE GROUP_ID = @argumentGroupId
					AND ARGUMENT_NAME = N'SERIALNUMBER') 
				AND LOC_INV_NUM = @iIntLocInv);

			--if number of serial nums not matching to the quantity, throw error for adjustments.
			IF(@numberOfMajorSerialNumsAtTheInvLoc <> @dQuantity)					
			BEGIN				
				RAISERROR(N'Serial numbers do not exist in the location : %s or does not match with the quantity on transaction.' , 18, 1,@stFromLoc); 
				return -1;
			END				
		END

	END
	

