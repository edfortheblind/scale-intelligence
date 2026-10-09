CREATE PROCEDURE INV_UpsertCatchWeightInfo(
    @iIntLocInv numeric(9),
    @catchWeight numeric(14,5),
    @catchWeightUM nvarchar(25),
    @dInitOnHandQty numeric(19,5),
    @dNewOnHandQty numeric(19,5),
    @stUserName nvarchar(30),
    @shipContNum numeric(9) = NULL,
    @stWorkType nvarchar(25) = NULL)
AS
    SET NOCOUNT ON;
    
    declare @existingCatchWeightUM nvarchar(25);
    declare @existingShippingContainerWeight numeric(19,5);
    declare @parentShipContNum numeric(9);
    declare @shippingContainerWeight numeric(19,5);
    declare @shippingContainerWeightDifference numeric(19,5);
	declare @isCycleCountWork nvarchar(1);
    
    IF (@shipContNum IS NOT NULL AND @shipContNum <> 0)    
    BEGIN     
        IF NOT EXISTS(SELECT 1 FROM SHIPPING_CONTAINER_CATCH_WEIGHT_INFORMATION     
                      WHERE SHIP_CONT_NUM = @shipContNum)    
        BEGIN    
            INSERT INTO SHIPPING_CONTAINER_CATCH_WEIGHT_INFORMATION    
            (SHIP_CONT_NUM, INTERNAL_LOCATION_INV, CATCH_WEIGHT, WEIGHT_UM,     
             USER_STAMP, PROCESS_STAMP, DATE_TIME_STAMP)    
            VALUES    
            (@shipContNum, @iIntLocInv, @catchWeight, @catchWeightUM,    
             @stUserName, N'INV_UpsertCatchWeightInfo', GETUTCDATE());   
                --propogate weight
                 --get existing weight
			 SELECT
            @existingShippingContainerWeight = ISNULL(WEIGHT, 0),
            @parentShipContNum = PARENT
        FROM SHIPPING_CONTAINER
        WHERE INTERNAL_CONTAINER_NUM = @shipContNum;
			 -- Business logic expects one row per SHIP_CONT_NUM. TOP 1 / OBJECT_ID DESC is a
        -- defensive fallback so container weight still resolves deterministically if duplicates exist.
        SET @shippingContainerWeightDifference = @catchWeight - @existingShippingContainerWeight;

                UPDATE SHIPPING_CONTAINER
                SET WEIGHT = @catchWeight,
                    USER_STAMP = @stUserName,
                    PROCESS_STAMP = N'INV_UpsertCatchWeightInfo',
                    DATE_TIME_STAMP = GETUTCDATE()
                WHERE INTERNAL_CONTAINER_NUM = @shipContNum;

                -- Shipping container nesting stores "no parent" as NULL/0 in this path, so skip the delta update when no parent exists.
                IF @parentShipContNum IS NOT NULL
                   AND @parentShipContNum <> 0
                   AND @shippingContainerWeightDifference <> 0
                    BEGIN
                        UPDATE SHIPPING_CONTAINER
                        SET WEIGHT = ISNULL(WEIGHT, 0) + @shippingContainerWeightDifference,
                            USER_STAMP = @stUserName,
                            PROCESS_STAMP = N'INV_UpsertCatchWeightInfo',
                            DATE_TIME_STAMP = GETUTCDATE()
                        WHERE INTERNAL_CONTAINER_NUM = @parentShipContNum;
                    END
        END    
        ELSE    
        BEGIN      
            IF(@catchWeight <= 0 AND @dInitOnHandQty > 0)    
            BEGIN    
                SELECT     
                    @catchWeight = ((CATCH_WEIGHT/@dInitOnHandQty) * (@dNewOnHandQty - @dInitOnHandQty)),    
                    @existingCatchWeightUM = WEIGHT_UM     
                FROM SHIPPING_CONTAINER_CATCH_WEIGHT_INFORMATION    
                WHERE INTERNAL_LOCATION_INV = @iIntLocInv    
                  AND SHIP_CONT_NUM = @shipContNum;    
            END    
    
            SET @catchWeightUM =     
            CASE    
                WHEN @catchWeightUM IS NULL AND @existingCatchWeightUM IS NOT NULL     
                    THEN @existingCatchWeightUM    
                ELSE @catchWeightUM    
            END;    
    
            UPDATE SHIPPING_CONTAINER_CATCH_WEIGHT_INFORMATION    
            SET CATCH_WEIGHT = CASE
                                   WHEN ISNULL(INTERNAL_LOCATION_INV, -1) = ISNULL(@iIntLocInv, -1)
                                       THEN ISNULL(CATCH_WEIGHT, 0) + @catchWeight
                                   ELSE @catchWeight
                               END,    
                WEIGHT_UM = @catchWeightUM,    
                USER_STAMP = @stUserName,    
                PROCESS_STAMP = N'INV_UpsertCatchWeightInfo',  
                DATE_TIME_STAMP = GETUTCDATE(),
				INTERNAL_LOCATION_INV = @iIntLocInv
            WHERE SHIP_CONT_NUM = @shipContNum;    
        END  

         -- Business logic expects one row per SHIP_CONT_NUM in SHIPPING_CONTAINER.
        SELECT
            @existingShippingContainerWeight = ISNULL(WEIGHT, 0),
            @parentShipContNum = PARENT
        FROM SHIPPING_CONTAINER
        WHERE INTERNAL_CONTAINER_NUM = @shipContNum;

        -- Business logic expects one row per SHIP_CONT_NUM in SHIPPING_CONTAINER_CATCH_WEIGHT_INFORMATION.
        -- ORDER BY OBJECT_ID DESC is a defensive fallback so the weight still resolves
        -- deterministically if duplicate rows exist.
        SELECT TOP 1 @shippingContainerWeight = ISNULL(CATCH_WEIGHT, 0)
        FROM SHIPPING_CONTAINER_CATCH_WEIGHT_INFORMATION
        WHERE SHIP_CONT_NUM = @shipContNum
        ORDER BY OBJECT_ID DESC;

        IF @shippingContainerWeight > 0
            BEGIN
                SET @shippingContainerWeightDifference = @shippingContainerWeight - @existingShippingContainerWeight;

                UPDATE SHIPPING_CONTAINER
                SET WEIGHT = @shippingContainerWeight,
                    USER_STAMP = @stUserName,
                    PROCESS_STAMP = N'INV_UpsertCatchWeightInfo',
                    DATE_TIME_STAMP = GETUTCDATE()
                WHERE INTERNAL_CONTAINER_NUM = @shipContNum;

                -- Shipping container nesting stores "no parent" as NULL/0 in this path, so skip the delta update when no parent exists.
                IF @parentShipContNum IS NOT NULL
                   AND @parentShipContNum <> 0
                   AND @shippingContainerWeightDifference <> 0
                    BEGIN
                        UPDATE SHIPPING_CONTAINER
                        SET WEIGHT = ISNULL(WEIGHT, 0) + @shippingContainerWeightDifference,
                            USER_STAMP = @stUserName,
                            PROCESS_STAMP = N'INV_UpsertCatchWeightInfo',
                            DATE_TIME_STAMP = GETUTCDATE()
                        WHERE INTERNAL_CONTAINER_NUM = @parentShipContNum;
                    END
            END
    END      
    ELSE    
    BEGIN    
        -- Handle standard CATCH_WEIGHT_INFORMATION    
        IF NOT EXISTS(SELECT 1 FROM CATCH_WEIGHT_INFORMATION     
                      WHERE INTERNAL_LOCATION_INV = @iIntLocInv)    
        BEGIN    
            INSERT INTO CATCH_WEIGHT_INFORMATION    
            (INTERNAL_LOCATION_INV, CATCH_WEIGHT, WEIGHT_UM,     
             USER_STAMP, PROCESS_STAMP, DATE_TIME_STAMP)    
            VALUES    
            (@iIntLocInv, @catchWeight, @catchWeightUM,    
             @stUserName, N'INV_UpsertCatchWeightInfo', GETUTCDATE());    
        END 	
        ELSE    
        BEGIN
			SET @isCycleCountWork = N'N';
			IF (@stWorkType IS NOT NULL and @stWorkType <> N'' )
			BEGIN
				-- if reference type is cycle count, then we need to check work type and work group 
				-- to determine whether the work is cycle count work or not
				SELECT @isCycleCountWork =
				    CASE
					    WHEN WORK_GROUP = N'Cycle Counting' THEN N'Y'
					    ELSE N'N'
				    END
				FROM WORK_TYPE
				WHERE WORK_TYPE = @stWorkType;

				SET @isCycleCountWork = ISNULL(@isCycleCountWork, N'N');
			END
			-- if work type is not cycle count then calculate the average 
            SELECT     
                @catchWeight = 
				CASE 
					WHEN (@catchWeight <= 0 AND @dInitOnHandQty > 0 AND @isCycleCountWork = N'N') THEN 
						((CATCH_WEIGHT/@dInitOnHandQty) * (@dNewOnHandQty - @dInitOnHandQty))
					ELSE @catchWeight
				END,
                @existingCatchWeightUM = WEIGHT_UM
            FROM CATCH_WEIGHT_INFORMATION
            WHERE INTERNAL_LOCATION_INV = @iIntLocInv;
    
            SET @catchWeightUM =     
            CASE    
                WHEN @catchWeightUM IS NULL AND @existingCatchWeightUM IS NOT NULL     
                    THEN @existingCatchWeightUM    
                ELSE @catchWeightUM    
            END;    
    
			UPDATE CATCH_WEIGHT_INFORMATION    
				SET CATCH_WEIGHT = (CATCH_WEIGHT + @catchWeight),    
					WEIGHT_UM = @catchWeightUM,    
					USER_STAMP = @stUserName,    
					PROCESS_STAMP = N'INV_UpsertCatchWeightInfo',  
					DATE_TIME_STAMP = GETUTCDATE()    
				WHERE INTERNAL_LOCATION_INV = @iIntLocInv;    
        END  -- end else
    END   --end else  
    
    RETURN 0;
-- end INV_UpsertCatchWeightInfo
