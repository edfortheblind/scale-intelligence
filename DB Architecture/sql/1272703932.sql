-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
-- [comment omitted]

/* [comment omitted] */

















	

-- [comment omitted]

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

		SELECT top 1 N'<literal:1>' AS SCALAR,
			li.INTERNAL_LOCATION_INV AS InternalLocationInv,
			li.INVENTORY_STS as Status,
			li.Item AS Item,
			li.ITEM_DESC AS ItemDesc,
			li.Location AS Location,
			li.COMPANY AS Company,
			li.LOT AS Lot, 
			li.LOGISTICS_UNIT AS LicensePlate, 
			@warehouse AS Warehouse,
			N'<literal:2>' AS InstructionType,
			i.WEB_THUMBNAIL_IMG AS WebThumbnailImage	
		FROM 
			#tempLocationInventoryFromId li
		LEFT OUTER JOIN ITEM i 
		on (li.Item = i.ITEM AND (li.Company = i.COMPANY OR (li.Company IS NULL AND i.COMPANY IS NULL)));

		IF(@logisticsUnit IS NULL OR @logisticsUnit = N'<literal:3>')
		BEGIN
			-- [comment omitted]
			SELECT top 1 N'<literal:4>' AS SCALAR,
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
				WI.INSTRUCTION_TYPE = N'<literal:5>' AND
				WI.CONDITION <> N'<literal:6>'
		END
		ELSE
		BEGIN
			-- [comment omitted]
			SELECT top 1 N'<literal:7>' AS SCALAR,
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
				WI.INSTRUCTION_TYPE = N'<literal:8>' AND
				WI.CONDITION <> N'<literal:9>'
		END

		-- [comment omitted]
		SELECT top 1 N'<literal:10>' AS SCALAR,
			COUNT(INR.INTERNAL_REQUEST_NUM) AS IMM_NEEDS
		FROM 
			IMMEDIATE_NEEDS_REQUEST INR
		WHERE 
			INR.ITEM = @item AND
			(INR.COMPANY = @company OR (INR.COMPANY IS NULL AND @company IS NULL)) AND
			(INR.WAREHOUSE = @warehouse);

		-- [comment omitted]
		SELECT top 1 N'<literal:11>' AS SCALAR,
			COUNT(BOM.INTERNAL_BOM_HEADER_NUM) AS BomCount
		FROM 
			BILL_OF_MATERIALS_HEADER BOM
		WHERE 
			BOM.ITEM = @item AND
			(BOM.COMPANY = @company OR (BOM.COMPANY IS NULL AND @company IS NULL));
	END
	ELSE IF(@item IS NOT NULL AND @item <> N'<literal:12>')
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
			case when isnull(@logisticsUnit, N'<literal:13>') = N'<literal:14>' then null else LOGISTICS_UNIT end as LOGISTICS_UNIT 
		INTO 
			#tempLocationInventory
		FROM 
			LOCATION_INVENTORY
		WHERE 
			ITEM = @item AND LOCATION = @location 
			AND (COMPANY = @company OR COMPANY IS NULL)	
			AND WAREHOUSE=@warehouse 
			AND (LOT = @lot or LOT IS NULL);

		SELECT top 1 N'<literal:15>' AS SCALAR,
			li.INTERNAL_LOCATION_INV AS InternalLocationInv,
			li.INVENTORY_STS as Status,
			li.Item AS Item,
			li.ITEM_DESC AS ItemDesc,
			li.Location AS Location,
			li.COMPANY AS Company,
			@warehouse AS Warehouse,
			N'<literal:16>' AS InstructionType,
			i.WEB_THUMBNAIL_IMG AS WebThumbnailImage	
		FROM 
			#tempLocationInventory li
		LEFT OUTER JOIN ITEM i 
		on (li.Item = i.ITEM AND (li.Company = i.COMPANY OR (li.Company IS NULL AND i.COMPANY IS NULL)));

		SELECT top 1 N'<literal:17>' AS SCALAR,
			li.LOT AS Lot 
		FROM 
			#tempLocationInventory li
		where 
			li.LOT = @lot;

		IF(@logisticsUnit IS NULL OR @logisticsUnit = N'<literal:18>')
		BEGIN
			-- [comment omitted]
			SELECT top 1 N'<literal:19>' AS SCALAR,
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
				WI.INSTRUCTION_TYPE = N'<literal:20>' AND
				WI.CONDITION <> N'<literal:21>'
		END
		ELSE
		BEGIN
			SELECT top 1 N'<literal:22>' AS SCALAR,
				li.LOGISTICS_UNIT AS LicensePlate
			FROM 
				#tempLocationInventory li
			where 
				li.LOGISTICS_UNIT = @logisticsUnit;

			-- [comment omitted]
			SELECT top 1 N'<literal:23>' AS SCALAR,
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
				WI.INSTRUCTION_TYPE = N'<literal:24>' AND
				WI.CONDITION <> N'<literal:25>'
		END

		-- [comment omitted]
		SELECT top 1 N'<literal:26>' AS SCALAR,
			COUNT(INR.INTERNAL_REQUEST_NUM) AS IMM_NEEDS
		FROM 
			IMMEDIATE_NEEDS_REQUEST INR
		WHERE 
			INR.ITEM = @item AND
			(INR.COMPANY = @company OR (INR.COMPANY IS NULL AND @company IS NULL)) AND
			(INR.WAREHOUSE = @warehouse);

		-- [comment omitted]
		SELECT top 1 N'<literal:27>' AS SCALAR,
			COUNT(BOM.INTERNAL_BOM_HEADER_NUM) AS BomCount
		FROM 
			BILL_OF_MATERIALS_HEADER BOM
		WHERE 
			BOM.ITEM = @item AND
			(BOM.COMPANY = @company OR (BOM.COMPANY IS NULL AND @company IS NULL));
	END
	ELSE -- [comment omitted]
	BEGIN	
		SELECT top 1 N'<literal:28>' AS SCALAR,
			N'<literal:29>' AS Item,
			N'<literal:30>' AS ItemDesc,
			CASE WHEN @location IS NULL THEN N'<literal:31>' ELSE @location END AS Location,
			N'<literal:32>' AS Company,
			CASE WHEN @location IS NULL THEN N'<literal:33>' ELSE @warehouse END AS Warehouse, 
			N'<literal:34>' AS WebThumbnailImage, 
			N'<literal:35>' AS IMM_NEEDS, 
			N'<literal:36>' AS BomCount;

		-- [comment omitted]
		SELECT top 1 N'<literal:37>' AS SCALAR,
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
			WI.INSTRUCTION_TYPE = N'<literal:38>' AND
			WI.CONDITION <> N'<literal:39>'
	END
END