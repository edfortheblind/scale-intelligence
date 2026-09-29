-- DOCUMENTATION ONLY: literals/comments removed; do not execute.



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
	@cClsKnown nchar(1)) -- [comment omitted]

RETURNS numeric(19,5)
AS
BEGIN

	-- [comment omitted]
	declare @dOrigConvQty numeric(19,5);
	declare @dReqConvQty numeric(19,5);
	declare @dReqQty numeric(19,5);
	declare @iIntLocInv numeric(9);
	
	-- [comment omitted]
	-- [comment omitted]
	if (@stLoc is not null 
		AND @stWhs is not null)
	begin
		-- [comment omitted]
		-- [comment omitted]
		if (@stContId is not null)
		begin
			SELECT @iIntLocInv = INTERNAL_LOCATION_INV
		   	  FROM LOCATION_INVENTORY
		   	 WHERE LOGISTICS_UNIT = @stContId
			   AND ITEM = @stItem
			   AND ISNULL(COMPANY, N'<literal:1>') = ISNULL(@stComp, N'<literal:2>')
			   AND ISNULL(LOT, N'<literal:3>') = ISNULL(@stLot, N'<literal:4>');
		end; -- [comment omitted]
	
		-- [comment omitted]
		SELECT @dOrigConvQty = CONVERSION_QTY
		  FROM LOCATION_UNIT_OF_MEASURE
		 WHERE LOCATION = @stLoc
		   AND WAREHOUSE = @stWhs
		   AND ITEM = @stItem
		   AND ISNULL(COMPANY, N'<literal:5>') = ISNULL(@stComp, N'<literal:6>')
		   AND QUANTITY_UM = @stQtyUm
		   AND (@stContId is null
		   		OR (@stContId is not null
		   		    AND INTERNAL_LOCATION_INV = @iIntLocInv));
		   	    
		-- [comment omitted]
		if (@@ROWCOUNT > 0)
		begin
			SELECT @dReqConvQty = CONVERSION_QTY
			  FROM LOCATION_UNIT_OF_MEASURE
			 WHERE LOCATION = @stLoc
			   AND WAREHOUSE = @stWhs
			   AND ITEM = @stItem
			   AND ISNULL(COMPANY, N'<literal:7>') = ISNULL(@stComp, N'<literal:8>')
			   AND QUANTITY_UM = @stReqUm
			   AND (@stContId is null
		   			OR (@stContId is not null
		   			    AND INTERNAL_LOCATION_INV = @iIntLocInv));
		   		    
			if (@@ROWCOUNT > 0)
				return @dQty *  @dOrigConvQty / @dReqConvQty;
		end; -- [comment omitted]
	end; -- [comment omitted]
		
	-- [comment omitted]
	SELECT @dOrigConvQty = CONVERSION_QTY
	  FROM ITEM_UNIT_OF_MEASURE
	 WHERE ((ITEM = @stItem
					AND ISNULL(COMPANY, N'<literal:9>') = ISNULL(@stComp, N'<literal:10>'))
				OR (ITEM = @stItem
					AND COMPANY is null))
	   AND QUANTITY_UM = @stQtyUm;
		   
	-- [comment omitted]
	if (@@ROWCOUNT > 0)
	begin
		SELECT @dReqConvQty = CONVERSION_QTY
		  FROM ITEM_UNIT_OF_MEASURE
		 WHERE ((ITEM = @stItem
					AND ISNULL(COMPANY, N'<literal:11>') = ISNULL(@stComp, N'<literal:12>'))
				OR (ITEM = @stItem
					AND COMPANY is null))
		   AND QUANTITY_UM = @stReqUm;
		   
		if (@@ROWCOUNT > 0)
			return @dQty *  @dOrigConvQty / @dReqConvQty;
	end; -- [comment omitted]
	
	-- [comment omitted]
	-- [comment omitted]
	if (@stItemClass is not null 
		OR isnull(@cClsKnown,N'<literal:13>') <> N'<literal:14>')
	begin
		-- [comment omitted]
		-- [comment omitted]
		if (isnull(@cClsKnown,N'<literal:15>') <> N'<literal:16>')
		begin
			SELECT @stItemClass = ITEM_CLASS
			  FROM ITEM
			 WHERE (ITEM = @stItem
					AND ISNULL(COMPANY, N'<literal:17>') = ISNULL(@stComp, N'<literal:18>'))
				OR (ITEM = @stItem
					AND COMPANY is null);
		end; -- [comment omitted]
	
		-- [comment omitted]
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
			end; -- [comment omitted]
		end; -- [comment omitted]
	end;	-- [comment omitted]
		
	-- [comment omitted]
	-- [comment omitted]
	return @dQty;
END -- [comment omitted]




