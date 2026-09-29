-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */













CREATE PROCEDURE ALC_UpdateShipAllocReqFP(
	@iLaunchNum numeric(9),
	@stUserName nvarchar(30))
AS
	SET NOCOUNT ON;

	-- [comment omitted]
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
       SHIPMENT_ALLOC_REQUEST.PROCESS_STAMP = N'<literal:1>',
       SHIPMENT_ALLOC_REQUEST.DATE_TIME_STAMP = GETUTCDATE()
  FROM ITEM_UNIT_OF_MEASURE ium1,
  	   (SELECT sar1.ITEM, sar1.COMPANY, ium2.ITEM_CLASS, sar1.INTERNAL_SHIP_ALLOC_NUM, 
			   MIN(sar1.ALLOCATED_QTY/ium2.CONVERSION_QTY) factor
		  FROM ITEM_UNIT_OF_MEASURE ium2, SHIPMENT_ALLOC_REQUEST sar1
		 WHERE (
			    (ium2.ITEM = sar1.ITEM 
				 AND ISNULL(ium2.COMPANY, N'<literal:2>') = ISNULL(sar1.COMPANY, N'<literal:3>')) 
			   OR (ium2.ITEM_CLASS = 
					 (SELECT ITEM_CLASS
					FROM ITEM 
					WHERE ITEM.ITEM = sar1.ITEM 
						AND ISNULL(ITEM.COMPANY, N'<literal:4>') = ISNULL(sar1.COMPANY, N'<literal:5>') 
						-- [comment omitted]
						AND NOT EXISTS (SELECT ITEM
										FROM ITEM_UNIT_OF_MEASURE ium3
										WHERE ium3.ITEM = sar1.ITEM 
										AND ISNULL(ium3.COMPANY, N'<literal:6>') = ISNULL(sar1.COMPANY, N'<literal:7>')
									) -- [comment omitted]
					) -- [comment omitted]
				) -- [comment omitted]
			)-- [comment omitted]
		AND FLOOR(sar1.ALLOCATED_QTY/ium2.CONVERSION_QTY) = (sar1.ALLOCATED_QTY/ium2.CONVERSION_QTY) 
		AND sar1.LAUNCH_NUM = @iLaunchNum
	GROUP BY sar1.ITEM, sar1.COMPANY, ium2.ITEM_CLASS, sar1.INTERNAL_SHIP_ALLOC_NUM) conv_factor
 WHERE (
        (ium1.ITEM = SHIPMENT_ALLOC_REQUEST.ITEM 
         AND ium1.ITEM = conv_factor.ITEM
         AND ISNULL(ium1.COMPANY, N'<literal:8>') = ISNULL(conv_factor.COMPANY, N'<literal:9>')
         AND ISNULL(ium1.COMPANY, N'<literal:10>') = ISNULL(SHIPMENT_ALLOC_REQUEST.COMPANY, N'<literal:11>')
        )-- [comment omitted]
        OR (ium1.ITEM_CLASS = 
              (SELECT ITEM_CLASS
                 FROM ITEM
                WHERE ITEM.ITEM = SHIPMENT_ALLOC_REQUEST.ITEM 
                  AND ISNULL(ITEM.COMPANY, N'<literal:12>') = ISNULL(SHIPMENT_ALLOC_REQUEST.COMPANY, N'<literal:13>')
                  -- [comment omitted]
                  AND NOT EXISTS (SELECT ITEM
                                    FROM ITEM_UNIT_OF_MEASURE ium4
                                   WHERE ium4.ITEM = SHIPMENT_ALLOC_REQUEST.ITEM 
                                     AND ISNULL(ium4.COMPANY, N'<literal:14>') = ISNULL(SHIPMENT_ALLOC_REQUEST.COMPANY, N'<literal:15>')
                                 ) -- [comment omitted]
              ) -- [comment omitted]
              AND ium1.ITEM_CLASS = conv_factor.ITEM_CLASS
           ) -- [comment omitted]
       ) -- [comment omitted]
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
				 AND ISNULL(ium2.COMPANY, N'<literal:16>') = ISNULL(sar1.COMPANY, N'<literal:17>')) 
			   OR (ium2.ITEM_CLASS = 
					 (SELECT ITEM_CLASS
					FROM ITEM 
					WHERE ITEM.ITEM = sar1.ITEM 
						AND ISNULL(ITEM.COMPANY, N'<literal:18>') = ISNULL(sar1.COMPANY, N'<literal:19>') 
						-- [comment omitted]
						AND NOT EXISTS (SELECT ITEM
										FROM ITEM_UNIT_OF_MEASURE ium3
										WHERE ium3.ITEM = sar1.ITEM 
										AND ISNULL(ium3.COMPANY, N'<literal:20>') = ISNULL(sar1.COMPANY, N'<literal:21>')
									) -- [comment omitted]
					) -- [comment omitted]
				) -- [comment omitted]
			)-- [comment omitted]
		AND FLOOR(sar1.ALLOCATED_QTY/ium2.CONVERSION_QTY) = (sar1.ALLOCATED_QTY/ium2.CONVERSION_QTY) 
		AND sar1.LAUNCH_NUM = @iLaunchNum
	GROUP BY sar1.ITEM, sar1.COMPANY, ium2.ITEM_CLASS, sar1.INTERNAL_SHIP_ALLOC_NUM) conv_factor
     WHERE (
        (ium1.ITEM = SHIPMENT_ALLOC_REQUEST.ITEM 
         AND ium1.ITEM = conv_factor.ITEM
         AND ISNULL(ium1.COMPANY, N'<literal:22>') = ISNULL(conv_factor.COMPANY, N'<literal:23>')
         AND ISNULL(ium1.COMPANY, N'<literal:24>') = ISNULL(SHIPMENT_ALLOC_REQUEST.COMPANY, N'<literal:25>')
        )-- [comment omitted]
        OR (ium1.ITEM_CLASS = 
              (SELECT ITEM_CLASS
                 FROM ITEM
                WHERE ITEM.ITEM = SHIPMENT_ALLOC_REQUEST.ITEM 
                  AND ISNULL(ITEM.COMPANY, N'<literal:26>') = ISNULL(SHIPMENT_ALLOC_REQUEST.COMPANY, N'<literal:27>')
                  -- [comment omitted]
                  AND NOT EXISTS (SELECT ITEM
                                    FROM ITEM_UNIT_OF_MEASURE ium4
                                   WHERE ium4.ITEM = SHIPMENT_ALLOC_REQUEST.ITEM 
                                     AND ISNULL(ium4.COMPANY, N'<literal:28>') = ISNULL(SHIPMENT_ALLOC_REQUEST.COMPANY, N'<literal:29>')
                                 ) -- [comment omitted]
              ) -- [comment omitted]
              AND ium1.ITEM_CLASS = conv_factor.ITEM_CLASS
           ) -- [comment omitted]
       ) -- [comment omitted]
     AND FLOOR(SHIPMENT_ALLOC_REQUEST.ALLOCATED_QTY/ium1.CONVERSION_QTY) = 
       (SHIPMENT_ALLOC_REQUEST.ALLOCATED_QTY/ium1.CONVERSION_QTY)
     AND (SHIPMENT_ALLOC_REQUEST.ALLOCATED_QTY/ium1.CONVERSION_QTY) = conv_factor.factor
     AND SHIPMENT_ALLOC_REQUEST.LAUNCH_NUM = @iLaunchNum);
	
if (@@ERROR <> 0) return -1;
-- [comment omitted]
