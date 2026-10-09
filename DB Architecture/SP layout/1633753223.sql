/*

	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	138224	| MDL	| 03/17/14	| Created
	139211  | MDL   | 03/25/14  | Added item detail information.
	138857  | MDL   | 03/30/14  | Added user defined information and differentiate between template & table data.
	139217  | MDL   | 04/02/14  | Added shipping container information.
	137855  | MDL   | 04/08/14  | Added shipping load information.
	141152  | RJR   | 04/24/14  | Added shipment status information.
	140260  | AA    | 04/24/14	| Added InternalShipmentNum and INTERNALCONTAINERNUM column.
	141903  | SP    | 05/09/14  | Changed User Defined data to be returned as Table type instead of Template
	140395	| MMM	| 05/08/14	| Added Reference Info section
	141896  | SAM   | 05/14/14	| Removed conversion of date columns to varchar
	147059	| NRJ	| 10/17/14	| Modified the Hierarchical_DetailPaneDetailsContainers for some more information.
	148220	| NRJ	| 01/02/15	| Modified the Table_DetailPaneDetailsReferenceInfo(added warehouse,wave number information). 
	151980	| NRJ	| 05/01/15	| Renamed the aliasing name from LAUNCHNUM to WAVENUM.
	153741	| DN	| 02/25/15	| Added new table Table_DetailPaneDetailsUserDefAdd
	157206	| MDL	| 03/02/15	| Added ADDITIONALINFO_TABLENAME table.
	146371	| NRJ	| 10/17/14	| Modified the Hierarchical_DetailPaneDetailsContainers for some more information.
	146371	| NRJ	| 10/17/14	| Modified the Hierarchical_DetailPaneDetailsContainers such that it returns parent information aswell.
	163749	| MJ	| 07/31/15	| Added Warehouse to SCALAR
	162015	| BNB	| 22/09/15	| Rearranged Template_DetailPaneCustomerAddress and Template_DetailPaneShipToAddress
	162546	| MHM	| 22/09/15	| Added QC_Status for Hierarchical_DetailPaneDetailsContainers
	168438	| MMM	| 01/12/15	| Added SHIPMENTINDELETION column to Hierarchical_DetailPaneDetailsContainers
	162559	| SP	| 06/15/16	| Added Status and INTERNAL_SHIPMENT_LINE_NUM as hidden columns to details info
	181946  | AH    | 07/08/16  | Added hyperlink in the DetailPaneDetailsLoadInfo for load number
	182679  | MHM   | 07/13/16  | Added VAS column to Hierarchical_DetailPaneDetailsContainers
	184188  | AH    | 08/02/16  | Modified the Hierarchical_DetailPaneDetailsContainers so only one row from SHIPPING_CONT_VAS_ACTIVITY is taken
	186835	| RJR	| 09/13/16	| Open screens in current tab.
	185482	| SSD	| 10/04/16	| Removed the information related to detailpane accordions and added the information required for detailpane indicator tiles.
	191074	| DN	| 01/23/17	| Updated parameter types
    215819  | AH    | 11/24/17  | Added fields from shipment detail required for packing.
*/

-- Get Data for ShipmentInsightDetailPane which internal convert into JSON and send to client


CREATE PROCEDURE SHP_InsightDetailPaneData(@internalShipmentNum numeric(9) , @culture nvarchar(10))  
AS 
BEGIN

declare @dockDoorInternalNum numeric(9,0);

SELECT top 1 N'SCALAR' AS SCALAR,
    sh.SHIPMENT_ID AS ShipmentID,
	sh.INTERNAL_SHIPMENT_NUM AS InternalShipmentNum,
    sh.ORDER_TYPE AS OrderType ,
    sh.CUSTOMER_name AS Customer,
    sh.ship_to_name AS ShipTo,
    sh.CARRIER AS Carrier ,
    sh.CARRIER_SERVICE AS CarrierService,
    dbo.STSfn_RtrvStsName(N'outbound' ,sh.TRAILING_STS) AS TrailingSts ,
    dbo.STSfn_RtrvStsName (N'outbound' ,sh.LEADING_STS) AS LeadingSts ,
	TOTAL_LINES as SummaryDetails,
	WAREHOUSE as Warehouse,
	sh.IN_DELETION as InDeletion,
	sh.SHIPPING_LOAD_NUM as ShippingLoadNum,
	sh.ERP_ORDER as ErpOrder
FROM SHIPMENT_HEADER_VIEW sh
WHERE INTERNAL_SHIPMENT_NUM = @internalShipmentNum;

SELECT N'SCALAR' AS SCALAR, count(INTERNAL_CONTAINER_NUM) AS ParentContainers from SHIPPING_CONTAINER sc 
where TREE_UNIT=INTERNAL_CONTAINER_NUM AND INTERNAL_SHIPMENT_NUM=@internalShipmentNum; 

SELECT @dockDoorInternalNum=sl.DOCK_DOOR
FROM SHIPMENT_HEADER_VIEW sh
LEFT OUTER JOIN Shipping_load sl ON sh.SHIPPING_LOAD_NUM = sl.INTERNAL_LOAD_NUM;

SELECT top 1 N'SCALAR' AS SCALAR, 
	LOCATION AS DockDoor, 
	LOCATION AS LoadDockDoor 
FROM LOCATION
WHERE OBJECT_ID=@dockDoorInternalNum;


SELECT top 1 N'SCALAR' AS SCALAR, 
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