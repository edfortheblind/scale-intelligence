---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	162676	| NRJ	| 07/13/15	| Created
	163995	| DN	| 07/28/15	| Modified url and added item, company warehouse information in DetailPaneDetailsLots table
	164456	| NRJ	| 08/20/15	| Modified the SCALAR value ItemDesc. 
	163879	| NRJ	| 08/27/15	| Modified the script to display empty locations.
	163339	| NRJ	| 09/15/15	| fetched work and License plate information. 
	166528	| NRJ	| 09/16/15	| Added WebserviceInfo to load serial numbers and attributes via webservice call.
	166876	| NRJ	| 09/18/15	| fixed serialnumbers refreashing issue.
	169172	| MMM	| 01/05/16	| Added WebThumbnailImage column to result
	186835	| RJR	| 09/13/16	| Open screens in current tab.
	185480	| AU	| 09/14/16	| Added Indicator Tile Component
	185480	| AU	| 09/28/16	| Removed all the other components with the accordians in the screen
	194193	| RJR	| 01/06/17	| Support "aggregate" view and fix work instruction count tile that was incorrect.
	196584	| RJR	| 01/17/17	| Consider lot on the indicator tiles.
	205054	| RJR	| 04/27/17	| Add immediate needs tile and BOM count.
	201423	| MMM	| 08/17/17	| Corrected work instruction count logic to display proper count based on location as the location can be linked to from location, to location or p&d location.
*/	

-- Get Data for InventoryInsightDetailPane which internal convert into JSON and send to client

