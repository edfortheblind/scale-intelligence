
/*
	Mod Number	| Programmer	| Date   		| Modification Description
	------------------------------------------------------------------------------------------
	EX06		| UV			| 05/02/2018	| Created.
	EX06		| EL			| 07/21/2025	| Changed launch_num to nvarchar(25)
	EX06		| EL			| 07/24/2025	| Changed SP logic

	--2018-07-29 added join to work instruction view to determine max from location for each container then order by this Max from location descending 

	Returns the data of containers for PackSize.
*/
CREATE PROC [dbo].[TRAV_EX06_GetPackSizeWaveContainerData]
(
	--@LAUNCH_NUM numeric
	@LAUNCH_NUM NUMERIC(9,0)

)
AS
BEGIN


	SET NOCOUNT ON
	/* --previous script in full prior to Shawn change on 7/29/2018
	SELECT SCP.CONTAINER_ID CartonID, SCC.ITEM ProductID, CAST(SCC.QUANTITY As NUMERIC(19,0)) Quantity, N'1' DesignID
	FROM SHIPPING_CONTAINER SCC WITH(NOLOCK) JOIN SHIPPING_CONTAINER SCP WITH(NOLOCK)
	ON SCC.PARENT=SCP.INTERNAL_CONTAINER_NUM
	JOIN CONTAINER_TYPE CT WITH(NOLOCK)
	ON SCP.CONTAINER_TYPE=CT.CONTAINER_TYPE
	WHERE CT.USER_DEF1=N'Y'
	AND SCP.LAUNCH_NUM=@LAUNCH_NUM
	*/
	


	/*
	SELECT SCP.CONTAINER_ID CartonID, SCC.ITEM ProductID, CAST(SCC.QUANTITY As NUMERIC(19,0)) Quantity, N'1' DesignID
	FROM SHIPPING_CONTAINER SCC WITH(NOLOCK) JOIN SHIPPING_CONTAINER SCP WITH(NOLOCK)
	ON SCC.PARENT=SCP.INTERNAL_CONTAINER_NUM
	JOIN CONTAINER_TYPE CT WITH(NOLOCK)
	ON SCP.CONTAINER_TYPE=CT.CONTAINER_TYPE
	--begin Shawn edit 1 -- grabs the max location from work instruction table for each container
		JOIN 
		(
		select container_id, MAX(from_loc) MaxFromLoc, min(from_loc) MinFromLoc
		from WORK_INSTRUCTION_VIEW 
		where launch_num = @LAUNCH_NUM 
		--and work_unit = '00004000000053514910'
		group by container_id
		) wi on scp.CONTAINER_ID = wi.CONTAINER_ID
	--end Shawn edit 1

	WHERE CT.USER_DEF1=N'Y'
	AND SCP.LAUNCH_NUM=@LAUNCH_NUM
	--begin Shawn edit 2
	order by MaxFromLoc desc 
	--end Shawn edit 2
	*/

--Commented old SP - elopez 07272025	
	/*
		SELECT SCP.CONTAINER_ID CartonID, SCC.ITEM ProductID, CAST(SCC.QUANTITY As NUMERIC(19,0)) Quantity, N'1' DesignID, 
			DENSE_RANK() OVER (ORDER BY ismulti, MaxFromLoc desc) AS sequence
			--, pickCount, isMulti
			--, MinFromLoc, MaxFromLoc
	FROM SHIPPING_CONTAINER SCC WITH(NOLOCK) JOIN SHIPPING_CONTAINER SCP WITH(NOLOCK)
	ON SCC.PARENT=SCP.INTERNAL_CONTAINER_NUM
	JOIN CONTAINER_TYPE CT WITH(NOLOCK)
	ON SCP.CONTAINER_TYPE=CT.CONTAINER_TYPE
	--begin Shawn edit 1 -- grabs the max location from work instruction table for each container 
		JOIN 
		(
		select container_id, MAX(from_loc) MaxFromLoc, min(from_loc) MinFromLoc, count(*) pickCount, case when count(*) = 1 then 0 else 1 end isMulti 
		from WORK_INSTRUCTION_VIEW
		where launch_num = @LAUNCH_NUM 
		--and work_unit = '00004000000053514910'
		and INSTRUCTION_TYPE = 'Detail'
		group by container_id
		) wi on scp.CONTAINER_ID = wi.CONTAINER_ID
	--end Shawn edit 1

	WHERE CT.USER_DEF1=N'Y'
	AND SCP.LAUNCH_NUM=@LAUNCH_NUM
	--begin Shawn edit 2
	order by sequence,  ismulti, MaxFromLoc desc
	*/
	
--Updated new SP - elopez 07272025	
	
SELECT 
    SCP.CONTAINER_ID CartonID, 
    SCC.ITEM ProductID, 
    SCC.QUANTITY AS Quantity,  
    N'1' DesignID,
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
            TRY_CONVERT(NUMERIC(9,0), @LAUNCH_NUM) IS NOT NULL  -- <-- format check
            AND launch_num = TRY_CONVERT(NUMERIC(9,0), @LAUNCH_NUM)
            AND INSTRUCTION_TYPE = 'Detail'
        GROUP BY 
            container_id
    ) wi ON SCP.CONTAINER_ID = wi.container_id
WHERE 
    TRY_CONVERT(NUMERIC(9,0), @LAUNCH_NUM) IS NOT NULL  -- <-- format check
    AND SCP.LAUNCH_NUM = TRY_CONVERT(NUMERIC(9,0), @LAUNCH_NUM)
	AND CT.USER_DEF1 = N'Y'
ORDER BY 
    sequence, wi.isMulti, wi.MaxFromLoc DESC

END