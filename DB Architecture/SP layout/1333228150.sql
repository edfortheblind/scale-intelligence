/*
	Mod Number	| Programmer	| Date   	| Modification Description
	-------------------------------------------------------------------- 
	197708		| SO			| 05/02/17	| created	
*/

CREATE PROCEDURE MetaTrans_WorkOrderComponentAllocation
(
@internalWrkOrdLineNum numeric(9),  
@culture nvarchar(10)
)
AS
       SET NOCOUNT ON;

	   SELECT 
	   N'SCALAR' AS N'EntityType',
       N'WorkOrderDetailView' AS N'EntityName', 
	   WORK_ORDER_DETAIL.ALLOCATED AS N'Allocated', 
	   WORK_ORDER_DETAIL.ALLOCATION_RULE AS N'AllocationRule',
	   WORK_ORDER_DETAIL.FROM_LOCATION AS N'FromLocation',
	   WORK_ORDER_DETAIL.ITEM AS N'Item',
	   WORK_ORDER_DETAIL.TOTAL_CONVERTED_QTY_NEEDED AS N'TotalConvertedQtyNeeded',
	   WORK_ORDER_DETAIL.WAREHOUSE AS N'Warehouse',
	   WORK_ORDER_DETAIL.COMPANY AS N'Company',
	   WORK_ORDER_DETAIL.CONVERTED_UM AS N'ConvertedUm',
	   WORK_ORDER_DETAIL.BUILD_LEVEL AS N'BuildLevel',
	   WORK_ORDER_DETAIL.BUILD_SEQUENCE AS N'BuildSequence',
	   WORK_ORDER_DETAIL.ITEM_DESC AS N'ItemDesc',
	   WORK_ORDER_DETAIL.INTERNAL_WORK_ORDER_NUM AS N'InternalWorkOrderNum',
	   WORK_ORDER_DETAIL.INTERNAL_WRK_ORD_LINE_NUM AS N'InternalWrkOrdLineNum'
	   from WORK_ORDER_DETAIL where WORK_ORDER_DETAIL.INTERNAL_WRK_ORD_LINE_NUM = @internalWrkOrdLineNum

	   
	   