CREATE PROCEDURE INV_InsightDetailPaneData(
@internalLocationInv numeric(9),
@item nvarchar(50),
@location nvarchar(25),
@company nvarchar(25),
@warehouse nvarchar(25),
@lot nvarchar(25),
@logisticsUnit nvarchar(50),
@culture nvarchar(10))  
AS 
BEGIN

	IF (@internalLocationInv IS NOT NULL and @internalLocationInv > 0)
	BEGIN
		SELECT 
			INTERNAL_LOCATION_INV,
			ITEM,
			ITEM_DESC,
			LOCATION,
			COMPANY,
			warehouse,
			INVENTORY_STS,
			LOT,
			LOGISTICS_UNIT 
		INTO 
			#tempLocationInventoryFromId
		FROM 
			LOCATION_INVENTORY
		WHERE 
			INTERNAL_LOCATION_INV = @internalLocationInv;

		SELECT top 1 N'SCALAR' AS SCALAR,
			li.INTERNAL_LOCATION_INV AS InternalLocationInv,
			li.INVENTORY_STS as Status,
			li.Item AS Item,
			li.ITEM_DESC AS ItemDesc,
			li.Location AS Location,
			li.COMPANY AS Company,
			li.LOT AS Lot, 
			li.LOGISTICS_UNIT AS LicensePlate, 
			@warehouse AS Warehouse,
			N'Detail' AS InstructionType,
			i.WEB_THUMBNAIL_IMG AS WebThumbnailImage	
		FROM 
			#tempLocationInventoryFromId li
		LEFT OUTER JOIN ITEM i 
		on (li.Item = i.ITEM AND (li.Company = i.COMPANY OR (li.Company IS NULL AND i.COMPANY IS NULL)));

		IF(@logisticsUnit IS NULL OR @logisticsUnit = N'MULTIPLE')
		BEGIN
			--open work indicator tile
			SELECT top 1 N'SCALAR' AS SCALAR,
				COUNT(WI.INTERNAL_INSTRUCTION_NUM) AS OPEN_WORK_INST
			FROM 
				WORK_INSTRUCTION WI
			WHERE 
				WI.ITEM = @item AND
				(WI.COMPANY = @company OR (WI.COMPANY IS NULL AND @company IS NULL)) AND
				(
					((WI.FROM_LOC = @location OR WI.OUTGOING_PD_LOC = @location) AND WI.FROM_WHS = @warehouse) OR
					((WI.TO_LOC = @location OR WI.INCOMING_PD_LOC = @location) AND WI.TO_WHS = @warehouse)
				) AND
				(WI.LOT = @lot OR (WI.LOT IS NULL AND @lot IS NULL)) AND
				WI.INSTRUCTION_TYPE = N'Detail' AND
				WI.CONDITION <> N'Closed'
		END
		ELSE
		BEGIN
			--open work indicator tile
			SELECT top 1 N'SCALAR' AS SCALAR,
				COUNT(WI.INTERNAL_INSTRUCTION_NUM) AS OPEN_WORK_INST
			FROM 
				WORK_INSTRUCTION WI
			WHERE 
				WI.ITEM = @item AND
				(WI.COMPANY = @company OR (WI.COMPANY IS NULL AND @company IS NULL)) AND
				(
					((WI.FROM_LOC = @location OR WI.OUTGOING_PD_LOC = @location) AND WI.FROM_WHS = @warehouse) OR
					((WI.TO_LOC = @location OR WI.INCOMING_PD_LOC = @location) AND WI.TO_WHS = @warehouse)
				) AND
				WI.LOGISTICS_UNIT = @logisticsUnit AND 
				(WI.LOT = @lot OR (WI.LOT IS NULL AND @lot IS NULL)) AND
				WI.INSTRUCTION_TYPE = N'Detail' AND
				WI.CONDITION <> N'Closed'
		END

		--immediate needs indicator tile
		SELECT top 1 N'SCALAR' AS SCALAR,
			COUNT(INR.INTERNAL_REQUEST_NUM) AS IMM_NEEDS
		FROM 
			IMMEDIATE_NEEDS_REQUEST INR
		WHERE 
			INR.ITEM = @item AND
			(INR.COMPANY = @company OR (INR.COMPANY IS NULL AND @company IS NULL)) AND
			(INR.WAREHOUSE = @warehouse);

		--BOM count
		SELECT top 1 N'SCALAR' AS SCALAR,
			COUNT(BOM.INTERNAL_BOM_HEADER_NUM) AS BomCount
		FROM 
			BILL_OF_MATERIALS_HEADER BOM
		WHERE 
			BOM.ITEM = @item AND
			(BOM.COMPANY = @company OR (BOM.COMPANY IS NULL AND @company IS NULL));
	END
	ELSE IF(@item IS NOT NULL AND @item <> N'')
	BEGIN
		SELECT 
			INTERNAL_LOCATION_INV,
			ITEM,
			ITEM_DESC,
			LOCATION,
			COMPANY,
			warehouse,
			INVENTORY_STS,
			LOT,
			case when isnull(@logisticsUnit, N'') = N'MULTIPLE' then null else LOGISTICS_UNIT end as LOGISTICS_UNIT 
		INTO 
			#tempLocationInventory
		FROM 
			LOCATION_INVENTORY
		WHERE 
			ITEM = @item AND LOCATION = @location 
			AND (COMPANY = @company OR COMPANY IS NULL)	
			AND WAREHOUSE=@warehouse 
			AND (LOT = @lot or LOT IS NULL);

		SELECT top 1 N'SCALAR' AS SCALAR,
			li.INTERNAL_LOCATION_INV AS InternalLocationInv,
			li.INVENTORY_STS as Status,
			li.Item AS Item,
			li.ITEM_DESC AS ItemDesc,
			li.Location AS Location,
			li.COMPANY AS Company,
			@warehouse AS Warehouse,
			N'Detail' AS InstructionType,
			i.WEB_THUMBNAIL_IMG AS WebThumbnailImage	
		FROM 
			#tempLocationInventory li
		LEFT OUTER JOIN ITEM i 
		on (li.Item = i.ITEM AND (li.Company = i.COMPANY OR (li.Company IS NULL AND i.COMPANY IS NULL)));

		SELECT top 1 N'SCALAR' AS SCALAR,
			li.LOT AS Lot 
		FROM 
			#tempLocationInventory li
		where 
			li.LOT = @lot;

		IF(@logisticsUnit IS NULL OR @logisticsUnit = N'MULTIPLE')
		BEGIN
			--open work indicator tile
			SELECT top 1 N'SCALAR' AS SCALAR,
				COUNT(WI.INTERNAL_INSTRUCTION_NUM) AS OPEN_WORK_INST
			FROM 
				WORK_INSTRUCTION WI
			WHERE 
				WI.ITEM = @item AND
				(WI.COMPANY = @company OR (WI.COMPANY IS NULL AND @company IS NULL)) AND
				(
					((WI.FROM_LOC = @location OR WI.OUTGOING_PD_LOC = @location) AND WI.FROM_WHS = @warehouse) OR
					((WI.TO_LOC = @location OR WI.INCOMING_PD_LOC = @location) AND WI.TO_WHS = @warehouse)
				) AND
				(WI.LOT = @lot OR (WI.LOT IS NULL AND @lot IS NULL)) AND
				WI.INSTRUCTION_TYPE = N'Detail' AND
				WI.CONDITION <> N'Closed'
		END
		ELSE
		BEGIN
			SELECT top 1 N'SCALAR' AS SCALAR,
				li.LOGISTICS_UNIT AS LicensePlate
			FROM 
				#tempLocationInventory li
			where 
				li.LOGISTICS_UNIT = @logisticsUnit;

			--open work indicator tile
			SELECT top 1 N'SCALAR' AS SCALAR,
				COUNT(WI.INTERNAL_INSTRUCTION_NUM) AS OPEN_WORK_INST
			FROM 
				WORK_INSTRUCTION WI
			WHERE 
				WI.ITEM = @item AND
				(WI.COMPANY = @company OR (WI.COMPANY IS NULL AND @company IS NULL)) AND
				(
					((WI.FROM_LOC = @location OR WI.OUTGOING_PD_LOC = @location) AND WI.FROM_WHS = @warehouse) OR
					((WI.TO_LOC = @location OR WI.INCOMING_PD_LOC = @location) AND WI.TO_WHS = @warehouse)
				) AND
				WI.LOGISTICS_UNIT = @logisticsUnit AND 
				(WI.LOT = @lot OR (WI.LOT IS NULL AND @lot IS NULL)) AND
				WI.INSTRUCTION_TYPE = N'Detail' AND
				WI.CONDITION <> N'Closed'
		END

		--immediate needs indicator tile
		SELECT top 1 N'SCALAR' AS SCALAR,
			COUNT(INR.INTERNAL_REQUEST_NUM) AS IMM_NEEDS
		FROM 
			IMMEDIATE_NEEDS_REQUEST INR
		WHERE 
			INR.ITEM = @item AND
			(INR.COMPANY = @company OR (INR.COMPANY IS NULL AND @company IS NULL)) AND
			(INR.WAREHOUSE = @warehouse);

		--BOM count
		SELECT top 1 N'SCALAR' AS SCALAR,
			COUNT(BOM.INTERNAL_BOM_HEADER_NUM) AS BomCount
		FROM 
			BILL_OF_MATERIALS_HEADER BOM
		WHERE 
			BOM.ITEM = @item AND
			(BOM.COMPANY = @company OR (BOM.COMPANY IS NULL AND @company IS NULL));
	END
	ELSE --Display Empty locations
	BEGIN	
		SELECT top 1 N'SCALAR' AS SCALAR,
			N'' AS Item,
			N'' AS ItemDesc,
			CASE WHEN @location IS NULL THEN N'' ELSE @location END AS Location,
			N'' AS Company,
			CASE WHEN @location IS NULL THEN N'' ELSE @warehouse END AS Warehouse, 
			N'' AS WebThumbnailImage, 
			N'0' AS IMM_NEEDS, 
			N'0' AS BomCount;

		--open work indicator tile, need to show the count for P&D locations for when inventory exists at from location
		SELECT top 1 N'SCALAR' AS SCALAR,
			COUNT(WI.INTERNAL_INSTRUCTION_NUM) AS OPEN_WORK_INST
		FROM 
			WORK_INSTRUCTION WI
		WHERE 
			(
				@location IS NOT NULL AND
				(
					((WI.FROM_LOC = @location OR WI.OUTGOING_PD_LOC = @location) AND WI.FROM_WHS = @warehouse) OR
					((WI.TO_LOC = @location OR WI.INCOMING_PD_LOC = @location) AND WI.TO_WHS = @warehouse)
				)
			) AND
			WI.INSTRUCTION_TYPE = N'Detail' AND
			WI.CONDITION <> N'Closed'
	END
END