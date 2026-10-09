
CREATE FUNCTION INVfn_RtrvWeightUM(
 @stItem nvarchar(50),
 @stCompany nvarchar(25),
 @stWarehouse nvarchar(25),
 @stLocation nvarchar(25),
 @stLot nvarchar(25),
 @stLogisticsUnit nvarchar(50),
 @iInternalLocationInv numeric(9),
 @iInvAttributeId numeric(9))   
    
RETURNS @retTable TABLE (    
 weightUM nvarchar(25),
 weightUMDescription nvarchar(500),  
 weight numeric(19,5) DEFAULT 0,  
 source INT DEFAULT 0)    
    
AS    
BEGIN    
 -- local variables
 DECLARE @iIntLocInv numeric(9);
 DECLARE @stWeightUM nvarchar(25);
 DECLARE @stItemClass nvarchar(50);
 DECLARE @recordsFound INT;
 DECLARE @cCatchWeightReqd nchar(1);    
     
 SET @recordsFound = 0;    
     
 -- ============================================================  
 -- PRE-CHECK: Verify item is catch weight tracked
 -- If not catch weight required, return empty result
 -- ============================================================  
 SELECT @cCatchWeightReqd = CATCH_WEIGHT_REQD    
 FROM ITEM    
 WHERE ITEM = @stItem    
   AND (ISNULL(COMPANY, N'!') = ISNULL(@stCompany, N'!')    
        OR COMPANY IS NULL);    
     
  IF (@cCatchWeightReqd IS NULL OR @cCatchWeightReqd <> N'Y')
 BEGIN
  -- Item is not catch weight tracked, return empty
  RETURN;
 END   
     
 -- If internal_location_inv is provided directly, use it
     -- ============================================================
     -- RULE 1: Location Inventory Catch Weight
     -- If location inventory information is provided, fetch the 
     -- catch weight UM from CATCH_WEIGHT_INFORMATION table
     -- ============================================================

  IF (ISNULL(@iInternalLocationInv, 0) > 0)
 BEGIN
  SET @iIntLocInv = @iInternalLocationInv;
 END
 ELSE IF (@stItem IS NOT NULL AND @stWarehouse IS NOT NULL AND @stLocation IS NOT NULL)
 BEGIN
  -- Try to find the internal_location_inv based on provided criteria
  -- including inventory attributes if provided
  IF (ISNULL(@iInvAttributeId, 0) > 0)
  BEGIN
   SELECT TOP 1 @iIntLocInv = li.INTERNAL_LOCATION_INV
   FROM LOCATION_INVENTORY li
   INNER JOIN LOCATION_INVENTORY_ATTRIBUTES lia ON li.INTERNAL_LOCATION_INV = lia.OBJECT_ID
   WHERE li.ITEM = @stItem
     AND ISNULL(li.COMPANY, N'!') = ISNULL(@stCompany, N'!')
     AND li.WAREHOUSE = @stWarehouse
     AND li.LOCATION = @stLocation
     AND (@stLot IS NULL OR ISNULL(li.LOT, N'!') = ISNULL(@stLot, N'!'))
     AND (@stLogisticsUnit IS NULL OR li.LOGISTICS_UNIT = @stLogisticsUnit)
     AND lia.OBJECT_ID = @iInvAttributeId;
  END   
  ELSE    
  BEGIN    
   SELECT TOP 1 @iIntLocInv = INTERNAL_LOCATION_INV    
   FROM LOCATION_INVENTORY    
   WHERE ITEM = @stItem    
     AND ISNULL(COMPANY, N'!') = ISNULL(@stCompany, N'!')    
     AND WAREHOUSE = @stWarehouse    
     AND LOCATION = @stLocation    
     AND (@stLot IS NULL OR ISNULL(LOT, N'!') = ISNULL(@stLot, N'!'))    
     AND (@stLogisticsUnit IS NULL OR LOGISTICS_UNIT = @stLogisticsUnit);    
  END    
 END    
     
 IF (@iIntLocInv IS NOT NULL)    
 BEGIN    
  INSERT INTO @retTable (weightUM, weight, source)    
  SELECT DISTINCT cwi.WEIGHT_UM, cwi.CATCH_WEIGHT, 1    
  FROM CATCH_WEIGHT_INFORMATION cwi  
  WHERE cwi.INTERNAL_LOCATION_INV = @iIntLocInv
    AND cwi.WEIGHT_UM IS NOT NULL;    
  
  SET @recordsFound = @@ROWCOUNT;    
 END    
     
 -- If Rule 1 found records, return them
    -- ============================================================
    -- RULE 2: Item Unit of Measure Configuration
    -- Fetch the weight UM configured in the item unit of measure
    -- for the base UM (sequence = 1)
    -- ============================================================ 
 IF (@recordsFound = 0)    
 BEGIN    
  -- First try item/company combination 
  INSERT INTO @retTable (weightUM, weight, source)    
  SELECT DISTINCT WEIGHT_UM,  
         CASE WHEN WEIGHT > 0 THEN WEIGHT ELSE 1 END,  
         2    
  FROM ITEM_UNIT_OF_MEASURE    
  WHERE ITEM = @stItem    
    AND ISNULL(COMPANY, N'!') = ISNULL(@stCompany, N'!')    
    AND SEQUENCE = 1    
    AND WEIGHT_UM IS NOT NULL;    
  
  SET @recordsFound = @@ROWCOUNT;    
     
  -- If not found with company, try without company  
  IF (@recordsFound = 0 AND @stCompany IS NOT NULL)    
  BEGIN    
   INSERT INTO @retTable (weightUM, weight, source)    
   SELECT DISTINCT WEIGHT_UM,  
          CASE WHEN WEIGHT > 0 THEN WEIGHT ELSE 1 END,  
          2    
   FROM ITEM_UNIT_OF_MEASURE    
   WHERE ITEM = @stItem    
     AND COMPANY IS NULL    
     AND SEQUENCE = 1    
     AND WEIGHT_UM IS NOT NULL;    
  
   SET @recordsFound = @@ROWCOUNT;    
  END    
     
 -- If still not found, try by item class
     IF (@recordsFound = 0)
     BEGIN
      -- Get item class  
   SELECT @stItemClass = ITEM_CLASS    
   FROM ITEM    
   WHERE ITEM = @stItem    
     AND (ISNULL(COMPANY, N'!') = ISNULL(@stCompany, N'!')    
          OR COMPANY IS NULL);    
  
   IF (@stItemClass IS NOT NULL)    
   BEGIN    
    INSERT INTO @retTable (weightUM, weight, source)    
    SELECT DISTINCT WEIGHT_UM, CASE WHEN WEIGHT > 0 THEN WEIGHT ELSE 1 END , 2    
    FROM ITEM_UNIT_OF_MEASURE    
    WHERE ITEM_CLASS = @stItemClass    
      AND SEQUENCE = 1    
      AND WEIGHT_UM IS NOT NULL;    
  
    SET @recordsFound = @@ROWCOUNT;    
   END    
  END    
 END    
     
  -- If Rule 2 found records, return them
     -- ============================================================
     -- RULE 3: Item/Company Catch Weight
     -- Fetch TOP 1 record for item & company from catch weight 
     -- information table and use its weight UM
     -- ============================================================ 
 IF (@recordsFound = 0)    
 BEGIN    
  INSERT INTO @retTable (weightUM, weight, source)    
  SELECT TOP 1 cwi.WEIGHT_UM, cwi.CATCH_WEIGHT, 3    
  FROM CATCH_WEIGHT_INFORMATION cwi    
  INNER JOIN LOCATION_INVENTORY li ON cwi.INTERNAL_LOCATION_INV = li.INTERNAL_LOCATION_INV    
  WHERE li.ITEM = @stItem    
    AND ISNULL(li.COMPANY, N'!') = ISNULL(@stCompany, N'!')    
    AND cwi.WEIGHT_UM IS NOT NULL;    
  
  SET @recordsFound = @@ROWCOUNT;    
 END     
-- If Rule 3 found records, return them
     -- ============================================================
     -- RULE 4: Generic Config Detail (UMWEIGHT)
     -- Return all active UMWEIGHT records from generic_config_detail
     -- ============================================================ 
 IF (@recordsFound = 0)    
 BEGIN    

  INSERT INTO @retTable (weightUM, weightUMDescription, weight, source)    
  SELECT IDENTIFIER,
  DESCRIPTION,
  1,
  4    
  FROM GENERIC_CONFIG_DETAIL    
  WHERE RECORD_TYPE = N'UMWEIGHT'    
    AND ACTIVE = N'Y';      
  RETURN;    
 END    
     
 IF (@recordsFound > 0)    
 BEGIN    
  UPDATE tempTable set tempTable.weightUMDescription = gcd.DESCRIPTION 
    FROM @retTable AS tempTable
    JOIN GENERIC_CONFIG_DETAIL AS gcd 
    ON tempTable.weightUM = gcd.IDENTIFIER
    AND gcd.RECORD_TYPE = N'UMWEIGHT'    
 END      
 RETURN;    
END -- end INVfn_RtrvWeightUM
