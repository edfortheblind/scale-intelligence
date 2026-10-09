/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	9493		| PK			| 01/22/03	| Created.
	9493		| PK			| 04/23/03	| Fix the ILC UM conversion during INV Adjust
	43357		| SMS			| 12/16/08	| Modified the query retrieve location specific information first and then location type. 
	
	Retrieves the Item Location Capacity record for a given Item and location.  
	The order of records retrieved is (1)by Item/Company (2)by Item or (3)by Item Class.
		
	Parameters:
		String	stWhs		The warehouse corresponding to the location.
		String	stLoc		The location containing the item.
		String	stLocType	The location type.
		String	stItem		The Item ID.
		String	stCompany	The company for the item, if any.
		String	stItemClass	The Item Class.
		
	Output/Return Parameters:
		double	dMaxQty		The Maximum quantity.
		int		iMinRplnPct	The Minimum Replenishment Fill Percent.	
*/
CREATE PROCEDURE INV_RtrvRplnLocCapacity(
	@stWarehouse nvarchar(25),
	@stLocation nvarchar(25),
	@stLocType nvarchar(25),
	@stItem nvarchar(50),
	@stItemCompany nvarchar(25),
	@stItemClass nvarchar(50),
	@dMaxQty numeric(19,5) output,
	@iMinReplnPct numeric(3) output,
	@stILCQuantityUm nvarchar(25) output)
AS
	SET NOCOUNT ON;
		
	-- local variables
	declare @iError int;

	begin
		-- select the item location capacity record.
		if (@stItem is not null)
		begin
			
			SELECT @dMaxQty = isnull(MAXIMUM_QTY, 0.0),
			   @iMinReplnPct = isnull(MINIMUM_RPLN_PCT, 100),
			   @stILCQuantityUm = isnull(QUANTITY_UM, N'Each')
			FROM ITEM_LOCATION_CAPACITY
			WHERE ITEM = @stItem
			AND (COMPANY = @stItemCompany OR COMPANY IS NULL)
			AND (LOCATION = @stLocation
				AND WAREHOUSE = @stWarehouse
				AND LOCATION_TYPE is null);
				
			IF (@dMaxQty is null)
			BEGIN				
				SELECT @dMaxQty = isnull(MAXIMUM_QTY, 0.0),
					   @iMinReplnPct = isnull(MINIMUM_RPLN_PCT, 100),
					   @stILCQuantityUm = isnull(QUANTITY_UM, N'Each')
				  FROM ITEM_LOCATION_CAPACITY
				 WHERE ITEM = @stItem
				   AND (COMPANY = @stItemCompany OR COMPANY IS NULL)
				   AND LOCATION_TYPE = @stLocType;
			END;

			if (@dMaxQty is null
				AND @stItemCompany is not null)
			begin
				SELECT @dMaxQty = isnull(MAXIMUM_QTY, 0),
					   @iMinReplnPct = isnull(MINIMUM_RPLN_PCT, 100),
						@stILCQuantityUm = isnull(QUANTITY_UM, N'Each')
				  FROM ITEM_LOCATION_CAPACITY
				 WHERE ITEM = @stItem
				   AND COMPANY is null
				   AND ((LOCATION = @stLocation
						 AND WAREHOUSE = @stWarehouse
						 AND LOCATION_TYPE is null)
						OR LOCATION_TYPE = @stLocType);
			end;
		end; -- end if @stItem is  not null.

		
		if (@dMaxQty is null
			AND @stItemClass is not null)	  
		begin 
			SELECT @dMaxQty = isnull(MAXIMUM_QTY, 0),
				@iMinReplnPct = isnull(MINIMUM_RPLN_PCT, 100),
				@stILCQuantityUm = isnull(QUANTITY_UM, N'Each')
			FROM ITEM_LOCATION_CAPACITY
			WHERE ITEM_CLASS = @stItemClass
			AND (LOCATION = @stLocation
				 AND WAREHOUSE = @stWarehouse
				 AND LOCATION_TYPE is null);
				 
			IF(@dMaxQty IS NULL)
			BEGIN
				SELECT @dMaxQty = isnull(MAXIMUM_QTY, 0),
				@iMinReplnPct = isnull(MINIMUM_RPLN_PCT, 100),
				@stILCQuantityUm = isnull(QUANTITY_UM, N'Each')
				FROM ITEM_LOCATION_CAPACITY
				WHERE ITEM_CLASS = @stItemClass
				AND LOCATION_TYPE = @stLocType
			END;
		end; -- end if @stItemClass is  not null.
		
	end	-- select the item location capacity record.
