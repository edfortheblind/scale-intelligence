


CREATE FUNCTION ITMfn_CalcQtyForReqUm(
	@stItem nvarchar(50),
	@stComp nvarchar(25),
	@stLot nvarchar(25),
	@stItemClass nvarchar(50),
	@stLoc nvarchar(25),
	@stWhs nvarchar(25),
	@stContId nvarchar(50),
	@dQty numeric(19,5),
	@stQtyUm nvarchar(25),
	@stReqUM nvarchar(25),
	@cClsKnown nchar(1)) -- SYSTEM_CREATED used to set char type

RETURNS numeric(19,5)
AS
BEGIN

	-- local variables
	declare @dOrigConvQty numeric(19,5);
	declare @dReqConvQty numeric(19,5);
	declare @dReqQty numeric(19,5);
	declare @iIntLocInv numeric(9);
	
	-- search for LocationUnitOfMeasure records first if location
	-- information is specified.
	if (@stLoc is not null 
		AND @stWhs is not null)
	begin
		-- if a containerId was specified, retrieve its 
		-- internalContainerNum
		if (@stContId is not null)
		begin
			SELECT @iIntLocInv = INTERNAL_LOCATION_INV
		   	  FROM LOCATION_INVENTORY
		   	 WHERE LOGISTICS_UNIT = @stContId
			   AND ITEM = @stItem
			   AND ISNULL(COMPANY, N'!') = ISNULL(@stComp, N'!')
			   AND ISNULL(LOT, N'!') = ISNULL(@stLot, N'!');
		end; -- end if containerId specified.
	
		-- search for LocationUnitOfMeasure records.
		SELECT @dOrigConvQty = CONVERSION_QTY
		  FROM LOCATION_UNIT_OF_MEASURE
		 WHERE LOCATION = @stLoc
		   AND WAREHOUSE = @stWhs
		   AND ITEM = @stItem
		   AND ISNULL(COMPANY, N'!') = ISNULL(@stComp, N'!')
		   AND QUANTITY_UM = @stQtyUm
		   AND (@stContId is null
		   		OR (@stContId is not null
		   		    AND INTERNAL_LOCATION_INV = @iIntLocInv));
		   	    
		-- only continue down this path if the original Um was found.
		if (@@ROWCOUNT > 0)
		begin
			SELECT @dReqConvQty = CONVERSION_QTY
			  FROM LOCATION_UNIT_OF_MEASURE
			 WHERE LOCATION = @stLoc
			   AND WAREHOUSE = @stWhs
			   AND ITEM = @stItem
			   AND ISNULL(COMPANY, N'!') = ISNULL(@stComp, N'!')
			   AND QUANTITY_UM = @stReqUm
			   AND (@stContId is null
		   			OR (@stContId is not null
		   			    AND INTERNAL_LOCATION_INV = @iIntLocInv));
		   		    
			if (@@ROWCOUNT > 0)
				return @dQty *  @dOrigConvQty / @dReqConvQty;
		end; -- end if originalUm found for LocationUnitOfMeasure.
	end; -- end if location info specified.
		
	-- Next, try ItemUnitOfMeasure by item/company combination.
	SELECT @dOrigConvQty = CONVERSION_QTY
	  FROM ITEM_UNIT_OF_MEASURE
	 WHERE ((ITEM = @stItem
					AND ISNULL(COMPANY, N'!') = ISNULL(@stComp, N'!'))
				OR (ITEM = @stItem
					AND COMPANY is null))
	   AND QUANTITY_UM = @stQtyUm;
		   
	-- only continue down this path if the original Um was found.
	if (@@ROWCOUNT > 0)
	begin
		SELECT @dReqConvQty = CONVERSION_QTY
		  FROM ITEM_UNIT_OF_MEASURE
		 WHERE ((ITEM = @stItem
					AND ISNULL(COMPANY, N'!') = ISNULL(@stComp, N'!'))
				OR (ITEM = @stItem
					AND COMPANY is null))
		   AND QUANTITY_UM = @stReqUm;
		   
		if (@@ROWCOUNT > 0)
			return @dQty *  @dOrigConvQty / @dReqConvQty;
	end; -- end if originalUm found for item/company.
	
	-- Next, try ItemUnitOfMeasure by itemClass, only if an itemClass 
	-- was specified or needs to be retrieved.
	if (@stItemClass is not null 
		OR isnull(@cClsKnown,N'N') <> N'Y')
	begin
		-- if the ItemClass for the Item/Company combination
		-- was not known by the calling logic, retrieve it.
		if (isnull(@cClsKnown,N'N') <> N'Y')
		begin
			SELECT @stItemClass = ITEM_CLASS
			  FROM ITEM
			 WHERE (ITEM = @stItem
					AND ISNULL(COMPANY, N'!') = ISNULL(@stComp, N'!'))
				OR (ITEM = @stItem
					AND COMPANY is null);
		end; -- end if ItemClass should be retrieved.
	
		-- only continue if an ItemClass was found.
		if (@stItemClass is not null)
		begin
			SELECT @dOrigConvQty = CONVERSION_QTY
			  FROM ITEM_UNIT_OF_MEASURE
			 WHERE ITEM_CLASS = @stItemClass
			   AND QUANTITY_UM = @stQtyUm;
				   
			if (@@ROWCOUNT > 0)
			begin
				SELECT @dReqConvQty = CONVERSION_QTY
				  FROM ITEM_UNIT_OF_MEASURE
				 WHERE ITEM_CLASS = @stItemClass
				   AND QUANTITY_UM = @stReqUm;
				   
				if (@@ROWCOUNT > 0)
					return @dQty *  @dOrigConvQty / @dReqConvQty;
			end; -- end if originalUm found for ItemClass
		end; -- end if ItemClass exists.
	end;	-- end if we should search by ItemClass
		
	-- if we couldn't find conversion quantities for either
	-- Um, return the original specified quantity (garbage in, garbage out).
	return @dQty;
END -- end ITMfn_CalcQtyForReqUm




