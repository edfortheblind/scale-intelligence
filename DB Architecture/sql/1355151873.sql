-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */










CREATE PROC [dbo].[TRAV_EX06_GetPackSizeWaveContainerData]
(
	-- [comment omitted]
	@LAUNCH_NUM NUMERIC(9,0)

)
AS
BEGIN


	SET NOCOUNT ON
	/* [comment omitted] */








	


	/* [comment omitted] */























-- [comment omitted]
	/* [comment omitted] */

























	
-- [comment omitted]
	
SELECT 
    SCP.CONTAINER_ID CartonID, 
    SCC.ITEM ProductID, 
    SCC.QUANTITY AS Quantity,  
    N'<literal:1>' DesignID,
    DENSE_RANK() OVER (ORDER BY wi.isMulti, wi.MaxFromLoc DESC) AS sequence
FROM 
    SHIPPING_CONTAINER SCC WITH(NOLOCK)
JOIN 
    SHIPPING_CONTAINER SCP WITH(NOLOCK)
    ON SCC.PARENT_CONTAINER_ID = SCP.CONTAINER_ID
JOIN 
    CONTAINER_TYPE CT WITH(NOLOCK)
    ON SCP.CONTAINER_TYPE = CT.CONTAINER_TYPE
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
            TRY_CONVERT(NUMERIC(9,0), @LAUNCH_NUM) IS NOT NULL  -- [comment omitted]
            AND launch_num = TRY_CONVERT(NUMERIC(9,0), @LAUNCH_NUM)
            AND INSTRUCTION_TYPE = '<literal:2>'
        GROUP BY 
            container_id
    ) wi ON SCP.CONTAINER_ID = wi.container_id
WHERE 
    TRY_CONVERT(NUMERIC(9,0), @LAUNCH_NUM) IS NOT NULL  -- [comment omitted]
    AND SCP.LAUNCH_NUM = TRY_CONVERT(NUMERIC(9,0), @LAUNCH_NUM)
	AND CT.USER_DEF1 = N'<literal:3>'
ORDER BY 
    sequence, wi.isMulti, wi.MaxFromLoc DESC

END