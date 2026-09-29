-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE SHP_MOPInsightDetailPaneData(@id NVARCHAR(19)) 
AS 
SET NOCOUNT ON;
BEGIN

SELECT top 1 N'<literal:1>' AS SCALAR,
				MULTI_ORDER_PALLET_ID							    as MultiOrderPalletId,	
				CONTAINER_ID										as ContainerId,
				STATUS_NAME					 						as MULTIORDERPALLETVIEWSTATUSNAME	
FROM MULTI_ORDER_PALLET_VIEW
WHERE ID = @id;


END