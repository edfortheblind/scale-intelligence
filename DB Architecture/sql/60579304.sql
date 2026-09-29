-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

CREATE VIEW [dbo].[TRAV_MULTI_ORDER_PALLET_VIEW]
AS
SELECT     ISNULL(MOP.MULTI_ORDER_PALLET_ID, '<literal:1>') AS MULTI_ORDER_PALLET_ID, mop.user_def7 AS MOP_WT, SC.CONTAINER_ID, SC.CONTAINER_TYPE, 
                      SC.CONTAINER_COUNT_TOTAL, SC.CONTAINER_COUNT_NUMBER,
                          (SELECT     TOP (1) LOCATION
                            FROM          dbo.SHIPPING_CONTAINER
                            WHERE      (PARENT = SC.INTERNAL_CONTAINER_NUM) OR
                                                   (PARENT IS NULL) AND (INTERNAL_CONTAINER_NUM = SC.INTERNAL_CONTAINER_NUM) AND (LOCATION IS NOT NULL)) AS LOCATION,
                          (SELECT     TOP (1) WORK_ZONE
                            FROM          dbo.SHIPPING_CONTAINER AS SHIPPING_CONTAINER_1
                            WHERE      (PARENT = SC.INTERNAL_CONTAINER_NUM) OR
                                                   (PARENT IS NULL) AND (INTERNAL_CONTAINER_NUM = SC.INTERNAL_CONTAINER_NUM) AND (WORK_ZONE IS NOT NULL)) 
                      AS WORK_ZONE,
                          (SELECT     TOP (1) STATUS_NAME
                            FROM          dbo.FUNCTIONAL_AREA_STATUS_FLOW AS FLOW
                            WHERE      (status = SC.status) AND (FUNCTIONAL_AREA = N'<literal:2>')) AS STATUS_NAME, SC.VOLUME, SC.WEIGHT, SC.VALUE, SC.NMFC_CODE, 
                      SC.HAZARDOUS_CODE, SH.SHIPMENT_ID, SH.INTERNAL_SHIPMENT_NUM, SH.SHIPPING_LOAD_NUM, SH.CARRIER, SH.CARRIER_SERVICE, 
                      SH.CUSTOMER_NAME AS CUSTOMER, SH.SHIP_TO, MOP.WAREHOUSE, SC.INTERNAL_CONTAINER_NUM, 
                      CAST(SC.INTERNAL_CONTAINER_NUM AS nvarchar(9)) + N'<literal:3>' + CAST(SH.INTERNAL_SHIPMENT_NUM AS nvarchar(9)) AS ID, SH.LAUNCH_NUM, 
                      (CASE WHEN SC.ITEM IS NULL THEN
                          (SELECT     (CASE WHEN MIN(ISNULL(ITEM, '<literal:4>')) <> MAX(ISNULL(ITEM, '<literal:5>')) THEN '<literal:6>' ELSE MIN(ISNULL(ITEM, '<literal:7>')) END)
                            FROM          SHIPPING_CONTAINER CHILD WITH (NOLOCK)
                            WHERE      CHILD.TREE_UNIT = SC.INTERNAL_CONTAINER_NUM) ELSE SC.ITEM END) AS ITEM
FROM         dbo.SHIPPING_CONTAINER AS SC INNER JOIN
                      dbo.SHIPMENT_HEADER AS SH ON SC.INTERNAL_SHIPMENT_NUM = SH.INTERNAL_SHIPMENT_NUM LEFT OUTER JOIN
                      dbo.MULTI_ORDER_PALLET AS MOP ON SC.INTERNAL_MOP_NUMBER = MOP.INTERNAL_MOP_NUMBER
WHERE     (SC.PARENT IS NULL) AND (SC.status < 900)