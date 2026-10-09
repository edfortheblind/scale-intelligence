


CREATE PROCEDURE HIST_LogShipDeAlloc(
@waveNum numeric(9),
@internalShipmentNum numeric(9),
@direction nvarchar(25),
@invTrack nchar(1),
@userName nvarchar(30),
@processStamp nvarchar(100)
)
AS 
BEGIN

DECLARE @tempTable Table
(
ID INT IDENTITY(1,1),
WAREHOUSE nvarchar(25),
COMPANY nvarchar(25),
ITEM nvarchar(50),
LOCATION nvarchar(25),
LOT nvarchar(25),
ALLOCSUM numeric(19,5),
QUANTITY numeric(19,5),
QUANTITY_UM nvarchar(25),
SHIPMENT_ID nvarchar(25),
ON_HAND_QTY numeric(19,5),
BEFORE_ALLOCATED_QTY numeric(19,5),
ALLOCATED_QTY numeric(19,5),
BEFORE_IN_TRANSIT_QTY numeric(19,5),
IN_TRANSIT_QTY numeric(19,5),
SUSPENSE_QTY numeric(19,5),
EXPIRATION_DATE datetime,
INVENTORY_STS nvarchar(50),
LOGISTICS_UNIT nvarchar(50),
LOC_INV_ATTRIBUTES_ID numeric(9)
);

if @direction = N'To' 
Begin
	INSERT INTO
	   @tempTable(WAREHOUSE,COMPANY,ITEM,LOCATION,LOT,ALLOCSUM,QUANTITY,QUANTITY_UM,SHIPMENT_ID,ON_HAND_QTY,BEFORE_ALLOCATED_QTY,
	   ALLOCATED_QTY,BEFORE_IN_TRANSIT_QTY,IN_TRANSIT_QTY,SUSPENSE_QTY,EXPIRATION_DATE,INVENTORY_STS,LOGISTICS_UNIT,LOC_INV_ATTRIBUTES_ID) 
	Select LI.Warehouse, LI.Company,LI.Item,LI.Location ,LI.Lot,Sum(AR.Allocated_Qty), LI.Allocated_Qty, AR.Quantity_Um,AR.Shipment_Id
	 ,LI.On_Hand_Qty,LI.Allocated_Qty,LI.Allocated_Qty,LI.In_Transit_Qty,LI.In_Transit_Qty,LI.Suspense_Qty,
		LI.EXPIRATION_DATE,LI.Inventory_Sts,LI.LOGISTICS_UNIT,LI.LOC_INV_ATTRIBUTES_ID
	FROM
	   Location_Inventory LI, Shipment_Alloc_Request AR
	Where
	   ((@WAVENUM <> 0 AND AR.LAUNCH_NUM = @WAVENUM ) 
	   OR (@internalShipmentNum <> 0 AND AR.INTERNAL_SHIPMENT_NUM = @internalShipmentNum))
	   AND AR.Inventory_Tracking = @invTrack AND AR.To_Whs = LI.Warehouse AND AR.To_Loc = LI.Location AND AR.Item = LI.Item
	   AND (( AR.Lot is null AND LI.Lot is null )  OR ( AR.Lot = LI.Lot ) ) 
	   AND (( AR.TO_LOC_INV_ATTRIBUTES_ID is null  AND  LI.LOC_INV_ATTRIBUTES_ID is null  ) OR ( AR.TO_LOC_INV_ATTRIBUTES_ID = LI.LOC_INV_ATTRIBUTES_ID  ))
	   AND (( AR.Company is null AND LI.Company is null )  OR ( AR.Company = LI.Company ) ) 
	Group By
	   LI.Warehouse,LI.Location,LI.Item,AR.Quantity_Um,AR.Shipment_Id,LI.Lot,LI.LOC_INV_ATTRIBUTES_ID, LI.Company,LI.On_Hand_Qty, LI.Allocated_Qty ,
		LI.In_Transit_Qty, LI.Suspense_Qty,LI.LOGISTICS_UNIT,LI.EXPIRATION_DATE,LI.Inventory_Sts ;
END 
	ELSE 
