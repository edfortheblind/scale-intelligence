-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */










CREATE FUNCTION INVfn_GetAvailableQuantity(
	@location nvarchar(25),
	@warehouse nvarchar(25),
	@item nvarchar(50),
	@company nvarchar(25),
	@lot nvarchar(25),
	@logisticsUnit nvarchar(50),
	@locInvAttributesID numeric(9),
	@showAllLPInvAttributes nchar(1),
	@includeInvAttributes nchar(1),
	@expirationDate datetime = null, 
	@inventorySts nvarchar(50) = null)

returns numeric(19,5)

begin
	declare @availableQty numeric(19,5);
	set @availableQty = 0;
	
	IF (@showAllLPInvAttributes = N'<literal:1>')	
		BEGIN
			SELECT @availableQty = sum(CASE L.ALLOCATE_IN_TRANSIT
				WHEN N'<literal:2>' THEN ON_HAND_QTY + IN_TRANSIT_QTY - ALLOCATED_QTY - SUSPENSE_QTY
				ELSE ON_HAND_QTY -ALLOCATED_QTY - SUSPENSE_QTY
				END)
			FROM LOCATION_INVENTORY LI
			INNER JOIN LOCATION L ON L.LOCATION = LI.LOCATION AND L.WAREHOUSE = LI.WAREHOUSE		
			WHERE L.LOCATION = @location
			AND LI.WAREHOUSE = @warehouse
			AND LI.ITEM = @item
			AND ((LI.COMPANY IS NULL and @company is null) or (LI.COMPANY = @company))

			-- [comment omitted]
			AND ((@lot is null) or (LI.LOT = @lot))

			-- [comment omitted]
			AND ((@inventorySts is null) or (LI.INVENTORY_STS = @inventorySts))

			-- [comment omitted]
			AND (@expirationDate is null or (CAST(LI.EXPIRATION_DATE AS DATE) = CAST(@expirationDate AS DATE)))

		END
	
	ELSE IF(@includeInvAttributes = N'<literal:3>')
	
		BEGIN
			SELECT @availableQty = CASE L.ALLOCATE_IN_TRANSIT
				WHEN N'<literal:4>' THEN ON_HAND_QTY + IN_TRANSIT_QTY - ALLOCATED_QTY - SUSPENSE_QTY
				ELSE ON_HAND_QTY -ALLOCATED_QTY - SUSPENSE_QTY
				END
			FROM LOCATION_INVENTORY LI
			LEFT OUTER JOIN LOCATION L ON L.LOCATION = LI.LOCATION AND L.WAREHOUSE = LI.WAREHOUSE
			WHERE
			L.LOCATION = @location
			AND LI.WAREHOUSE = @warehouse
			AND LI.ITEM = @item
			AND ((LI.COMPANY IS NULL and @company is null) or (LI.COMPANY = @company))
			AND ((LI.LOGISTICS_UNIT IS NULL and @logisticsUnit is null) or (LI.LOGISTICS_UNIT = @logisticsUnit) or  (LI.PARENT_LOGISTICS_UNIT = @logisticsUnit))
			
			-- [comment omitted]
			AND ((@lot is null) or (LI.LOT = @lot))

			-- [comment omitted]
			AND ((@inventorySts is null) or (LI.INVENTORY_STS = @inventorySts))
			
			AND (LI.LOC_INV_ATTRIBUTES_ID = @locInvAttributesID
				OR ((LI.LOC_INV_ATTRIBUTES_ID IS NULL OR LI.LOC_INV_ATTRIBUTES_ID = 0 ) 
					   AND (@locInvAttributesID IS NULL OR @locInvAttributesID =0)))

			-- [comment omitted]
			AND (@expirationDate is null or (CAST(LI.EXPIRATION_DATE AS DATE) = CAST(@expirationDate AS DATE)))

	               
		  END         
   ELSE 
	
		BEGIN
			SELECT @availableQty = sum(CASE L.ALLOCATE_IN_TRANSIT
				WHEN N'<literal:5>' THEN ON_HAND_QTY + IN_TRANSIT_QTY - ALLOCATED_QTY - SUSPENSE_QTY
				ELSE ON_HAND_QTY -ALLOCATED_QTY - SUSPENSE_QTY
				END)
			FROM LOCATION_INVENTORY LI
			LEFT OUTER JOIN LOCATION L ON L.LOCATION = LI.LOCATION AND L.WAREHOUSE = LI.WAREHOUSE
			WHERE
			L.LOCATION = @location
			AND LI.WAREHOUSE = @warehouse
			AND LI.ITEM = @item
			AND ((LI.COMPANY IS NULL and @company is null) or (LI.COMPANY = @company))
			AND ((LI.LOGISTICS_UNIT IS NULL and @logisticsUnit is null) or (LI.LOGISTICS_UNIT = @logisticsUnit) or  (LI.PARENT_LOGISTICS_UNIT = @logisticsUnit))

			-- [comment omitted]
			AND ((@lot is null) or (LI.LOT = @lot))
			
			-- [comment omitted]
			AND ((@inventorySts is null) or (LI.INVENTORY_STS = @inventorySts))
			
			-- [comment omitted]
			AND (@expirationDate is null or (CAST(LI.EXPIRATION_DATE AS DATE) = CAST(@expirationDate AS DATE)))
			
		END
	
	return @availableQty;
end
