
/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	9593		| RAB			| 08/20/02	| Created.
	11870       | TBS           | 09/16/03  | Added Multi-Byte support.
	14473		| TDL			| 04/13/04	| Fixed Apostrophes
	20671/387	| DSK			| 03/21/07	| Removed the second IF condition as it is redundant
	22276    	| AK			| 03/21/08	| Modified Company condition in Item Unit OF Measure Query 
	24296		| BTA			| 04/18/08	| Fixed oracle bug
	47847		| PP		    | 03/03/09	| Modified Volume and Weight datatype to Numeric - 28,5 from Numeric - 19,5.
	242002		| PS			| 17/11/19	| Modified to fetch Volume_UM and WEIGHT_UM from item unit of measure.
	Retrieves information off of the Item and ItemUnitOfMeasure tables.
	
	Parameters
		String	stItem			The Item.
		String	stComapny		stItems company.
		String	stQuantityUm	stItems quantityUm.
		String	stLoc			The current location.
		String	stWhs			The warehouse of stWhs.
		char	cOverride		Not null if a LocUm exists.
		
	Return values (table)
		information off of the Item and ItemUnitOfMeasure tables.
*/
CREATE FUNCTION INVfn_RtrvItemInfo(
	@stItem nvarchar(50),
	@stCompany nvarchar(25),
	@stQuantityUm nvarchar(25),
	@stLoc nvarchar(25),
	@stWhs nvarchar(25),
	@cOverride nchar(1)) -- SYSTEM_CREATED used to set char type

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
	-- local variables
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
	
	-- Retrieve information from the Item table.
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
			AND ISNULL(COMPANY, N'!') = ISNULL(@stCompany, N'!'))
	    OR (ITEM = @stItem
			AND COMPANY is null);

   --Retrieve first Active Volume UM 
	SELECT TOP 1 @stVolumeUm= identifier  from generic_config_detail where record_type=N'UMVOLUME' and Active=N'Y'
	   
	-- Only query the ItemUnitOfMeasure table if an override does not exist.
	if (@cOverride is null)
	begin
		-- first, search for ItemUnitOfMeasure records
		-- by item/company combo. 
		-- It takes care if company is present or null
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
	
		-- if still not found, search for ItemUnitOfMeasure records
		-- by ItemClass if one was found on the Item.
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
		end; -- end if Um info still not found.
	end; -- end if LocUm overrides don't exist.
	
	-- insert the information into the return table and return.
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
END -- end INVfn_RtrvItemInfo




