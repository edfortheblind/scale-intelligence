-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */


































-- [comment omitted]


CREATE PROCEDURE SHP_InsightDetailPaneData(@internalShipmentNum numeric(9) , @culture nvarchar(10))  
AS 
BEGIN

declare @dockDoorInternalNum numeric(9,0);

SELECT top 1 N'<literal:1>' AS SCALAR,
    sh.SHIPMENT_ID AS ShipmentID,
	sh.INTERNAL_SHIPMENT_NUM AS InternalShipmentNum,
    sh.ORDER_TYPE AS OrderType ,
    sh.CUSTOMER_name AS Customer,
    sh.ship_to_name AS ShipTo,
    sh.CARRIER AS Carrier ,
    sh.CARRIER_SERVICE AS CarrierService,
    dbo.STSfn_RtrvStsName(N'<literal:2>' ,sh.TRAILING_STS) AS TrailingSts ,
    dbo.STSfn_RtrvStsName (N'<literal:3>' ,sh.LEADING_STS) AS LeadingSts ,
	TOTAL_LINES as SummaryDetails,
	WAREHOUSE as Warehouse,
	sh.IN_DELETION as InDeletion,
	sh.SHIPPING_LOAD_NUM as ShippingLoadNum,
	sh.ERP_ORDER as ErpOrder
FROM SHIPMENT_HEADER_VIEW sh
WHERE INTERNAL_SHIPMENT_NUM = @internalShipmentNum;

SELECT N'<literal:4>' AS SCALAR, count(INTERNAL_CONTAINER_NUM) AS ParentContainers from SHIPPING_CONTAINER sc 
where TREE_UNIT=INTERNAL_CONTAINER_NUM AND INTERNAL_SHIPMENT_NUM=@internalShipmentNum; 

SELECT @dockDoorInternalNum=sl.DOCK_DOOR
FROM SHIPMENT_HEADER_VIEW sh
LEFT OUTER JOIN Shipping_load sl ON sh.SHIPPING_LOAD_NUM = sl.INTERNAL_LOAD_NUM;

SELECT top 1 N'<literal:5>' AS SCALAR, 
	LOCATION AS DockDoor, 
	LOCATION AS LoadDockDoor 
FROM LOCATION
WHERE OBJECT_ID=@dockDoorInternalNum;


SELECT top 1 N'<literal:6>' AS SCALAR, 
	case when (select count(distinct USER_DEF1) from SHIPMENT_DETAIL where INTERNAL_SHIPMENT_NUM = @internalShipmentNum) > 1 then null else min(USER_DEF1) END AS UserDef1,
	case when (select count(distinct USER_DEF2) from SHIPMENT_DETAIL where INTERNAL_SHIPMENT_NUM = @internalShipmentNum) > 1 then null else min(USER_DEF2) END AS UserDef2, 
	case when (select count(distinct USER_DEF3) from SHIPMENT_DETAIL where INTERNAL_SHIPMENT_NUM = @internalShipmentNum) > 1 then null else min(USER_DEF3) END AS UserDef3, 
	case when (select count(distinct USER_DEF4) from SHIPMENT_DETAIL where INTERNAL_SHIPMENT_NUM = @internalShipmentNum) > 1 then null else min(USER_DEF4) END AS UserDef4, 
	case when (select count(distinct USER_DEF5) from SHIPMENT_DETAIL where INTERNAL_SHIPMENT_NUM = @internalShipmentNum) > 1 then null else min(USER_DEF5) END AS UserDef5, 
	case when (select count(distinct USER_DEF6) from SHIPMENT_DETAIL where INTERNAL_SHIPMENT_NUM = @internalShipmentNum) > 1 then null else min(USER_DEF6) END AS UserDef6 ,
	case when (select count(distinct INVOICE)   from SHIPMENT_DETAIL where INTERNAL_SHIPMENT_NUM = @internalShipmentNum) > 1 then null else min(INVOICE) END AS Invoice, 
	case when (select count(distinct PICK_LIST_ID) from SHIPMENT_DETAIL where INTERNAL_SHIPMENT_NUM = @internalShipmentNum) > 1 then null else min(PICK_LIST_ID) END AS PickListId 
FROM SHIPMENT_DETAIL
WHERE INTERNAL_SHIPMENT_NUM=@internalShipmentNum;

END