-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */










CREATE PROCEDURE [dbo].[TRAV_EX01_GetPackSizeWaveContainerData]
(
	@LAUNCH_NUM NVARCHAR(25)
)
AS
BEGIN

	SET NOCOUNT ON
	
	SELECT 
    SCP.CONTAINER_ID CartonID, 
    SCC.ITEM ProductID, 
    CAST(SCC.QUANTITY AS NUMERIC(19,0)) Quantity, 
    N'<literal:1>' DesignID,
    DENSE_RANK() OVER (ORDER BY wi.ismulti, wi.MaxFromLoc DESC) AS sequence
FROM 
    SHIPPING_CONTAINER SCC WITH(NOLOCK)
JOIN 
    SHIPPING_CONTAINER SCP WITH(NOLOCK)
    -- [comment omitted]
	ON SCC.PARENT_CONTAINER_ID = SCP.CONTAINER_ID -- [comment omitted]
JOIN CONTAINER_TYPE CT WITH(NOLOCK) -- [comment omitted]
	ON SCP.CONTAINER_TYPE=CT.CONTAINER_TYPE -- [comment omitted]
JOIN 
    (
        SELECT 
            container_id, 
            MAX(from_loc) AS MaxFromLoc, 
            MIN(from_loc) AS MinFromLoc, 
            COUNT(*) AS pickCount, 
            CASE WHEN COUNT(*) = 1 THEN 0 ELSE 1 END AS isMulti 
        FROM 
            WORK_INSTRUCTION_VIEW
        WHERE 
            launch_num = @LAUNCH_NUM 
            AND INSTRUCTION_TYPE = '<literal:2>'
        GROUP BY 
            container_id
    ) wi ON SCP.CONTAINER_ID = wi.container_id
WHERE 
    SCP.LAUNCH_NUM = CONVERT(NUMERIC(9,0), @LAUNCH_NUM)
	and CT.USER_DEF1=N'<literal:3>' -- [comment omitted]
ORDER BY 
    sequence, wi.isMulti, wi.MaxFromLoc DESC


END
