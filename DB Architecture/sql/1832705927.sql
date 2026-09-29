-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */
































CREATE FUNCTION ITMfn_RtrvUnitOfMeasure(
	@stItem nvarchar(50),
	@stCompany nvarchar(25),
	@stLot nvarchar(25),
	@stItemClass nvarchar(50),
	@stLoc nvarchar(25),
	@stWhs nvarchar(25),
	@stContId nvarchar(50),
	@cClsKnown nchar(1)) -- [comment omitted]

RETURNS @retTable TABLE (
	conversionQty numeric(19,5) default 1.0,
	dimensionUm nvarchar(25) default null,
	epcPackageId numeric(1) default 0,
	height numeric(19,5) default 0.0,
	length numeric(19,5) default 0.0,
	movementCls nvarchar(25) default null,
	quantityUm nvarchar(25) primary key,
	sequence numeric(3) default 0,
	treatAsLoose nchar(1) default null,
	treatFullPct numeric(3) default 0.0,
	weight numeric(19,5) default 0.0,
	weightUm nvarchar(25) default null,
	width numeric(19,5) default 0.0,
	source int default 0)

AS
BEGIN
		
	-- [comment omitted]

	-- [comment omitted]
	declare @iIntLocInv numeric(9);
	declare @stStorageTemplate nvarchar(25);
	declare @item nvarchar(50);
	declare @trackcontainers nchar(1);

	if not exists (SELECT N'<literal:1>'
				 FROM ITEM
		        WHERE ITEM = @stItem)
	begin
		SELECT @item = ITEM
		  FROM ITEM_CROSS_REFERENCE
		 WHERE X_REF_ITEM = @stItem;
	end;
	else
	begin		
		SET @item = @stItem;
	end;

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
		   	   AND ITEM = @item
		   	   AND ISNULL(COMPANY, N'<literal:2>') = ISNULL(@stCompany, N'<literal:3>')
		   	   AND ISNULL(LOT, N'<literal:4>') = ISNULL(@stLot, N'<literal:5>')
		   	   AND LOCATION = @stLoc;
		end; -- [comment omitted]
	
		SELECT @trackContainers = TRACK_CONTAINERS
			FROM LOCATION
			WHERE LOCATION = @stLoc
					  AND WAREHOUSE = @stWhs;

		if exists (SELECT N'<literal:6>' 
					 FROM LOCATION_UNIT_OF_MEASURE
					WHERE LOCATION = @stLoc
					  AND WAREHOUSE = @stWhs
					  AND ITEM = @item
					  AND ISNULL(COMPANY, N'<literal:7>') = ISNULL(@stCompany, N'<literal:8>')
					  AND (@trackContainers = N'<literal:9>'
							OR (@stContId is not null
								AND INTERNAL_LOCATION_INV = @iIntLocInv
								AND @trackContainers = N'<literal:10>')))
		begin
			INSERT INTO @retTable
				   (conversionQty,
				    dimensionUm,
				    epcPackageId,
				    height,
				    length,
				    movementCls,
				    quantityUm,
				    sequence,
				    treatAsLoose,
				    treatFullPct,
				    weight,
				    weightUm,
				    width,
				    source)
			(SELECT DISTINCT CONVERSION_QTY,
					DIMENSION_UM,
					EPC_PACKAGE_ID,
					HEIGHT,
					LENGTH,
					MOVEMENT_CLS,
					QUANTITY_UM,
					SEQUENCE,
					TREAT_AS_LOOSE,
					TREAT_FULL_PCT,
					WEIGHT,
					WEIGHT_UM,
					WIDTH,
					0
			   FROM LOCATION_UNIT_OF_MEASURE
			  WHERE LOCATION = @stLoc
			    AND WAREHOUSE = @stWhs
			    AND ITEM = @item
			    AND ISNULL(COMPANY, N'<literal:11>') = ISNULL(@stCompany, N'<literal:12>')
			    AND (@trackContainers = N'<literal:13>'
					 OR (@stContId is not null
						 AND INTERNAL_LOCATION_INV = @iIntLocInv
						 AND @trackContainers = N'<literal:14>')))
			return;
		end; -- [comment omitted]
	end; -- [comment omitted]
		
	-- [comment omitted]
	SELECT @stStorageTemplate = STORAGE_TEMPLATE
	  FROM ITEM
	 WHERE (ITEM = @item
	    	AND ISNULL(COMPANY, N'<literal:15>') = ISNULL(@stCompany, N'<literal:16>'))
	    OR (ITEM = @item
	    	AND COMPANY is null);
	   
	-- [comment omitted]
	-- [comment omitted]
	if (@stStorageTemplate is null)
		set @stStorageTemplate = N'<literal:17>';

	-- [comment omitted]
	if exists (SELECT N'<literal:18>'
				 FROM ITEM_UNIT_OF_MEASURE
				WHERE ITEM = @item
				  AND ISNULL(COMPANY, N'<literal:19>') = ISNULL(@stCompany, N'<literal:20>'))
	begin
		INSERT INTO @retTable
			   (conversionQty,
				dimensionUm,
			    epcPackageId,
				height,
				length,
				movementCls,
				quantityUm,
				sequence,
				treatAsLoose,
				treatFullPct,
				weight,
				weightUm,
				width,
				source)
		(SELECT CONVERSION_QTY,
				DIMENSION_UM,
				EPC_PACKAGE_ID,
				HEIGHT,
				LENGTH,
				MOVEMENT_CLS,
				QUANTITY_UM,
				SEQUENCE,
				TREAT_AS_LOOSE,
				CASE WHEN TREAT_FULL_PCT = 0
					THEN (SELECT TREAT_FULL_PCT 
		 				FROM STORAGE_TEMPLATE_DETAIL
						WHERE STORAGE_TEMPLATE = @stStorageTemplate
						AND STORAGE_TEMPLATE_DETAIL.SEQUENCE = ITEM_UNIT_OF_MEASURE.SEQUENCE) 
					 ELSE TREAT_FULL_PCT END,
				WEIGHT,
				WEIGHT_UM,
				WIDTH,
				1
		   FROM ITEM_UNIT_OF_MEASURE
		  WHERE ITEM = @item
		    AND ISNULL(COMPANY, N'<literal:21>') = ISNULL(@stCompany, N'<literal:22>'));
		  return;
	end; -- [comment omitted]
	
	-- [comment omitted]
	-- [comment omitted]
	if (@stCompany is not null)
	begin
		if exists (SELECT N'<literal:23>'
					 FROM ITEM_UNIT_OF_MEASURE
					WHERE ITEM = @item
					  AND COMPANY is null)
		begin
			INSERT INTO @retTable
				   (conversionQty,
				    dimensionUm,
				    epcPackageId,
				    height,
				    length,
				    movementCls,
				    quantityUm,
				    sequence,
				    treatAsLoose,
				    treatFullPct,
				    weight,
				    weightUm,
				    width,
				    source)
			(SELECT CONVERSION_QTY,
					DIMENSION_UM,
					EPC_PACKAGE_ID,
					HEIGHT,
					LENGTH,
					MOVEMENT_CLS,
					QUANTITY_UM,
					SEQUENCE,
					TREAT_AS_LOOSE,
					CASE WHEN TREAT_FULL_PCT = 0
					THEN (SELECT TREAT_FULL_PCT 
		 				FROM STORAGE_TEMPLATE_DETAIL
						WHERE STORAGE_TEMPLATE = @stStorageTemplate
						AND STORAGE_TEMPLATE_DETAIL.SEQUENCE = ITEM_UNIT_OF_MEASURE.SEQUENCE) 
					 ELSE TREAT_FULL_PCT END,
					WEIGHT,
					WEIGHT_UM,
					WIDTH,
					2
			   FROM ITEM_UNIT_OF_MEASURE
			  WHERE ITEM = @item
			    AND COMPANY is null);
			return;
		end; -- [comment omitted]
	end; -- [comment omitted]
		
	-- [comment omitted]
	if (@cClsKnown is null
		OR (@cClsKnown <> N'<literal:24>' AND @cClsKnown <> N'<literal:25>')) 
	begin
		SELECT @stItemClass = ITEM_CLASS
		  FROM ITEM
		 WHERE (ITEM = @item
		    	AND ISNULL(COMPANY, N'<literal:26>') = ISNULL(@stCompany, N'<literal:27>'))
		    OR (ITEM = @item
		    	AND COMPANY is null);
	end; -- [comment omitted]
	
	-- [comment omitted]
	if (@stItemClass is not null)
	begin
		if exists (SELECT N'<literal:28>'
					 FROM ITEM_UNIT_OF_MEASURE
					WHERE ITEM_CLASS = @stItemClass)
		begin
			INSERT INTO @retTable
				   (conversionQty,
				    dimensionUm,
				    epcPackageId,
				    height,
				    length,
				    movementCls,
				    quantityUm,
				    sequence,
				    treatAsLoose,
				    treatFullPct,
				    weight,
				    weightUm,
				    width,
				    source)
			(SELECT CONVERSION_QTY,
					DIMENSION_UM,
					EPC_PACKAGE_ID,
					HEIGHT,
					LENGTH,
					MOVEMENT_CLS,
					QUANTITY_UM,
					SEQUENCE,
					TREAT_AS_LOOSE,
					CASE WHEN TREAT_FULL_PCT = 0
						THEN (SELECT TREAT_FULL_PCT 
		 					FROM STORAGE_TEMPLATE_DETAIL
							WHERE STORAGE_TEMPLATE_DETAIL.SEQUENCE = ITEM_UNIT_OF_MEASURE.SEQUENCE
							AND STORAGE_TEMPLATE = @stStorageTemplate) 
						ELSE TREAT_FULL_PCT
					END,
					WEIGHT,
					WEIGHT_UM,
					WIDTH,
					3
			   FROM ITEM_UNIT_OF_MEASURE
			  WHERE ITEM_CLASS = @stItemClass);
			return;
		end; -- [comment omitted]
	end; -- [comment omitted]
	
	-- [comment omitted]
	-- [comment omitted]
	-- [comment omitted]
	INSERT INTO @retTable
		   (quantityUm,
		    sequence,
		    treatFullPct,
		    source)
	(SELECT UNIT_OF_MEASURE,
			SEQUENCE,
			TREAT_FULL_PCT,
			4
	   FROM STORAGE_TEMPLATE_DETAIL
	  WHERE STORAGE_TEMPLATE = @stStorageTemplate);
	  
	return;
END -- [comment omitted]



