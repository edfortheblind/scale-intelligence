-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE METATRANS_GetBillOfMaterialDetails
@INTERNAL_BOM_HEADER_NUM int,
@location nvarchar(25),
@warehouse nvarchar(25)

AS
	SET NOCOUNT ON;	
	
Declare @invSts nvarchar(20);
	
SELECT @invSts = SYSTEM_VALUE FROM SYSTEM_CONFIG_DETAIL WHERE RECORD_TYPE=N'<literal:1>' AND SYS_KEY=N'<literal:2>';
					
SELECT distinct bomd.ITEM, 
bomd.ITEM_DESC, 
bomd.QTY_NEEDED_PER_ITEM, 
bomd.QUANTITY_UM,
bomd.INTERNAL_BOM_DETAIL_NUM, 
bomd.INTERNAL_BOM_HEADER_NUM,
item.LOT_CONTROLLED, 
case when isnull(item.SERIAL_NUM_TRACKING,0) = 7 then N'<literal:3>' else N'<literal:4>' end as SerialNumInventoryTracking,
bomd.COMPANY,
isnull((SELECT TOP 1 1 FROM LOCATION_INVENTORY WHERE ITEM=item.ITEM AND LOCATION = @location AND WAREHOUSE = @warehouse), 0) AS N'<literal:5>',
@invSts AS INVENTORY_STS,
ISNULL(item.LOCATING_RULE, N'<literal:6>') AS LOCATING_RULE
FROM BILL_OF_MATERIALS_DETAIL bomd 
LEFT OUTER JOIN ITEM item ON bomd.ITEM =item.ITEM 
AND ISNULL(bomd.COMPANY,N'<literal:7>')=ISNULL(item.COMPANY,ISNULL(bomd.COMPANY, N'<literal:8>'))
LEFT OUTER JOIN LOCATION_INVENTORY LI ON LI.ITEM=bomd.ITEM
AND ISNULL(bomd.COMPANY,N'<literal:9>')=ISNULL(LI.COMPANY, N'<literal:10>')
AND LI.LOCATION=@location AND WAREHOUSE=@warehouse
WHERE bomd.INTERNAL_BOM_HEADER_NUM=@INTERNAL_BOM_HEADER_NUM;


