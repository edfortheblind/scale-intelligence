-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */























CREATE FUNCTION INVfn_RtrvItemInfo(
	@stItem nvarchar(50),
	@stCompany nvarchar(25),
	@stQuantityUm nvarchar(25),
	@stLoc nvarchar(25),
	@stWhs nvarchar(25),
	@cOverride nchar(1)) -- [comment omitted]

RETURNS @retTable TABLE (costPerItem numeric(19,5),
						 valuePerItem numeric(19,5),
						 volumePerItem numeric(28,5),
						 weightPerItem numeric(28,5),
						 weightUm nvarchar(25),
						 volumeUm nvarchar(25),
						 itemColor nvarchar(25),
						 itemDesc nvarchar(100),
						 itemSize nvarchar(25),
						 itemStyle nvarchar(25),
						 lotControlled nchar(1))

AS
BEGIN
	-- [comment omitted]
	declare @dCostPerItem numeric(19,5);
	declare @dValuePerItem numeric(19,5);
	declare @dVolumePerItem numeric(28,5);
	declare @dWeightPerItem numeric(28,5);
	declare @stWeightUm nvarchar(25);
	declare @stVolumeUm nvarchar(25);
	declare @stItemClass nvarchar(50);
	declare @stItemColor nvarchar(25);
	declare @stItemDesc nvarchar(100);
	declare @stItemSize nvarchar(25);
	declare @stItemStyle nvarchar(25);
	declare @cLotControlled nchar(1);
	
	-- [comment omitted]
	SELECT @dCostPerItem = COST,
		   @dValuePerItem = NET_PRICE,
		   @stItemClass = ITEM_CLASS,
		   @stItemColor = ITEM_COLOR,
		   @stItemDesc = DESCRIPTION,
		   @stItemSize = ITEM_SIZE,
		   @stItemStyle = ITEM_STYLE,
		   @cLotControlled = LOT_CONTROLLED
	  FROM ITEM
	 WHERE (ITEM = @stItem
			AND ISNULL(COMPANY, N'<literal:1>') = ISNULL(@stCompany, N'<literal:2>'))
	    OR (ITEM = @stItem
			AND COMPANY is null);

   -- [comment omitted]
	SELECT TOP 1 @stVolumeUm= identifier  from generic_config_detail where record_type=N'<literal:3>' and Active=N'<literal:4>'
	   
	-- [comment omitted]
	if (@cOverride is null)
	begin
		-- [comment omitted]
		-- [comment omitted]
		-- [comment omitted]
		SELECT @dVolumePerItem = (ISNULL(LENGTH, 0.0) 
								  * ISNULL(WIDTH, 0.0)
								  * ISNULL(HEIGHT, 0.0)),
			   @dWeightPerItem = ISNULL(WEIGHT, 0.0),
			   @stWeightUm=WEIGHT_UM			
		FROM ITEM_UNIT_OF_MEASURE
		WHERE QUANTITY_UM = @stQuantityUm
        AND ITEM = @stItem
		AND (COMPANY = @stCompany
        OR  COMPANY is null);
	
		-- [comment omitted]
		-- [comment omitted]
		if (@@ROWCOUNT <= 0
			AND @stItemClass is not null)
		begin
			SELECT @dVolumePerItem = (ISNULL(LENGTH, 0.0) 
									  * ISNULL(WIDTH, 0.0)
									  * ISNULL(HEIGHT, 0.0)),
				   @dWeightPerItem = ISNULL(WEIGHT, 0.0),
				   @stWeightUm=WEIGHT_UM			    
			  FROM ITEM_UNIT_OF_MEASURE
			 WHERE ITEM_CLASS = @stItemClass
			   AND QUANTITY_UM = @stQuantityUm;
		end; -- [comment omitted]
	end; -- [comment omitted]
	
	-- [comment omitted]
	INSERT INTO @retTable 
		   (costPerItem,
		    valuePerItem,
		    volumePerItem,
		    weightPerItem,
			weightUm,
			volumeUm,
		    itemColor,
		    itemDesc,
		    itemSize,
		    itemStyle,
		    lotControlled)
	VALUES (ISNULL(@dCostPerItem, 0.0),
			ISNULL(@dValuePerItem, 0.0),
			ISNULL(@dVolumePerItem, 0.0),
			ISNULL(@dWeightPerItem, 0.0),
			@stWeightUm,
			@stVolumeUm,
			@stItemColor,
			@stItemDesc,
			@stItemSize,
			@stItemStyle,
			@cLotControlled);
	return;
END -- [comment omitted]




