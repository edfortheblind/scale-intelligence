-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */




CREATE PROCEDURE PGPT_InsightDetailPaneData(@internalGroupNum numeric(9), 
@culture nvarchar(10))  
AS 
BEGIN

select  N'<literal:1>' AS SCALAR,
	COUNT(distinct(INTERNAL_REC_CONT_NUM)) AS TotalContainers,		
	min(GROUP_ID) AS PutawayGroupId,	
	min(PUTAWAY_GROUP_LOCATION) AS PutawayGroupLocation,
	min(WAREHOUSE) AS Warehouse,
	INTERNAL_GROUP_NUM AS InternalGroupNum	
FROM METADATA_INSIGHT_PUTAWAYGROUP_VIEW WITH(NOLOCK)
WHERE INTERNAL_GROUP_NUM = @internalGroupNum
GROUP BY INTERNAL_GROUP_NUM;

END