Begin
	INSERT INTO
	   @tempTable(WAREHOUSE,COMPANY,ITEM,LOCATION,LOT,ALLOCSUM,Quantity,QUANTITY_UM,SHIPMENT_ID,ON_HAND_QTY,BEFORE_ALLOCATED_QTY,
	   ALLOCATED_QTY,BEFORE_IN_TRANSIT_QTY,IN_TRANSIT_QTY,SUSPENSE_QTY,EXPIRATION_DATE,INVENTORY_STS,LOGISTICS_UNIT,LOC_INV_ATTRIBUTES_ID) 
	Select LI.Warehouse, LI.Company,LI.Item,LI.Location ,LI.Lot,Sum(AR.Allocated_Qty),LI.Allocated_Qty, AR.Quantity_Um,AR.Shipment_Id
	 ,LI.On_Hand_Qty,LI.Allocated_Qty,LI.Allocated_Qty,LI.In_Transit_Qty,LI.In_Transit_Qty,LI.Suspense_Qty,
		LI.EXPIRATION_DATE,LI.Inventory_Sts,LI.LOGISTICS_UNIT,LI.LOC_INV_ATTRIBUTES_ID
	FROM
	   Location_Inventory LI, Shipment_Alloc_Request AR
	Where
	   ((@WAVENUM <> 0 AND AR.LAUNCH_NUM = @WAVENUM ) 
	   OR (@internalShipmentNum <> 0 AND AR.INTERNAL_SHIPMENT_NUM = @internalShipmentNum))
	   AND AR.Inventory_Tracking = @invTrack AND AR.From_Whs = LI.Warehouse AND AR.From_Loc = LI.Location AND AR.Item = LI.Item
	   AND (( AR.Lot is null AND LI.Lot is null )  OR ( AR.Lot = LI.Lot ) ) AND (( AR.Company is null AND LI.Company is null )  OR ( AR.Company = LI.Company ) ) 
	   AND (( AR.FROM_LOC_INV_ATTRIBUTES_ID is null  AND  LI.LOC_INV_ATTRIBUTES_ID is null  ) OR ( AR.FROM_LOC_INV_ATTRIBUTES_ID = LI.LOC_INV_ATTRIBUTES_ID  ))
	   AND (( AR.logistics_unit is null AND LI.logistics_unit is null )  OR ( AR.logistics_unit = LI.logistics_unit ) )
	   AND LI.Allocated_Qty > 0
	Group By
	   LI.Warehouse,LI.Location,LI.Item,AR.Quantity_Um,AR.Shipment_Id,LI.Lot,LI.Company,LI.LOC_INV_ATTRIBUTES_ID, LI.On_Hand_Qty, LI.Allocated_Qty ,
		LI.In_Transit_Qty, LI.Suspense_Qty,LI.LOGISTICS_UNIT,LI.EXPIRATION_DATE,LI.Inventory_Sts ;
END

DECLARE @prevLocation nvarchar(25);
DECLARE @prevItem nvarchar(50);
DECLARE @prevWarehouse nvarchar(25);
DECLARE @prevLot nvarchar(25);
DECLARE @prevLogisticsUnit nvarchar(50);
DECLARE @prevLocInvAttributesId numeric(9);

DECLARE @currentAllocSum numeric(19,5);
DECLARE @quantityToBeDeducted numeric(19,5);
DECLARE @currentLocation nvarchar(25);
DECLARE @currentItem nvarchar(50);
DECLARE @currentWarehouse nvarchar(25);
DECLARE @currentLot nvarchar(25);
DECLARE @currentLogisticsUnit nvarchar(50);
DECLARE @currentLocInvAttributesId numeric(9);

DECLARE @MAXVALUE INT;
DECLARE @CURRENTINDEX INT;
SET @CURRENTINDEX=1;
SET @quantityToBeDeducted = 0;--This is sum of allocated quantity in case of multiple shipment
SELECT @MAXVALUE = MAX(ID) FROM @tempTable;

WHILE (@CURRENTINDEX <= @MAXVALUE)
BEGIN

SELECT @currentItem=ITEM, @currentAllocSum = ALLOCSUM , 
@currentWarehouse = WAREHOUSE, @currentLocation = LOCATION, @currentLot = LOT, @currentLogisticsUnit = LOGISTICS_UNIT,
@currentLocInvAttributesId= LOC_INV_ATTRIBUTES_ID
FROM @tempTable WHERE ID = @CURRENTINDEX;

		if @currentWarehouse = @prevWarehouse
		   AND @currentLocation = @prevLocation
		   AND @currentItem = @prevItem
		   AND (@currentLot = @prevLot OR (@currentLot IS NULL
		   AND @prevLot IS NULL)  ) 
		   AND (@currentLogisticsUnit = @prevLogisticsUnit OR (@currentLogisticsUnit IS NULL
		   AND @prevLogisticsUnit IS NULL)) 
		   AND (@currentLocInvAttributesId=@prevLocInvAttributesId OR (@currentLocInvAttributesId IS NULL 
		   AND @prevLocInvAttributesId IS NULL)) 
			BEGIN
				if @direction = N'To' 
					Begin
						SET   @quantityToBeDeducted = @quantityToBeDeducted + @currentAllocSum; 
					end
				else
					begin
						SET   @quantityToBeDeducted = @quantityToBeDeducted + @currentAllocSum; 
					end
				
			END 
		ELSE
			BEGIN
				SET   @prevItem = @currentItem;
				SET   @prevLocation = @currentLocation;
				SET   @prevWarehouse = @currentWarehouse;
				SET   @prevLogisticsUnit = @currentLogisticsUnit;
				SET   @prevLot = @currentLot;
				SET   @prevLocInvAttributesId = @currentLocInvAttributesId

				if @direction = N'To' 
					Begin
						SET   @quantityToBeDeducted =  @currentAllocSum; 
					end
				else
					begin
						SET   @quantityToBeDeducted = @currentAllocSum;
					end
				
			END


	if @direction = N'To' 
		Begin
			UPDATE
			   @tempTable
			SET
			   BEFORE_IN_TRANSIT_QTY = BEFORE_IN_TRANSIT_QTY - @quantityToBeDeducted + @currentAllocSum,
				IN_TRANSIT_QTY = IN_TRANSIT_QTY - @quantityToBeDeducted
			WHERE
			   ID = @CURRENTINDEX; 
		END 
	ELSE 
	   Begin
		UPDATE
		   @tempTable
		SET
		--Setting before Allocated Qty= Total Allocated Qty -Sum of all shipment allocated qty + current shipment allocated qty
		   BEFORE_ALLOCATED_QTY = BEFORE_ALLOCATED_QTY - @quantityToBeDeducted + @currentAllocSum,
		--Setting Allocated qty=Total Allocated Qty-Sum of all shipment allocated qty
			ALLOCATED_QTY = ALLOCATED_QTY - @quantityToBeDeducted
		WHERE
		   ID = @CURRENTINDEX; 
		END
	SET @CURRENTINDEX = @CURRENTINDEX + 1;
