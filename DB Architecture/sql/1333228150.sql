-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE MetaTrans_WorkOrderComponentAllocation
(
@internalWrkOrdLineNum numeric(9),  
@culture nvarchar(10)
)
AS
       SET NOCOUNT ON;

	   SELECT 
	   N'<literal:1>' AS N'<literal:2>',
       N'<literal:3>' AS N'<literal:4>', 
	   WORK_ORDER_DETAIL.ALLOCATED AS N'<literal:5>', 
	   WORK_ORDER_DETAIL.ALLOCATION_RULE AS N'<literal:6>',
	   WORK_ORDER_DETAIL.FROM_LOCATION AS N'<literal:7>',
	   WORK_ORDER_DETAIL.ITEM AS N'<literal:8>',
	   WORK_ORDER_DETAIL.TOTAL_CONVERTED_QTY_NEEDED AS N'<literal:9>',
	   WORK_ORDER_DETAIL.WAREHOUSE AS N'<literal:10>',
	   WORK_ORDER_DETAIL.COMPANY AS N'<literal:11>',
	   WORK_ORDER_DETAIL.CONVERTED_UM AS N'<literal:12>',
	   WORK_ORDER_DETAIL.BUILD_LEVEL AS N'<literal:13>',
	   WORK_ORDER_DETAIL.BUILD_SEQUENCE AS N'<literal:14>',
	   WORK_ORDER_DETAIL.ITEM_DESC AS N'<literal:15>',
	   WORK_ORDER_DETAIL.INTERNAL_WORK_ORDER_NUM AS N'<literal:16>',
	   WORK_ORDER_DETAIL.INTERNAL_WRK_ORD_LINE_NUM AS N'<literal:17>'
	   from WORK_ORDER_DETAIL where WORK_ORDER_DETAIL.INTERNAL_WRK_ORD_LINE_NUM = @internalWrkOrdLineNum

	   
	   