/*
	Mod Number	| Programmer	| Date   		| Modification Description
	------------------------------------------------------------------------------------------
	EX01		| rphilip		| 03/10/2023	| Created.
	EX01		| elopez		| 07/15/2025	| Changed JOIN logic to take Parent cont ID.
	EX01		| elopez		| 07/17/2025	| Include JOIN with CONTAINER_TYPE
	EX01		| elopez		| 07/17/2025	| Re ordered JOIN and add SCP to CONTAINER_TYPE

	Returns the data of containers for PackSize.
*/

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
    N'1' DesignID,
    DENSE_RANK() OVER (ORDER BY wi.ismulti, wi.MaxFromLoc DESC) AS sequence
FROM 
    SHIPPING_CONTAINER SCC WITH(NOLOCK)
JOIN 
    SHIPPING_CONTAINER SCP WITH(NOLOCK)
    --ON SCC.PARENT = SCP.INTERNAL_CONTAINER_NUM
	ON SCC.PARENT_CONTAINER_ID = SCP.CONTAINER_ID --Modified by elopez 07/15/2025
JOIN CONTAINER_TYPE CT WITH(NOLOCK) --Modified by elopez 07/17/2025
	ON SCP.CONTAINER_TYPE=CT.CONTAINER_TYPE --Modified by elopez 07/17/2025
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
            AND INSTRUCTION_TYPE = 'Detail'
        GROUP BY 
            container_id
    ) wi ON SCP.CONTAINER_ID = wi.container_id
WHERE 
    SCP.LAUNCH_NUM = CONVERT(NUMERIC(9,0), @LAUNCH_NUM)
	and CT.USER_DEF1=N'Y' --Modified by elopez 07/17/2025
ORDER BY 
    sequence, wi.isMulti, wi.MaxFromLoc DESC


END