END--End of while loop

if @direction = N'To' 
Begin
	INSERT INTO TRANSACTION_HISTORY (User_Name, Transaction_Type,  Direction,  Process_Stamp,  Warehouse,  Company,  Internal_Key_Id,Item,Location
	,Lot,Quantity,Quantity_Um,Reference_Id,Reference_Line_Num,Before_On_Hand_Qty,Before_Alloc_Qty,Before_In_Transit_Qty,Before_Suspense_Qty
	,BEFORE_EXPIRATION_DATE, BEFORE_STS,After_On_Hand_Qty,After_Alloc_Qty,After_In_Transit_Qty,After_Suspense_Qty,AFTER_EXPIRATION_DATE,AFTER_STS
	 ,User_Stamp,Date_Time_Stamp,Activity_Date_Time,CONTAINER_ID)
	Select @userName, 200, @direction, @processStamp, WAREHOUSE,COMPANY, NULL, ITEM, LOCATION
	, LOT, ALLOCSUM, QUANTITY_UM, SHIPMENT_ID, 0, ON_HAND_QTY, ALLOCATED_QTY, BEFORE_IN_TRANSIT_QTY
	, SUSPENSE_QTY, EXPIRATION_DATE, INVENTORY_STS,ON_HAND_QTY, ALLOCATED_QTY, IN_TRANSIT_QTY, SUSPENSE_QTY, 
		(CASE WHEN((ON_HAND_QTY + ALLOCATED_QTY + IN_TRANSIT_QTY  + SUSPENSE_QTY)>0) THEN EXPIRATION_DATE ELSE NULL END), 
		(CASE WHEN((ON_HAND_QTY + ALLOCATED_QTY + IN_TRANSIT_QTY  + SUSPENSE_QTY)>0) THEN INVENTORY_STS ELSE NULL END), 
		@USERNAME, convert(datetime,convert(nvarchar,GETUTCDATE(),20)),convert(datetime,convert(nvarchar,GETUTCDATE(),20)), LOGISTICS_UNIT 
		FROM  @tempTable;
END 
	ELSE 
Begin
	INSERT INTO TRANSACTION_HISTORY (User_Name, Transaction_Type,  Direction,  Process_Stamp,  Warehouse,  Company,  Internal_Key_Id,Item,Location
	,Lot,Quantity,Quantity_Um,Reference_Id,Reference_Line_Num,Before_On_Hand_Qty,Before_Alloc_Qty,Before_In_Transit_Qty,Before_Suspense_Qty
	,BEFORE_EXPIRATION_DATE, BEFORE_STS,After_On_Hand_Qty,After_Alloc_Qty,After_In_Transit_Qty,After_Suspense_Qty,AFTER_EXPIRATION_DATE,AFTER_STS
	 ,User_Stamp,Date_Time_Stamp,Activity_Date_Time,CONTAINER_ID)
	Select @userName, 200, @direction, @processStamp, WAREHOUSE, COMPANY, NULL, ITEM, LOCATION
	, LOT, ALLOCSUM, QUANTITY_UM, SHIPMENT_ID, 0, ON_HAND_QTY, BEFORE_ALLOCATED_QTY, IN_TRANSIT_QTY
	, SUSPENSE_QTY, EXPIRATION_DATE, INVENTORY_STS, ON_HAND_QTY, ALLOCATED_QTY, IN_TRANSIT_QTY , SUSPENSE_QTY, 
		(CASE WHEN((ON_HAND_QTY + ALLOCATED_QTY + IN_TRANSIT_QTY + SUSPENSE_QTY)>0) THEN EXPIRATION_DATE ELSE NULL END), 
		(CASE WHEN((ON_HAND_QTY + ALLOCATED_QTY + IN_TRANSIT_QTY + SUSPENSE_QTY)>0) THEN INVENTORY_STS ELSE NULL END), 
		@USERNAME, convert(datetime,convert(nvarchar,GETUTCDATE(),20)),convert(datetime,convert(nvarchar,GETUTCDATE(),20)), LOGISTICS_UNIT 
		FROM  @tempTable;
END
END