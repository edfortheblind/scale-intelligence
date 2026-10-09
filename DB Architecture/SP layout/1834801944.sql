/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	11823		| TBS			| 11/12/03	| Created.
	14178		| LJM			| 03/23/04	| fixed to work for items with multiple UMs of same conversion quantity
	
	Updates the converted qty and um fields, dimension and weight fields on the 
	shipment allocation request when going down Fast Path Allocation. 
	
	Parameters
		int		iLaunchNum		The launch num to update.
		String	stUserName		The current user.
*/

CREATE PROCEDURE ALC_UpdateShipAllocReqFP(
	@iLaunchNum numeric(9),
	@stUserName nvarchar(30))
AS
	SET NOCOUNT ON;

	-- validate parameters.
	if (@iLaunchNum is null
		OR @iLaunchNum <= 0)
		return -1;

UPDATE SHIPMENT_ALLOC_REQUEST
   SET SHIPMENT_ALLOC_REQUEST.CONVERTED_QTY_UM = ium1.QUANTITY_UM, 
       SHIPMENT_ALLOC_REQUEST.CONVERTED_ALLOC_QTY = ALLOCATED_QTY/ium1.CONVERSION_QTY,
       SHIPMENT_ALLOC_REQUEST.CONTAINER_HEIGHT = ium1.HEIGHT,
       SHIPMENT_ALLOC_REQUEST.CONTAINER_LENGTH = ium1.LENGTH, 
       SHIPMENT_ALLOC_REQUEST.CONTAINER_WEIGHT = ium1.WEIGHT,
       SHIPMENT_ALLOC_REQUEST.CONTAINER_WIDTH = ium1.WIDTH, 
       SHIPMENT_ALLOC_REQUEST.CONTAINER_DIMENSION_UM = ium1.DIMENSION_UM, 
       SHIPMENT_ALLOC_REQUEST.CONTAINER_WEIGHT_UM = ium1.WEIGHT_UM,
       SHIPMENT_ALLOC_REQUEST.TREAT_AS_LOOSE = ium1.TREAT_AS_LOOSE,
       SHIPMENT_ALLOC_REQUEST.USER_STAMP = @stUserName,
       SHIPMENT_ALLOC_REQUEST.PROCESS_STAMP = N'ALC_UpdateShipAllocReqFP',
       SHIPMENT_ALLOC_REQUEST.DATE_TIME_STAMP = GETUTCDATE()
  FROM ITEM_UNIT_OF_MEASURE ium1,
  	   (SELECT sar1.ITEM, sar1.COMPANY, ium2.ITEM_CLASS, sar1.INTERNAL_SHIP_ALLOC_NUM, 
			   MIN(sar1.ALLOCATED_QTY/ium2.CONVERSION_QTY) factor
		  FROM ITEM_UNIT_OF_MEASURE ium2, SHIPMENT_ALLOC_REQUEST sar1
		 WHERE (
			    (ium2.ITEM = sar1.ITEM 
				 AND ISNULL(ium2.COMPANY, N'*') = ISNULL(sar1.COMPANY, N'*')) 
			   OR (ium2.ITEM_CLASS = 
					 (SELECT ITEM_CLASS
					FROM ITEM 
					WHERE ITEM.ITEM = sar1.ITEM 
						AND ISNULL(ITEM.COMPANY, N'*') = ISNULL(sar1.COMPANY, N'*') 
						-- Exclude the item's item class um's when an item unit of measure exists.
						AND NOT EXISTS (SELECT ITEM
										FROM ITEM_UNIT_OF_MEASURE ium3
										WHERE ium3.ITEM = sar1.ITEM 
										AND ISNULL(ium3.COMPANY, N'*') = ISNULL(sar1.COMPANY, N'*')
									) -- end AND NOT EXISTS (SELECT ITEM
					) -- end (SELECT ITEM_CLASS
				) -- end OR (ium2.ITEM_CLASS =
			)-- end WHERE (
		AND FLOOR(sar1.ALLOCATED_QTY/ium2.CONVERSION_QTY) = (sar1.ALLOCATED_QTY/ium2.CONVERSION_QTY) 
		AND sar1.LAUNCH_NUM = @iLaunchNum
	GROUP BY sar1.ITEM, sar1.COMPANY, ium2.ITEM_CLASS, sar1.INTERNAL_SHIP_ALLOC_NUM) conv_factor
 WHERE (
        (ium1.ITEM = SHIPMENT_ALLOC_REQUEST.ITEM 
         AND ium1.ITEM = conv_factor.ITEM
         AND ISNULL(ium1.COMPANY, N'*') = ISNULL(conv_factor.COMPANY, N'*')
         AND ISNULL(ium1.COMPANY, N'*') = ISNULL(SHIPMENT_ALLOC_REQUEST.COMPANY, N'*')
        )-- end (ium1.ITEM = SHIPMENT_ALLOC_REQUEST.ITEM 
        OR (ium1.ITEM_CLASS = 
              (SELECT ITEM_CLASS
                 FROM ITEM
                WHERE ITEM.ITEM = SHIPMENT_ALLOC_REQUEST.ITEM 
                  AND ISNULL(ITEM.COMPANY, N'*') = ISNULL(SHIPMENT_ALLOC_REQUEST.COMPANY, N'*')
                  -- Exclude the item's item class um's when an item unit of measure exists.
                  AND NOT EXISTS (SELECT ITEM
                                    FROM ITEM_UNIT_OF_MEASURE ium4
                                   WHERE ium4.ITEM = SHIPMENT_ALLOC_REQUEST.ITEM 
                                     AND ISNULL(ium4.COMPANY, N'*') = ISNULL(SHIPMENT_ALLOC_REQUEST.COMPANY, N'*')
                                 ) -- end AND NOT EXISTS (SELECT ITEM 
              ) -- end (SELECT ITEM_CLASS 
              AND ium1.ITEM_CLASS = conv_factor.ITEM_CLASS
           ) -- end OR (ium1.ITEM_CLASS = 
       ) -- end WHERE (
   AND FLOOR(SHIPMENT_ALLOC_REQUEST.ALLOCATED_QTY/ium1.CONVERSION_QTY) = 
       (SHIPMENT_ALLOC_REQUEST.ALLOCATED_QTY/ium1.CONVERSION_QTY)
   AND (SHIPMENT_ALLOC_REQUEST.ALLOCATED_QTY/ium1.CONVERSION_QTY) = conv_factor.factor
   AND SHIPMENT_ALLOC_REQUEST.LAUNCH_NUM = @iLaunchNum
   AND SEQUENCE = 
       (SELECT MAX(SEQUENCE)
       FROM ITEM_UNIT_OF_MEASURE ium1,
  	   (SELECT sar1.ITEM, sar1.COMPANY, ium2.ITEM_CLASS, sar1.INTERNAL_SHIP_ALLOC_NUM, 
			   MIN(sar1.ALLOCATED_QTY/ium2.CONVERSION_QTY) factor
		  FROM ITEM_UNIT_OF_MEASURE ium2, SHIPMENT_ALLOC_REQUEST sar1
		 WHERE (
			    (ium2.ITEM = sar1.ITEM 
				 AND ISNULL(ium2.COMPANY, N'*') = ISNULL(sar1.COMPANY, N'*')) 
			   OR (ium2.ITEM_CLASS = 
					 (SELECT ITEM_CLASS
					FROM ITEM 
					WHERE ITEM.ITEM = sar1.ITEM 
						AND ISNULL(ITEM.COMPANY, N'*') = ISNULL(sar1.COMPANY, N'*') 
						-- Exclude the item's item class um's when an item unit of measure exists.
						AND NOT EXISTS (SELECT ITEM
										FROM ITEM_UNIT_OF_MEASURE ium3
										WHERE ium3.ITEM = sar1.ITEM 
										AND ISNULL(ium3.COMPANY, N'*') = ISNULL(sar1.COMPANY, N'*')
									) -- end AND NOT EXISTS (SELECT ITEM
					) -- end (SELECT ITEM_CLASS
				) -- end OR (ium2.ITEM_CLASS =
			)-- end WHERE (
		AND FLOOR(sar1.ALLOCATED_QTY/ium2.CONVERSION_QTY) = (sar1.ALLOCATED_QTY/ium2.CONVERSION_QTY) 
		AND sar1.LAUNCH_NUM = @iLaunchNum
	GROUP BY sar1.ITEM, sar1.COMPANY, ium2.ITEM_CLASS, sar1.INTERNAL_SHIP_ALLOC_NUM) conv_factor
     WHERE (
        (ium1.ITEM = SHIPMENT_ALLOC_REQUEST.ITEM 
         AND ium1.ITEM = conv_factor.ITEM
         AND ISNULL(ium1.COMPANY, N'*') = ISNULL(conv_factor.COMPANY, N'*')
         AND ISNULL(ium1.COMPANY, N'*') = ISNULL(SHIPMENT_ALLOC_REQUEST.COMPANY, N'*')
        )-- end (ium1.ITEM = SHIPMENT_ALLOC_REQUEST.ITEM 
        OR (ium1.ITEM_CLASS = 
              (SELECT ITEM_CLASS
                 FROM ITEM
                WHERE ITEM.ITEM = SHIPMENT_ALLOC_REQUEST.ITEM 
                  AND ISNULL(ITEM.COMPANY, N'*') = ISNULL(SHIPMENT_ALLOC_REQUEST.COMPANY, N'*')
                  -- Exclude the item's item class um's when an item unit of measure exists.
                  AND NOT EXISTS (SELECT ITEM
                                    FROM ITEM_UNIT_OF_MEASURE ium4
                                   WHERE ium4.ITEM = SHIPMENT_ALLOC_REQUEST.ITEM 
                                     AND ISNULL(ium4.COMPANY, N'*') = ISNULL(SHIPMENT_ALLOC_REQUEST.COMPANY, N'*')
                                 ) -- end AND NOT EXISTS (SELECT ITEM 
              ) -- end (SELECT ITEM_CLASS 
              AND ium1.ITEM_CLASS = conv_factor.ITEM_CLASS
           ) -- end OR (ium1.ITEM_CLASS = 
       ) -- end WHERE (
     AND FLOOR(SHIPMENT_ALLOC_REQUEST.ALLOCATED_QTY/ium1.CONVERSION_QTY) = 
       (SHIPMENT_ALLOC_REQUEST.ALLOCATED_QTY/ium1.CONVERSION_QTY)
     AND (SHIPMENT_ALLOC_REQUEST.ALLOCATED_QTY/ium1.CONVERSION_QTY) = conv_factor.factor
     AND SHIPMENT_ALLOC_REQUEST.LAUNCH_NUM = @iLaunchNum);
	
if (@@ERROR <> 0) return -1;
-- end ALC_UpdateShipAllocReqFP
