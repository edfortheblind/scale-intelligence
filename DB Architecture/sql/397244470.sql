-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */







CREATE FUNCTION INVfn_RtrvItemInfoForBaseUM(
	@Item nvarchar(25),
	@company nvarchar(25),
	@warehouse nvarchar(25)
)

RETURNS @retTable TABLE (costPerItem numeric(19,5),
						 valuePerItem numeric(19,5),
						 volumePerItem numeric(28,5),
						 weightPerItem numeric(28,5),
						 itemClass nvarchar(50),
						 movementClass nvarchar(25),
						 quantityUM nvarchar(25),
						 itemColor nvarchar(25),
						 itemDesc nvarchar(100),
						 itemSize nvarchar(25),
						 itemStyle nvarchar(25),
						 lotControlled nchar(1),
						 internalItemNum numeric(9) ,
						 itemClassObjectId numeric(9))

AS
BEGIN
	-- [comment omitted]
	declare @costPerItem numeric(19,5);
	declare @valuePerItem numeric(19,5);
	declare @volumePerItem numeric(28,5);
	declare @weightPerItem numeric(28,5);
	declare @movementClass nvarchar(25);
	declare @quantityUM nvarchar(25);
	declare @itemClass nvarchar(50);
	declare @itemColor nvarchar(25);
	declare @itemDesc nvarchar(100);
	declare @itemSize nvarchar(25);
	declare @itemStyle nvarchar(25);
	declare @lotControlled nchar(1);
	declare @internalItemNum numeric(9) ;
	declare @itemClassObjectId numeric(9);
	
	
	-- [comment omitted]
	SELECT @costPerItem = COST,
		   @valuePerItem = NET_PRICE,
		   @itemClass = ITEM_CLASS,
		   @itemColor = ITEM_COLOR,
		   @itemDesc = DESCRIPTION,
		   @itemSize = ITEM_SIZE,
		   @itemStyle = ITEM_STYLE,
		   @lotControlled = LOT_CONTROLLED,
		   @internalItemNum = INTERNAL_ITEM_NUM   
	 FROM ITEM
	 WHERE (ITEM = @Item AND ISNULL(COMPANY, N'<literal:1>') = ISNULL(@company, N'<literal:2>'))
	    OR (ITEM = @Item AND COMPANY is null);
	   
	-- [comment omitted]
	
		-- [comment omitted]
		-- [comment omitted]
		-- [comment omitted]
		SELECT @volumePerItem = (ISNULL(LENGTH, 0.0) 
								  * ISNULL(WIDTH, 0.0)
								  * ISNULL(HEIGHT, 0.0)),
			   @weightPerItem = ISNULL(WEIGHT, 0.0),
			   @quantityUM = QUANTITY_UM,
			   @movementCLass = MOVEMENT_CLS
		FROM ITEM_UNIT_OF_MEASURE
		WHERE SEQUENCE = 1
        AND ITEM = @Item
		AND (COMPANY = @company
        OR  COMPANY is null);
	
		-- [comment omitted]
		-- [comment omitted]
		if (@@ROWCOUNT <= 0
			AND @itemClass is not null)
		begin
			SELECT	@itemClassObjectId = OBJECT_ID
			FROM GENERIC_CONFIG_DETAIL
			WHERE RECORD_TYPE=N'<literal:3>' 
				AND	IDENTIFIER = @ItemClass
		
		
			SELECT @volumePerItem = (ISNULL(LENGTH, 0.0) 
									  * ISNULL(WIDTH, 0.0)
									  * ISNULL(HEIGHT, 0.0)),
				   @weightPerItem = ISNULL(WEIGHT, 0.0),
				    @quantityUM = QUANTITY_UM,
				    @movementCLass = MOVEMENT_CLS
			  FROM ITEM_UNIT_OF_MEASURE
			 WHERE ITEM_CLASS = @ItemClass
			    AND SEQUENCE = 1;
		end; -- [comment omitted]
	
	-- [comment omitted]
	INSERT INTO @retTable 
		   (costPerItem,
		    valuePerItem,
		    volumePerItem,
		    weightPerItem,
			itemClass,
			movementClass,
			quantityUM,
		    itemColor,
		    itemDesc,
		    itemSize,
		    itemStyle,
		    lotControlled,
		    internalItemNum,
		    itemClassObjectId)
	VALUES (ISNULL(@costPerItem, 0.0),
			ISNULL(@valuePerItem, 0.0),
			ISNULL(@volumePerItem, 0.0),
			ISNULL(@weightPerItem, 0.0),
			@itemClass,
			@movementClass,
			@quantityUM,
			@itemColor,
			@itemDesc,
			@itemSize,
			@itemStyle,
			@lotControlled,
			@internalItemNum,
			@itemClassObjectId);
	return;
END; -- [comment omitted]