CREATE PROCEDURE GetIntraDayLaborProgressActiveEmployees
    @WAREHOUSE nvarchar(25),
    @WAREHOUSE_START_TIME_UTC datetime,
    @LATEST_CON_JOB_RUN_TIME datetime,
    @IS_WORK_TYPE_ACTIVE nchar(1)
AS
BEGIN
    SET NOCOUNT ON;

    -- Single-pass query: pick each user's latest activity, then keep only active users by HTT.
    SELECT
        ISNULL(UP.DESCRIPTION, LATEST.USER_NAME) AS EmployeeName,
        LATEST.ACTIVITY_TYPE  AS LatestWorkType,
        LATEST.WORK_GROUP     AS WorkGroup
    FROM
        (
            SELECT
                LMD.USER_NAME,
                LMD.ACTIVITY_TYPE,
                LMD.WORK_GROUP,
                LMD.ACTIVITY_END_TIME,
                ISNULL(LG.HEEL_TO_TOE_TOLERANCE, 30) AS HEEL_TO_TOE_TOLERANCE,
                ROW_NUMBER() OVER (
                    PARTITION BY LMD.USER_NAME
                    ORDER BY
                        LMD.ACTIVITY_END_TIME DESC,
                        LMD.ACTIVITY_START_TIME DESC,
                        LMD.ACTIVITY_TYPE ASC
                ) AS RN
            FROM
                LABOR_MGMT_DETAIL_CONSOLIDATION LMD
            INNER JOIN
                WORK_TYPE WT
                    ON WT.WORK_TYPE = LMD.ACTIVITY_TYPE
                   AND WT.ACTIVE = @IS_WORK_TYPE_ACTIVE
            LEFT JOIN
                LABOR_GROUP LG
                    ON LG.LABOR_GROUP = WT.LABOR_GROUP
            WHERE
                LMD.WAREHOUSE = @WAREHOUSE
                AND LMD.ACTIVITY_START_TIME >= @WAREHOUSE_START_TIME_UTC
                AND LMD.ACTIVITY_END_TIME <= @LATEST_CON_JOB_RUN_TIME
        ) LATEST
    LEFT JOIN
        USER_PROFILE UP
            ON UP.USER_NAME = LATEST.USER_NAME
    WHERE
        LATEST.RN = 1
        AND DATEDIFF(MINUTE, LATEST.ACTIVITY_END_TIME, @LATEST_CON_JOB_RUN_TIME) <= LATEST.HEEL_TO_TOE_TOLERANCE
    ORDER BY
        ISNULL(UP.DESCRIPTION, LATEST.USER_NAME);

END
