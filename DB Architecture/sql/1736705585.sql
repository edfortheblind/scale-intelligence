-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

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
 -- [comment omitted]
 DECLARE @iIntLocInv numeric(9);
 DECLARE @stWeightUM nvarchar(25);
 DECLARE @stItemClass nvarchar(50);
 DECLARE @recordsFound INT;
 DECLARE @cCatchWeightReqd nchar(1);    
     
 SET @recordsFound = 0;    
     
 -- [comment omitted]
 -- [comment omitted]
 -- [comment omitted]
 -- [comment omitted]
 SELECT @cCatchWeightReqd = CATCH_WEIGHT_REQD    
 FROM ITEM    
 WHERE ITEM = @stItem    
   AND (ISNULL(COMPANY, N'<literal:1>') = ISNULL(@stCompany, N'<literal:2>')    
        OR COMPANY IS NULL);    
     
  IF (@cCatchWeightReqd IS NULL OR @cCatchWeightReqd <> N'<literal:3>')
 BEGIN
  -- [comment omitted]
  RETURN;
 END   
     
 -- [comment omitted]
     -- [comment omitted]
     -- [comment omitted]
     -- [comment omitted]
     -- [comment omitted]
     -- [comment omitted]

  IF (ISNULL(@iInternalLocationInv, 0) > 0)
 BEGIN
  SET @iIntLocInv = @iInternalLocationInv;
 END
 ELSE IF (@stItem IS NOT NULL AND @stWarehouse IS NOT NULL AND @stLocation IS NOT NULL)
 BEGIN
  -- [comment omitted]
  -- [comment omitted]
  IF (ISNULL(@iInvAttributeId, 0) > 0)
  BEGIN
   SELECT TOP 1 @iIntLocInv = li.INTERNAL_LOCATION_INV
   FROM LOCATION_INVENTORY li
   INNER JOIN LOCATION_INVENTORY_ATTRIBUTES lia ON li.INTERNAL_LOCATION_INV = lia.OBJECT_ID
   WHERE li.ITEM = @stItem
     AND ISNULL(li.COMPANY, N'<literal:4>') = ISNULL(@stCompany, N'<literal:5>')
     AND li.WAREHOUSE = @stWarehouse
     AND li.LOCATION = @stLocation
     AND (@stLot IS NULL OR ISNULL(li.LOT, N'<literal:6>') = ISNULL(@stLot, N'<literal:7>'))
     AND (@stLogisticsUnit IS NULL OR li.LOGISTICS_UNIT = @stLogisticsUnit)
     AND lia.OBJECT_ID = @iInvAttributeId;
  END   
  ELSE    
  BEGIN    
   SELECT TOP 1 @iIntLocInv = INTERNAL_LOCATION_INV    
   FROM LOCATION_INVENTORY    
   WHERE ITEM = @stItem    
     AND ISNULL(COMPANY, N'<literal:8>') = ISNULL(@stCompany, N'<literal:9>')    
     AND WAREHOUSE = @stWarehouse    
     AND LOCATION = @stLocation    
     AND (@stLot IS NULL OR ISNULL(LOT, N'<literal:10>') = ISNULL(@stLot, N'<literal:11>'))    
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
     
 -- [comment omitted]
    -- [comment omitted]
    -- [comment omitted]
    -- [comment omitted]
    -- [comment omitted]
    -- [comment omitted]
 IF (@recordsFound = 0)    
 BEGIN    
  -- [comment omitted]
  INSERT INTO @retTable (weightUM, weight, source)    
  SELECT DISTINCT WEIGHT_UM,  
         CASE WHEN WEIGHT > 0 THEN WEIGHT ELSE 1 END,  
         2    
  FROM ITEM_UNIT_OF_MEASURE    
  WHERE ITEM = @stItem    
    AND ISNULL(COMPANY, N'<literal:12>') = ISNULL(@stCompany, N'<literal:13>')    
    AND SEQUENCE = 1    
    AND WEIGHT_UM IS NOT NULL;    
  
  SET @recordsFound = @@ROWCOUNT;    
     
  -- [comment omitted]
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
     
 -- [comment omitted]
     IF (@recordsFound = 0)
     BEGIN
      -- [comment omitted]
   SELECT @stItemClass = ITEM_CLASS    
   FROM ITEM    
   WHERE ITEM = @stItem    
     AND (ISNULL(COMPANY, N'<literal:14>') = ISNULL(@stCompany, N'<literal:15>')    
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
     
  -- [comment omitted]
     -- [comment omitted]
     -- [comment omitted]
     -- [comment omitted]
     -- [comment omitted]
     -- [comment omitted]
 IF (@recordsFound = 0)    
 BEGIN    
  INSERT INTO @retTable (weightUM, weight, source)    
  SELECT TOP 1 cwi.WEIGHT_UM, cwi.CATCH_WEIGHT, 3    
  FROM CATCH_WEIGHT_INFORMATION cwi    
  INNER JOIN LOCATION_INVENTORY li ON cwi.INTERNAL_LOCATION_INV = li.INTERNAL_LOCATION_INV    
  WHERE li.ITEM = @stItem    
    AND ISNULL(li.COMPANY, N'<literal:16>') = ISNULL(@stCompany, N'<literal:17>')    
    AND cwi.WEIGHT_UM IS NOT NULL;    
  
  SET @recordsFound = @@ROWCOUNT;    
 END     
-- [comment omitted]
     -- [comment omitted]
     -- [comment omitted]
     -- [comment omitted]
     -- [comment omitted]
 IF (@recordsFound = 0)    
 BEGIN    

  INSERT INTO @retTable (weightUM, weightUMDescription, weight, source)    
  SELECT IDENTIFIER,
  DESCRIPTION,
  1,
  4    
  FROM GENERIC_CONFIG_DETAIL    
  WHERE RECORD_TYPE = N'<literal:18>'    
    AND ACTIVE = N'<literal:19>';      
  RETURN;    
 END    
     
 IF (@recordsFound > 0)    
 BEGIN    
  UPDATE tempTable set tempTable.weightUMDescription = gcd.DESCRIPTION 
    FROM @retTable AS tempTable
    JOIN GENERIC_CONFIG_DETAIL AS gcd 
    ON tempTable.weightUM = gcd.IDENTIFIER
    AND gcd.RECORD_TYPE = N'<literal:20>'    
 END      
 RETURN;    
END -- [comment omitted]
