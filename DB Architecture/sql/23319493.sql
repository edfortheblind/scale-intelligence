-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





















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
		
	-- [comment omitted]
	declare @iError int;

	begin
		-- [comment omitted]
		if (@stItem is not null)
		begin
			
			SELECT @dMaxQty = isnull(MAXIMUM_QTY, 0.0),
			   @iMinReplnPct = isnull(MINIMUM_RPLN_PCT, 100),
			   @stILCQuantityUm = isnull(QUANTITY_UM, N'<literal:1>')
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
					   @stILCQuantityUm = isnull(QUANTITY_UM, N'<literal:2>')
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
						@stILCQuantityUm = isnull(QUANTITY_UM, N'<literal:3>')
				  FROM ITEM_LOCATION_CAPACITY
				 WHERE ITEM = @stItem
				   AND COMPANY is null
				   AND ((LOCATION = @stLocation
						 AND WAREHOUSE = @stWarehouse
						 AND LOCATION_TYPE is null)
						OR LOCATION_TYPE = @stLocType);
			end;
		end; -- [comment omitted]

		
		if (@dMaxQty is null
			AND @stItemClass is not null)	  
		begin 
			SELECT @dMaxQty = isnull(MAXIMUM_QTY, 0),
				@iMinReplnPct = isnull(MINIMUM_RPLN_PCT, 100),
				@stILCQuantityUm = isnull(QUANTITY_UM, N'<literal:4>')
			FROM ITEM_LOCATION_CAPACITY
			WHERE ITEM_CLASS = @stItemClass
			AND (LOCATION = @stLocation
				 AND WAREHOUSE = @stWarehouse
				 AND LOCATION_TYPE is null);
				 
			IF(@dMaxQty IS NULL)
			BEGIN
				SELECT @dMaxQty = isnull(MAXIMUM_QTY, 0),
				@iMinReplnPct = isnull(MINIMUM_RPLN_PCT, 100),
				@stILCQuantityUm = isnull(QUANTITY_UM, N'<literal:5>')
				FROM ITEM_LOCATION_CAPACITY
				WHERE ITEM_CLASS = @stItemClass
				AND LOCATION_TYPE = @stLocType
			END;
		end; -- [comment omitted]
		
	end	-- [comment omitted]
