-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
CREATE procedure SHP_ProcessShipmentDeallocationAndHistory
(  
      @waveNum numeric(9) 
    , @internalShipmentNum numeric(9)
    , @direction CHAR(4)         -- [comment omitted]
    , @invTrack nchar(1)
    , @userName nvarchar(30)
    , @processStamp nvarchar(100)
    , @outputMode TINYINT = 0    -- [comment omitted]
)  
AS  
BEGIN  
    SET NOCOUNT ON;  
    SET XACT_ABORT ON;  
  
    DECLARE @utcNow DATETIME = GETUTCDATE();  
  
  
    BEGIN TRY  
  
        -- [comment omitted]
        -- [comment omitted]
        -- [comment omitted]

         DECLARE @InvSnap Table
        (
            Direction CHAR(4) NOT NULL,

            Warehouse nvarchar(25),
            Company   nvarchar(25),
            Item      nvarchar(50),
            Location  nvarchar(25),
            Lot       nvarchar(25),

            Logistics_Unit nvarchar(50),
            Loc_Inv_Attributes_ID numeric(9),

            -- [comment omitted]
            On_Hand_Qty numeric(19,5),
            Suspense_Qty numeric(19,5),
            Expiration_Date datetime,
            Inventory_Sts nvarchar(50),

            -- [comment omitted]
            Before_Alloc_Qty numeric(19,5),
            After_Alloc_Qty  numeric(19,5),
            Before_In_Transit_Qty numeric(19,5),
            After_In_Transit_Qty  numeric(19,5),

            Internal_Location_Inv numeric(9)
        );
  
        -- [comment omitted]
        -- [comment omitted]
        -- [comment omitted]
        IF @direction = N'<literal:1>'  
        BEGIN  
            UPDATE Location_Inventory  
            SET  
                Location_Inventory.User_Stamp = @userName,  
                Location_Inventory.Process_Stamp = @processStamp,  
                Location_Inventory.Allocated_Qty =  
                    ISNULL(  
                        (  
                            SELECT Location_Inventory.Allocated_Qty - SUM(AR.Allocated_Qty)  
                            FROM Shipment_Alloc_Request AR  
                            WHERE  
                                (  
                                    (@waveNum <> 0 AND AR.LAUNCH_NUM = @waveNum)  
                                    OR (@internalShipmentNum <> 0 AND AR.INTERNAL_SHIPMENT_NUM = @internalShipmentNum)  
                                )  
                                AND AR.Inventory_Tracking = @invTrack  
                                AND AR.From_Whs = Location_Inventory.Warehouse  
                                AND AR.From_Loc = Location_Inventory.Location  
                                AND AR.Item = Location_Inventory.Item  
                                AND ((AR.Lot IS NULL AND Location_Inventory.Lot IS NULL) OR (AR.Lot = Location_Inventory.Lot))  
                                AND ((AR.From_Loc_Inv_Attributes_ID IS NULL AND Location_Inventory.Loc_Inv_Attributes_ID IS NULL)  
                                     OR (AR.From_Loc_Inv_Attributes_ID = Location_Inventory.Loc_Inv_Attributes_ID))  
                                AND ((AR.Company IS NULL AND Location_Inventory.Company IS NULL) OR (AR.Company = Location_Inventory.Company))  
                                AND ((AR.Logistics_Unit IS NULL AND Location_Inventory.Logistics_Unit IS NULL)  
                                     OR (Location_Inventory.Logistics_Unit = AR.Logistics_Unit))  
                            GROUP BY  
                                AR.From_Whs, AR.From_Loc, AR.Item, AR.Lot, AR.Company  
                        ),  
                        Location_Inventory.Allocated_Qty  
                    )  
            OUTPUT  
                N'<literal:2>',  
                inserted.Warehouse,  
                inserted.Company,  
                inserted.Item,  
                inserted.Location,  
                inserted.Lot,  
                inserted.Logistics_Unit,  
                inserted.Loc_Inv_Attributes_ID,  
  
                inserted.On_Hand_Qty,  
                inserted.Suspense_Qty,  
                inserted.Expiration_Date,  
                inserted.Inventory_Sts,  
  
                deleted.Allocated_Qty,           -- [comment omitted]
                inserted.Allocated_Qty,          -- [comment omitted]
  
                deleted.In_Transit_Qty,          -- [comment omitted]
                inserted.In_Transit_Qty,         -- [comment omitted]
  
                inserted.Internal_Location_Inv  
            INTO @InvSnap  
            (  
                Direction,  
                Warehouse, Company, Item, Location, Lot, Logistics_Unit, Loc_Inv_Attributes_ID,  
                On_Hand_Qty, Suspense_Qty, Expiration_Date, Inventory_Sts,  
                Before_Alloc_Qty, After_Alloc_Qty,  
                Before_In_Transit_Qty, After_In_Transit_Qty,  
                Internal_Location_Inv  
            )  
            WHERE Location_Inventory.Internal_Location_Inv IN  
            (  
                SELECT DISTINCT LI2.Internal_Location_Inv  
                FROM Location_Inventory LI2, Shipment_Alloc_Request AR  
                WHERE  
                    (  
                        (@waveNum <> 0 AND AR.LAUNCH_NUM = @waveNum)  
                        OR (@internalShipmentNum <> 0 AND AR.INTERNAL_SHIPMENT_NUM = @internalShipmentNum)  
                    )  
                    AND AR.Inventory_Tracking = @invTrack  
                    AND AR.From_Whs = LI2.Warehouse  
                    AND AR.From_Loc = LI2.Location  
                    AND AR.Item = LI2.Item  
                    AND ((AR.Lot IS NULL AND LI2.Lot IS NULL) OR (AR.Lot = LI2.Lot))  
                    AND ((AR.From_Loc_Inv_Attributes_ID IS NULL AND LI2.Loc_Inv_Attributes_ID IS NULL)  
                         OR (AR.From_Loc_Inv_Attributes_ID = LI2.Loc_Inv_Attributes_ID))  
                    AND ((AR.Company IS NULL AND LI2.Company IS NULL) OR (AR.Company = LI2.Company))  
                    AND ((AR.Logistics_Unit IS NULL AND LI2.Logistics_Unit IS NULL)  
                         OR (LI2.Logistics_Unit = AR.Logistics_Unit))  
            );  
  
            -- [comment omitted]
            -- [comment omitted]
            -- [comment omitted]
            IF @outputMode = 1  
            BEGIN  
                ;WITH AR_RET AS  
                (  
                    SELECT  
                        AR.From_Whs  AS Warehouse,  
                        AR.From_Loc  AS Location,  
                        AR.Item,  
                        AR.Lot,  
                        AR.Company,  
                        AR.Logistics_Unit,  
                        AR.From_Loc_Inv_Attributes_ID AS LOC_INV_ATTRIBUTES_ID,  
                        AR.Quantity_Um,  
                        AR.Shipment_Id,  
                        SUM(AR.Allocated_Qty) AS Allocated_Qty_Sum  
                    FROM Shipment_Alloc_Request AR  
                    WHERE  
                        (  
                            (@waveNum <> 0 AND AR.LAUNCH_NUM = @waveNum)  
                            OR (@internalShipmentNum <> 0 AND AR.INTERNAL_SHIPMENT_NUM = @internalShipmentNum)  
                        )  
                        AND AR.Inventory_Tracking = @invTrack  
                    GROUP BY  
                        AR.From_Whs, AR.From_Loc, AR.Item, AR.Lot, AR.Company,  
                        AR.Logistics_Unit, AR.From_Loc_Inv_Attributes_ID,  
                        AR.Quantity_Um, AR.Shipment_Id  
                )  
                SELECT  
                    S.Warehouse,  
                  S.Company,  
                    S.Item,  
                    S.Location,  
                    S.Lot,  
  
                    A.Quantity_Um,  
                    A.Shipment_Id,  
                    A.Allocated_Qty_Sum,  
  
                    S.On_Hand_Qty,  
                    S.Before_Alloc_Qty      AS Allocated_Qty,  
                    S.Before_In_Transit_Qty AS In_Transit_Qty,  
                    S.Suspense_Qty,  
                    S.Expiration_Date,  
                    S.Inventory_Sts,  
  
                    S.Before_Alloc_Qty      AS BEFORE_ALLOCATED_QTY,  
                    S.Before_In_Transit_Qty AS BEFORE_IN_TRANSIT_QTY,  
  
                    S.Logistics_Unit,  
                    S.Loc_Inv_Attributes_ID  
                FROM @InvSnap S  
                JOIN AR_RET A  
                  ON S.Warehouse = A.Warehouse  
                 AND S.Location  = A.Location  
                 AND S.Item      = A.Item  
                 AND (S.Lot = A.Lot OR (S.Lot IS NULL AND A.Lot IS NULL))  
                 AND (S.Company = A.Company OR (S.Company IS NULL AND A.Company IS NULL))  
                 AND ((S.Logistics_Unit IS NULL AND A.Logistics_Unit IS NULL) OR S.Logistics_Unit = A.Logistics_Unit)  
                 AND (S.Loc_Inv_Attributes_ID = A.LOC_INV_ATTRIBUTES_ID OR (S.Loc_Inv_Attributes_ID IS NULL AND A.LOC_INV_ATTRIBUTES_ID IS NULL))  
                ORDER BY  
                    S.Warehouse, S.Location, S.Item, S.Lot, S.Company, S.Logistics_Unit, S.Loc_Inv_Attributes_ID, A.Shipment_Id;  
  
    RETURN;  
            END  
  
            -- [comment omitted]
            -- [comment omitted]
            -- [comment omitted]
            ;WITH AR_GRP AS  
            (  
                SELECT  
                    AR.SHIPMENT_ID,  
                    AR.QUANTITY_UM,  
                    AR.From_Whs  AS Warehouse,  
                    AR.From_Loc  AS Location,  
                    AR.Item,  
                    AR.Lot,  
                    AR.Company,  
                    AR.Logistics_Unit,  
                    AR.From_Loc_Inv_Attributes_ID AS Loc_Inv_Attributes_ID,  
                    SUM(AR.Allocated_Qty) AS AllocQty  
                FROM Shipment_Alloc_Request AR  
                WHERE  
                    (  
                        (@waveNum <> 0 AND AR.LAUNCH_NUM = @waveNum)  
                        OR (@internalShipmentNum <> 0 AND AR.INTERNAL_SHIPMENT_NUM = @internalShipmentNum)  
                    )  
                    AND AR.Inventory_Tracking = @invTrack  
                GROUP BY  
                    AR.SHIPMENT_ID, AR.QUANTITY_UM,  
                    AR.From_Whs, AR.From_Loc, AR.Item, AR.Lot, AR.Company,  
                    AR.Logistics_Unit, AR.From_Loc_Inv_Attributes_ID  
            ),  
            HIST AS  
            (  
                SELECT  
                    A.*,  
                    S.On_Hand_Qty, S.Suspense_Qty, S.Expiration_Date, S.Inventory_Sts,  
                    S.Before_Alloc_Qty AS Total_Before,  
                    S.Before_In_Transit_Qty,  
                    S.After_In_Transit_Qty,  
                    SUM(A.AllocQty) OVER  
                    (  
                        PARTITION BY A.Warehouse, A.Location, A.Item, A.Lot, A.Company, A.Logistics_Unit, A.Loc_Inv_Attributes_ID  
                        ORDER BY A.SHIPMENT_ID  
                        ROWS UNBOUNDED PRECEDING  
                    ) AS RunningDeduct  
                FROM AR_GRP A  
                JOIN @InvSnap S  
                  ON S.Direction = N'<literal:3>'  
                 AND S.Warehouse = A.Warehouse  
                 AND S.Location  = A.Location  
                 AND S.Item      = A.Item  
                 AND (S.Lot = A.Lot OR (S.Lot IS NULL AND A.Lot IS NULL))  
                 AND (S.Company = A.Company OR (S.Company IS NULL AND A.Company IS NULL))  
                 AND ((S.Logistics_Unit IS NULL AND A.Logistics_Unit IS NULL) OR S.Logistics_Unit = A.Logistics_Unit)  
                 AND (S.Loc_Inv_Attributes_ID = A.Loc_Inv_Attributes_ID OR (S.Loc_Inv_Attributes_ID IS NULL AND A.Loc_Inv_Attributes_ID IS NULL))  
     )  
            INSERT INTO TRANSACTION_HISTORY  
            (  
                User_Name, Transaction_Type, Direction, Process_Stamp,  
                Warehouse, Location, Item, Lot, Company,  
                Quantity, Quantity_Um,  
                Reference_Id, Reference_Line_Num,  
                Before_On_Hand_Qty, Before_Alloc_Qty, Before_In_Transit_Qty, Before_Suspense_Qty,  
                BEFORE_EXPIRATION_DATE, BEFORE_STS,  
                After_On_Hand_Qty, After_Alloc_Qty, After_In_Transit_Qty, After_Suspense_Qty,  
                AFTER_EXPIRATION_DATE, AFTER_STS,  
                User_Stamp, Date_Time_Stamp, Activity_Date_Time,  
                Container_Id, Internal_Key_Id  
            )  
            SELECT  
                @userName, 200, N'<literal:4>', @processStamp,  
                Warehouse, Location, Item, Lot, Company,  
                AllocQty, Quantity_Um,  
                Shipment_Id, 0,  
                On_Hand_Qty,  
                (Total_Before - RunningDeduct + AllocQty),  
                Before_In_Transit_Qty,  
                Suspense_Qty,  
                Expiration_Date, Inventory_Sts,  
                On_Hand_Qty,  
                (Total_Before - RunningDeduct),  
                After_In_Transit_Qty,  
                Suspense_Qty,  
                CASE WHEN ((On_Hand_Qty + (Total_Before - RunningDeduct) + After_In_Transit_Qty + Suspense_Qty) > 0) THEN Expiration_Date ELSE NULL END,  
                CASE WHEN ((On_Hand_Qty + (Total_Before - RunningDeduct) + After_In_Transit_Qty + Suspense_Qty) > 0) THEN Inventory_Sts ELSE NULL END,  
                @userName, @utcNow, @utcNow,  
                Logistics_Unit, NULL  
            FROM HIST;  
        END  
  -- [comment omitted]
        -- [comment omitted]
        -- [comment omitted]
        IF @direction = N'<literal:5>'  
        BEGIN  
            UPDATE Location_Inventory  
            SET  
                Location_Inventory.User_Stamp = @userName,  
                Location_Inventory.Process_Stamp = @processStamp,  
                Location_Inventory.In_Transit_Qty =  
                    ISNULL(  
                        (  
                            SELECT Location_Inventory.In_Transit_Qty - SUM(AR.Allocated_Qty)  
                            FROM Shipment_Alloc_Request AR  
                            WHERE  
                                (  
                                    (@waveNum <> 0 AND AR.LAUNCH_NUM = @waveNum)  
                                    OR (@internalShipmentNum <> 0 AND AR.INTERNAL_SHIPMENT_NUM = @internalShipmentNum)  
                                )  
                                AND AR.Inventory_Tracking = @invTrack  
                                AND AR.To_Whs = Location_Inventory.Warehouse  
                                AND AR.To_Loc = Location_Inventory.Location  
                                AND AR.Item = Location_Inventory.Item  
                                AND ((AR.Lot IS NULL AND Location_Inventory.Lot IS NULL) OR (AR.Lot = Location_Inventory.Lot))  
                                AND ((AR.Company IS NULL AND Location_Inventory.Company IS NULL) OR (AR.Company = Location_Inventory.Company))  
                            GROUP BY  
                                AR.To_Whs, AR.To_Loc, AR.Item, AR.Lot, AR.Company  
                        ),  
                        Location_Inventory.In_Transit_Qty  
                    )  
            OUTPUT  
                N'<literal:6>',  
                inserted.Warehouse,  
                inserted.Company,  
                inserted.Item,  
                inserted.Location,  
                inserted.Lot,  
                inserted.Logistics_Unit,  
                inserted.Loc_Inv_Attributes_ID,  
  
                inserted.On_Hand_Qty,  
                inserted.Suspense_Qty,  
                inserted.Expiration_Date,  
                inserted.Inventory_Sts,  
  
                deleted.Allocated_Qty,  
                inserted.Allocated_Qty,         -- [comment omitted]
  
                deleted.In_Transit_Qty,  
                inserted.In_Transit_Qty,  
  
                inserted.Internal_Location_Inv  
            INTO @InvSnap  
            (  
                Direction,  
                Warehouse, Company, Item, Location, Lot, Logistics_Unit, Loc_Inv_Attributes_ID,  
                On_Hand_Qty, Suspense_Qty, Expiration_Date, Inventory_Sts,  
                Before_Alloc_Qty, After_Alloc_Qty,  
                Before_In_Transit_Qty, After_In_Transit_Qty,  
                Internal_Location_Inv  
            )  
            WHERE Location_Inventory.Internal_Location_Inv IN  
            (  
                SELECT DISTINCT LI2.Internal_Location_Inv  
                FROM Location_Inventory LI2, Shipment_Alloc_Request AR  
                WHERE  
                    (  
                        (@waveNum <> 0 AND AR.LAUNCH_NUM = @waveNum)  
                        OR (@internalShipmentNum <> 0 AND AR.INTERNAL_SHIPMENT_NUM = @internalShipmentNum)  
                    )  
                    AND AR.Inventory_Tracking = @invTrack  
                    AND AR.To_Whs = LI2.Warehouse  
                    AND AR.To_Loc = LI2.Location  
                    AND AR.Item = LI2.Item  
                    AND ((AR.Lot IS NULL AND LI2.Lot IS NULL) OR (AR.Lot = LI2.Lot))  
                    AND ((AR.Company IS NULL AND LI2.Company IS NULL) OR (AR.Company = LI2.Company))  
            );  
  
            IF @outputMode = 1  
            BEGIN  
                ;WITH AR_RET AS  
                (  
                    SELECT  
                        AR.To_Whs  AS Warehouse,  
                        AR.To_Loc  AS Location,  
                        AR.Item,  
                        AR.Lot,  
                        AR.Company,  
                        AR.Quantity_Um,  
                        AR.Shipment_Id,  
                        SUM(AR.Allocated_Qty) AS Allocated_Qty_Sum  
                    FROM Shipment_Alloc_Request AR  
                    WHERE  
                        (  
                            (@waveNum <> 0 AND AR.LAUNCH_NUM = @waveNum)  
                            OR (@internalShipmentNum <> 0 AND AR.INTERNAL_SHIPMENT_NUM = @internalShipmentNum)  
                        )  
                        AND AR.Inventory_Tracking = @invTrack  
                    GROUP BY  
                        AR.To_Whs, AR.To_Loc, AR.Item, AR.Lot, AR.Company,  
                        AR.Quantity_Um, AR.Shipment_Id  
                )  
                SELECT  
                    S.Warehouse,  
                    S.Company,  
                    S.Item,  
                    S.Location,  
                    S.Lot,  
  
                    A.Quantity_Um,  
                    A.Shipment_Id,  
                    A.Allocated_Qty_Sum,  
  
                    S.On_Hand_Qty,  
                    S.Before_Alloc_Qty      AS Allocated_Qty,  
                    S.Before_In_Transit_Qty AS In_Transit_Qty,  
                    S.Suspense_Qty,  
                    S.Expiration_Date,  
                    S.Inventory_Sts,  
  
                    S.Before_Alloc_Qty      AS BEFORE_ALLOCATED_QTY,  
                    S.Before_In_Transit_Qty AS BEFORE_IN_TRANSIT_QTY,  
  
                    S.Logistics_Unit,  
                    S.Loc_Inv_Attributes_ID  
                FROM @InvSnap S  
                JOIN AR_RET A  
                  ON S.Warehouse = A.Warehouse  
                 AND S.Location  = A.Location  
                 AND S.Item      = A.Item  
                 AND (S.Lot = A.Lot OR (S.Lot IS NULL AND A.Lot IS NULL))  
                 AND (S.Company = A.Company OR (S.Company IS NULL AND A.Company IS NULL))  
              ORDER BY  
                    S.Warehouse, S.Location, S.Item, S.Lot, S.Company, A.Shipment_Id;  
  
       RETURN;  
            END  
  
            ;WITH AR_GRP AS  
            (  
                SELECT  
                    AR.SHIPMENT_ID,  
                    AR.QUANTITY_UM,  
                    AR.To_Whs  AS Warehouse,  
                    AR.To_Loc  AS Location,  
                    AR.Item,  
                    AR.Lot,  
                    AR.Company,  
                    SUM(AR.Allocated_Qty) AS AllocQty  
                FROM Shipment_Alloc_Request AR  
                WHERE  
                    (  
                        (@waveNum <> 0 AND AR.LAUNCH_NUM = @waveNum)  
                        OR (@internalShipmentNum <> 0 AND AR.INTERNAL_SHIPMENT_NUM = @internalShipmentNum)  
                    )  
                    AND AR.Inventory_Tracking = @invTrack  
                GROUP BY  
                    AR.SHIPMENT_ID, AR.QUANTITY_UM,  
                    AR.To_Whs, AR.To_Loc, AR.Item, AR.Lot, AR.Company  
            ),  
            HIST AS  
            (  
                SELECT  
                    A.*,  
                    S.On_Hand_Qty,  
                    S.Suspense_Qty,  
                    S.Expiration_Date,  
                    S.Inventory_Sts,  
                    S.Before_In_Transit_Qty AS Total_Before_Transit,  
                    S.Before_Alloc_Qty,  
                    S.After_Alloc_Qty,  
                    SUM(A.AllocQty) OVER  
                    (  
                        PARTITION BY A.Warehouse, A.Location, A.Item, A.Lot, A.Company  
                        ORDER BY A.SHIPMENT_ID  
                        ROWS UNBOUNDED PRECEDING  
                    ) AS RunningDeduct  
                FROM AR_GRP A  
                JOIN @InvSnap S  
                  ON S.Direction = N'<literal:7>'  
                 AND S.Warehouse = A.Warehouse  
                 AND S.Location  = A.Location  
                 AND S.Item      = A.Item  
                 AND (S.Lot = A.Lot OR (S.Lot IS NULL AND A.Lot IS NULL))  
                 AND (S.Company = A.Company OR (S.Company IS NULL AND A.Company IS NULL))  
            )  
            INSERT INTO TRANSACTION_HISTORY  
            (  
                User_Name, Transaction_Type, Direction, Process_Stamp,  
                Warehouse, Location, Item, Lot, Company,  
                Quantity, Quantity_Um,  
                Reference_Id, Reference_Line_Num,  
                Before_On_Hand_Qty, Before_Alloc_Qty, Before_In_Transit_Qty, Before_Suspense_Qty,  
                BEFORE_EXPIRATION_DATE, BEFORE_STS,  
                After_On_Hand_Qty, After_Alloc_Qty, After_In_Transit_Qty, After_Suspense_Qty,  
                AFTER_EXPIRATION_DATE, AFTER_STS,  
                User_Stamp, Date_Time_Stamp, Activity_Date_Time,  
                Container_Id, Internal_Key_Id  
            )  
            SELECT  
                @userName, 200, N'<literal:8>', @processStamp,  
                Warehouse, Location, Item, Lot, Company,  
                AllocQty, Quantity_Um,  
                Shipment_Id, 0,  
                On_Hand_Qty,  
                Before_Alloc_Qty,  
                (Total_Before_Transit - RunningDeduct + AllocQty),  
                Suspense_Qty,  
                Expiration_Date, Inventory_Sts,  
                On_Hand_Qty,  
                After_Alloc_Qty,  
                (Total_Before_Transit - RunningDeduct),  
                Suspense_Qty,  
                CASE WHEN ((On_Hand_Qty + (Total_Before_Transit - RunningDeduct) + Suspense_Qty) > 0) THEN Expiration_Date ELSE NULL END,  
                CASE WHEN ((On_Hand_Qty + (Total_Before_Transit - RunningDeduct) + Suspense_Qty) > 0) THEN Inventory_Sts ELSE NULL END,  
                @userName, @utcNow, @utcNow, NULL, NULL  
            FROM HIST;  
        END  
  
  
    END TRY  
    BEGIN CATCH  
          
        THROW;  
    END CATCH  
END  