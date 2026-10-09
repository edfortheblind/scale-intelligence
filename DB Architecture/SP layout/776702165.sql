/*    
 TASK | BY | DATE  | MODIFICATION DESCRIPTION    
 --------------------------------------------------------------------    
 40636 | NRJ | 02/20/25 | CREATED     
*/        

CREATE PROCEDURE Get_LaborActivityGroupsForConsolidation(
@internalNums NVARCHAR(MAX))    
AS     
BEGIN    

    SET NOCOUNT ON;
    
-- Split the string into a table
    DECLARE @internalDetailNumTable TABLE (INTERNAL_DETAIL_NUM INT PRIMARY KEY);

    INSERT INTO @internalDetailNumTable
    SELECT value
    FROM STRING_SPLIT(@internalNums, N',') WHERE ISNUMERIC(value) = 1;

--get labor partition groups

WITH LaborGroups AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY USER_NAME ORDER BY START_DATE_TIME) AS RowNum
    FROM LABOR_MANAGEMENT_DETAIL WHERE INTERNAL_DETAIL_NUM IN (SELECT INTERNAL_DETAIL_NUM FROM @internalDetailNumTable)
),

--get labor activity partition groups.
--Labor records having same group id will get consolidated together.

LaborActivityGroups AS (
    SELECT
        INTERNAL_DETAIL_NUM,
        USER_NAME,
        ACTIVITY_TYPE,
        QUANTITY_UM,
        LABOR_GROUP,
        LABOR_TYPE,
        WORK_GROUP,
        SHIFT,
		WAREHOUSE_DAY,
        WAREHOUSE,
        START_DATE_TIME,
        END_DATE_TIME,
        TOTAL_QUANTITY,        
        -- Identify group breaks whenever partition changes
        CONCAT(USER_NAME, N'_', ACTIVITY_TYPE, N'_', RowNum - ROW_NUMBER() OVER (
            PARTITION BY USER_NAME, ACTIVITY_TYPE, QUANTITY_UM, LABOR_GROUP, WORK_GROUP, SHIFT, WAREHOUSE_DAY, WAREHOUSE 
            ORDER BY START_DATE_TIME
        )) AS GROUP_ID
    FROM LaborGroups        
)

SELECT  LAG.INTERNAL_DETAIL_NUM,
        LAG.USER_NAME,
        LAG.ACTIVITY_TYPE,
        LAG.QUANTITY_UM,
        LAG.LABOR_GROUP,
        LAG.LABOR_TYPE,
        LAG.WORK_GROUP,
        LAG.SHIFT,
		LAG.WAREHOUSE_DAY,
        LAG.WAREHOUSE,
        LAG.START_DATE_TIME,
        LAG.END_DATE_TIME,
        LAG.TOTAL_QUANTITY,
        LAG.GROUP_ID,
        LG.EXPECTED_THROUGHPUT,  
        LG.HEEL_TO_TOE_TOLERANCE
FROM LaborActivityGroups LAG LEFT JOIN Labor_Group LG 
        ON LAG.LABOR_GROUP = LG.LABOR_GROUP
        ORDER BY LAG.USER_NAME,LAG.START_DATE_TIME;
           
END