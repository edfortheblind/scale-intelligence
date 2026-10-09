/*
	Mod Number	| Programmer	| Date   	  | Modification Description
	----------------------------------------------------------------------
	83950		| TDA			| 04/28/2011  | Removed LI.LOT is null check to support warehouse transfers
	138897		| MJ			| 11/19/2014  | Added Expiration Date	
	156993		| SHS			| 04/14/2015  | Modified to handle scenarios where expiration date is not passed in.
	165473		| RJR			| 10/26/2015  | Added inventory status but did not make it required.
	196770		| RJR			| 01/19/2017  | Only consider date portion of expiration date.
*/


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
	
	IF (@showAllLPInvAttributes = N'Y')	
		BEGIN
			SELECT @availableQty = sum(CASE L.ALLOCATE_IN_TRANSIT
				WHEN N'Y' THEN ON_HAND_QTY + IN_TRANSIT_QTY - ALLOCATED_QTY - SUSPENSE_QTY
				ELSE ON_HAND_QTY -ALLOCATED_QTY - SUSPENSE_QTY
				END)
			FROM LOCATION_INVENTORY LI
			INNER JOIN LOCATION L ON L.LOCATION = LI.LOCATION AND L.WAREHOUSE = LI.WAREHOUSE		
			WHERE L.LOCATION = @location
			AND LI.WAREHOUSE = @warehouse
			AND LI.ITEM = @item
			AND ((LI.COMPANY IS NULL and @company is null) or (LI.COMPANY = @company))

			--Do not check lot is null against the location inventory table as a null value may mean lot was just not specified
			AND ((@lot is null) or (LI.LOT = @lot))

			--Do not check inventorySts is null against the location inventory table as a null value may mean inventorySts was just not specified
			AND ((@inventorySts is null) or (LI.INVENTORY_STS = @inventorySts))

			--Expiration Date
			AND (@expirationDate is null or (CAST(LI.EXPIRATION_DATE AS DATE) = CAST(@expirationDate AS DATE)))

		END
	
	ELSE IF(@includeInvAttributes = N'Y')
	
		BEGIN
			SELECT @availableQty = CASE L.ALLOCATE_IN_TRANSIT
				WHEN N'Y' THEN ON_HAND_QTY + IN_TRANSIT_QTY - ALLOCATED_QTY - SUSPENSE_QTY
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
			
			--Do not check lot is null against the location inventory table as a null value may mean lot was just not specified
			AND ((@lot is null) or (LI.LOT = @lot))

			--Do not check inventorySts is null against the location inventory table as a null value may mean inventorySts was just not specified
			AND ((@inventorySts is null) or (LI.INVENTORY_STS = @inventorySts))
			
			AND (LI.LOC_INV_ATTRIBUTES_ID = @locInvAttributesID
				OR ((LI.LOC_INV_ATTRIBUTES_ID IS NULL OR LI.LOC_INV_ATTRIBUTES_ID = 0 ) 
					   AND (@locInvAttributesID IS NULL OR @locInvAttributesID =0)))

			--Expiration Date
			AND (@expirationDate is null or (CAST(LI.EXPIRATION_DATE AS DATE) = CAST(@expirationDate AS DATE)))

	               
		  END         
   ELSE 
	
		BEGIN
			SELECT @availableQty = sum(CASE L.ALLOCATE_IN_TRANSIT
				WHEN N'Y' THEN ON_HAND_QTY + IN_TRANSIT_QTY - ALLOCATED_QTY - SUSPENSE_QTY
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

			--Do not check lot is null against the location inventory table as a null value may mean lot was just not specified
			AND ((@lot is null) or (LI.LOT = @lot))
			
			--Do not check inventorySts is null against the location inventory table as a null value may mean inventorySts was just not specified
			AND ((@inventorySts is null) or (LI.INVENTORY_STS = @inventorySts))
			
			--Expiration Date
			AND (@expirationDate is null or (CAST(LI.EXPIRATION_DATE AS DATE) = CAST(@expirationDate AS DATE)))
			
		END
	
	return @availableQty;
end
