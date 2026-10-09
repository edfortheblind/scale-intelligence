/*
 Mod Number 	| Programer	| Date	    | Modification Description
 ---------------|-----------|-----------|-------------------------
 194971			| RS        | 12/25/16  | Created.
*/

CREATE PROCEDURE SHP_MOPInsightDetailPaneData(@id NVARCHAR(19)) 
AS 
SET NOCOUNT ON;
BEGIN

SELECT top 1 N'SCALAR' AS SCALAR,
				MULTI_ORDER_PALLET_ID							    as MultiOrderPalletId,	
				CONTAINER_ID										as ContainerId,
				STATUS_NAME					 						as MULTIORDERPALLETVIEWSTATUSNAME	
FROM MULTI_ORDER_PALLET_VIEW
WHERE ID = @id;


END