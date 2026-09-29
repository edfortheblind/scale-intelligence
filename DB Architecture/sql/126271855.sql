-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE TpmOrderStatus_InsightDetailPaneData 
(
@internalOrderNum numeric(9),
@culture nvarchar(10)
)  
AS 
BEGIN
SELECT TOP 1 N'<literal:1>' AS SCALAR,
      OH.INTERNAL_ORDER_NUM as InternalOrderNum,
	  OH.WAREHOUSE,
      OH.ERP_ORDER,
	  OH.CUSTOMER_NAME,
	  OH.CUSTOMER as CUSTOMER_ID,
	  OH.CONDITION,
	  od_totals.TOTAL_LINES as SummaryDetails	  
FROM 
ORDER_HEADER AS OH
LEFT OUTER JOIN  
    (SELECT  INTERNAL_ORDER_NUM,   
     COUNT(INTERNAL_ORDER_DTL_NUM) AS TOTAL_LINES    
    FROM ORDER_DETAIL WITH (NOLOCK)  
    GROUP BY INTERNAL_ORDER_NUM) od_totals   
  ON OH.INTERNAL_ORDER_NUM = od_totals.INTERNAL_ORDER_NUM  
where od_totals.INTERNAL_ORDER_NUM=@internalOrderNum;


SELECT N'<literal:2>' AS SCALAR, count(INTERNAL_CONTAINER_NUM) AS ParentContainers FROM SHIPPING_CONTAINER
WHERE TREE_UNIT=INTERNAL_CONTAINER_NUM AND INTERNAL_ORDER_NUM=@internalOrderNum;

END
