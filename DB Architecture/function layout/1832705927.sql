
/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	9083		| RAB			| 11/13/02	| Created.
	10298		| RAB			| 12/23/02	| Default conversionQty to 1.
	9906		| RAB			| 12/23/02	| Return all overridable fields.
	11870       	| TBS           	| 09/16/03  	| Added Multi-Byte support.
	11873		| RAB			| 12/15/03	| Added EPC Package ID.
	14473		| TDL			| 04/13/04	| Fixed Apostrophes
	18520		| VK			| 01/18/06	| Fall back to storage template when treatFullPerc is zero on item UMs		
	19141		| VK			| 09/01/06	| License plate changes	
	32965		| BTA			| 09/17/08	| Added XREF functionality
	37350		| BB			| 10/03/08	| Added Distinct qualifier in select from LOCATION_UNIT_OF_MEASURE
	49583		| DRK			| 04/11/09	| Checked for Logistics Unit only when Location is LP tracked
	50254		| DRK			| 04/28/09	| Added Location check to Retrieve correct Container ID
	
	Returns a table with the correct Unit of Measure information.
	
	Parameters
		String	stItem		the Item ID.
		String	stCompany	The company for the item, if any.
		String	stLot		The items lot.  Only used to retrieve the appropriate LocationContainer.
		String	stItemClass	The Item Class.
		String	stLoc		The location containing the item.
		String	stWhs		The warehouse corresponding to the location.
		String	stContId	The container ID. 
		String	cClsKnown	Y if stItemClass was known by the calling logic.
							Any other value means that stItemClass was not known and
							should be retrieved.
		
	Return values 
		Table				A table of Um information.
*/
CREATE FUNCTION ITMfn_RtrvUnitOfMeasure(
	@stItem nvarchar(50),
	@stCompany nvarchar(25),
	@stLot nvarchar(25),
	@stItemClass nvarchar(50),
	@stLoc nvarchar(25),
	@stWhs nvarchar(25),
	@stContId nvarchar(50),
	@cClsKnown nchar(1)) -- SYSTEM_CREATED used to set char type

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
		
	-- #DEFINE WMW.Jsharp.General com.pronto.general.Constants Constants;

	-- local variables
	declare @iIntLocInv numeric(9);
	declare @stStorageTemplate nvarchar(25);
	declare @item nvarchar(50);
	declare @trackcontainers nchar(1);

	if not exists (SELECT N'A'
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

	-- search for LocationUnitOfMeasure records first if 
	-- location and warehouse are specified.
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
		   	   AND ITEM = @item
		   	   AND ISNULL(COMPANY, N'!') = ISNULL(@stCompany, N'!')
		   	   AND ISNULL(LOT, N'!') = ISNULL(@stLot, N'!')
		   	   AND LOCATION = @stLoc;
		end; -- end if containerId specified.
	
		SELECT @trackContainers = TRACK_CONTAINERS
			FROM LOCATION
			WHERE LOCATION = @stLoc
					  AND WAREHOUSE = @stWhs;

		if exists (SELECT N'A' 
					 FROM LOCATION_UNIT_OF_MEASURE
					WHERE LOCATION = @stLoc
					  AND WAREHOUSE = @stWhs
					  AND ITEM = @item
					  AND ISNULL(COMPANY, N'!') = ISNULL(@stCompany, N'!')
					  AND (@trackContainers = N'N'
							OR (@stContId is not null
								AND INTERNAL_LOCATION_INV = @iIntLocInv
								AND @trackContainers = N'Y')))
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
			    AND ISNULL(COMPANY, N'!') = ISNULL(@stCompany, N'!')
			    AND (@trackContainers = N'N'
					 OR (@stContId is not null
						 AND INTERNAL_LOCATION_INV = @iIntLocInv
						 AND @trackContainers = N'Y')))
			return;
		end; -- end if LocUM exists.
	end; -- end if loc/whs specified.
		
	-- find the storageTemplate off of the item.
	SELECT @stStorageTemplate = STORAGE_TEMPLATE
	  FROM ITEM
	 WHERE (ITEM = @item
	    	AND ISNULL(COMPANY, N'!') = ISNULL(@stCompany, N'!'))
	    OR (ITEM = @item
	    	AND COMPANY is null);
	   
	-- if the storageTemplate is still null, set it to
	-- *Default.
	if (@stStorageTemplate is null)
		set @stStorageTemplate = N'*Default';

	-- otherwise, look at the ItemUnitOfMeasure table by item/company combo.
	if exists (SELECT N'A'
				 FROM ITEM_UNIT_OF_MEASURE
				WHERE ITEM = @item
				  AND ISNULL(COMPANY, N'!') = ISNULL(@stCompany, N'!'))
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
		    AND ISNULL(COMPANY, N'!') = ISNULL(@stCompany, N'!'));
		  return;
	end; -- end if ItemUM by item/company exists.
	
	-- if a company was specified, look at the ItemUnitOfMeasure table 
	-- by item/blank company.
	if (@stCompany is not null)
	begin
		if exists (SELECT N'A'
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
		end; -- end if itemUM by item/blank company exists.
	end; -- end if company specified.
		
	-- retrieve the itemClass if it is unknown.
	if (@cClsKnown is null
		OR (@cClsKnown <> N'Y' AND @cClsKnown <> N'y')) 
	begin
		SELECT @stItemClass = ITEM_CLASS
		  FROM ITEM
		 WHERE (ITEM = @item
		    	AND ISNULL(COMPANY, N'!') = ISNULL(@stCompany, N'!'))
		    OR (ITEM = @item
		    	AND COMPANY is null);
	end; -- end if retrieving itemClass.
	
	-- if an itemClass exists, search ItemUnitOfMeasure by that value.
	if (@stItemClass is not null)
	begin
		if exists (SELECT N'A'
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
		end; -- end if itemUM by itemClass found.
	end; -- end if itemClass specified.
	
	-- return a row for each row in the storage template.
	-- The only values that will be filled will be
	-- quantityUm and sequence
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
END -- end ITMfn_RtrvUnitOfMeasure



