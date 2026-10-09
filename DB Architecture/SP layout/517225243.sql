/*
	Mod Number	| Programmer	| Date   	| Modification Description
	-------------------------------------------------------------------- 
	190776		| DN			| 12/15/16	| Created.
	185235		| DN			| 02/09/17	| Added SerialNumTracking 
*/

CREATE PROCEDURE METATRANS_GetBillOfMaterialDetails
@INTERNAL_BOM_HEADER_NUM int,
@location nvarchar(25),
@warehouse nvarchar(25)

AS
	SET NOCOUNT ON;	
	
Declare @invSts nvarchar(20);
	
SELECT @invSts = SYSTEM_VALUE FROM SYSTEM_CONFIG_DETAIL WHERE RECORD_TYPE=N'INVENTORY' AND SYS_KEY=N'40';
					
SELECT distinct bomd.ITEM, 
bomd.ITEM_DESC, 
bomd.QTY_NEEDED_PER_ITEM, 
bomd.QUANTITY_UM,
bomd.INTERNAL_BOM_DETAIL_NUM, 
bomd.INTERNAL_BOM_HEADER_NUM,
item.LOT_CONTROLLED, 
case when isnull(item.SERIAL_NUM_TRACKING,0) = 7 then N'Y' else N'N' end as SerialNumInventoryTracking,
bomd.COMPANY,
isnull((SELECT TOP 1 1 FROM LOCATION_INVENTORY WHERE ITEM=item.ITEM AND LOCATION = @location AND WAREHOUSE = @warehouse), 0) AS N'ComponentExistsAtLocation',
@invSts AS INVENTORY_STS,
ISNULL(item.LOCATING_RULE, N'*Default') AS LOCATING_RULE
FROM BILL_OF_MATERIALS_DETAIL bomd 
LEFT OUTER JOIN ITEM item ON bomd.ITEM =item.ITEM 
AND ISNULL(bomd.COMPANY,N'!')=ISNULL(item.COMPANY,ISNULL(bomd.COMPANY, N'!'))
LEFT OUTER JOIN LOCATION_INVENTORY LI ON LI.ITEM=bomd.ITEM
AND ISNULL(bomd.COMPANY,N'!')=ISNULL(LI.COMPANY, N'!')
AND LI.LOCATION=@location AND WAREHOUSE=@warehouse
WHERE bomd.INTERNAL_BOM_HEADER_NUM=@INTERNAL_BOM_HEADER_NUM;


