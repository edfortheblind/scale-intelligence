-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE FUNCTION INVfn_GetAvailableQuantityWithoutInTransit(
	@location nvarchar(25),
	@warehouse nvarchar(25),
	@item nvarchar(50),
	@company nvarchar(25),
	@lot nvarchar(25),
	@logisticsUnit nvarchar(50),
	@locInvAttributesID numeric(9),
	@showAllLPInvAttributes nchar(1),
	@includeInvAttributes nchar(1))

returns numeric(19,5)

begin
	declare @availableQty numeric(19,5);
	set @availableQty = 0;
	
	IF (@showAllLPInvAttributes = N'<literal:1>')	
		BEGIN
			SELECT @availableQty = sum(ON_HAND_QTY - ALLOCATED_QTY - SUSPENSE_QTY)
			
			FROM LOCATION_INVENTORY LI
			INNER JOIN LOCATION L ON L.LOCATION = LI.LOCATION AND L.WAREHOUSE = LI.WAREHOUSE		
			WHERE L.LOCATION = @location
			AND LI.WAREHOUSE = @warehouse
			AND LI.ITEM = @item
			AND ((LI.COMPANY IS NULL and @company is null) or (LI.COMPANY = @company))

			-- [comment omitted]
			AND ((@lot is null) or (LI.LOT = @LOT))
		END
	
	ELSE IF(@includeInvAttributes = N'<literal:2>')
	
		BEGIN
			SELECT @availableQty = (ON_HAND_QTY -ALLOCATED_QTY - SUSPENSE_QTY)
				
			FROM LOCATION_INVENTORY LI
			LEFT OUTER JOIN LOCATION L ON L.LOCATION = LI.LOCATION AND L.WAREHOUSE = LI.WAREHOUSE
			WHERE
			L.LOCATION = @location
			AND LI.WAREHOUSE = @warehouse
			AND LI.ITEM = @item
			AND ((LI.COMPANY IS NULL and @company is null) or (LI.COMPANY = @company))
			AND ((LI.LOGISTICS_UNIT IS NULL and @logisticsUnit is null) or (LI.LOGISTICS_UNIT = @logisticsUnit))
			AND ((LI.LOT IS NULL and @lot is null) or (LI.LOT = @LOT))
			
			-- [comment omitted]
			AND ((@lot is null) or (LI.LOT = @LOT))
			
			AND (LI.LOC_INV_ATTRIBUTES_ID = @locInvAttributesID
				OR ((LI.LOC_INV_ATTRIBUTES_ID IS NULL OR LI.LOC_INV_ATTRIBUTES_ID = 0 ) 
					   AND (@locInvAttributesID IS NULL OR @locInvAttributesID =0)))
	               
		  END         
   ELSE 
	
		BEGIN
			SELECT @availableQty = sum(ON_HAND_QTY -ALLOCATED_QTY - SUSPENSE_QTY)
			FROM LOCATION_INVENTORY LI
			LEFT OUTER JOIN LOCATION L ON L.LOCATION = LI.LOCATION AND L.WAREHOUSE = LI.WAREHOUSE
			WHERE
			L.LOCATION = @location
			AND LI.WAREHOUSE = @warehouse
			AND LI.ITEM = @item
			AND ((LI.COMPANY IS NULL and @company is null) or (LI.COMPANY = @company))
			AND ((LI.LOGISTICS_UNIT IS NULL and @logisticsUnit is null) or (LI.LOGISTICS_UNIT = @logisticsUnit))
			-- [comment omitted]
			AND ((@lot is null) or (LI.LOT = @LOT))
			
		END
	
	return @availableQty;
end

