-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE MetaTrans_GetEmployees
    @User nvarchar(30) = NULL,
	@Supervisor nvarchar(30) = NULL
AS
BEGIN
    SET NOCOUNT ON;

	 DECLARE @IsManhUser BIT;
	 DECLARE @IsSaaSApplication BIT;
	 DECLARE @IsFeatureFlagOn BIT;

	-- [comment omitted]
	SELECT @IsFeatureFlagOn =
		CASE
			WHEN ENABLED = N'<literal:1>' THEN 1
			ELSE 0
		END
	FROM FEATURE_MANAGEMENT
	WHERE FEATURE_NAME = N'<literal:2>'

	-- [comment omitted]
	SELECT @IsSaaSApplication =
		CASE
			WHEN SYSTEM_VALUE = N'<literal:3>' THEN 1
			ELSE 0
		END
	FROM SYSTEM_CONFIG_DETAIL
	WHERE RECORD_TYPE = N'<literal:4>'
		AND SYS_KEY = N'<literal:5>'

    -- [comment omitted]
    SELECT @IsManhUser = 
        CASE 
            WHEN EMAIL_ADDRESS like N'<literal:6>' THEN 1 
            ELSE 0 
        END
    FROM USER_PROFILE
    WHERE USER_NAME = @User;
	
	IF (@IsSaaSApplication = 1  AND @IsFeatureFlagOn = 1) 
		BEGIN
			SELECT 
				up.USER_NAME AS N'<literal:7>',
				up.DESCRIPTION AS N'<literal:8>',
				up.DEPARTMENT As N'<literal:9>',
				up.SUPERVISOR AS N'<literal:10>',
				sup.DESCRIPTION AS SUPERVISOR_DESCRIPTION
			FROM USER_PROFILE up
			LEFT JOIN USER_PROFILE sup ON up.SUPERVISOR = sup.USER_NAME
			WHERE 
				up.ACTIVE = N'<literal:11>'
				AND
				(
					@User IS NULL -- [comment omitted]
					OR
					(
						@IsManhUser = 1 -- [comment omitted]
						OR
						(@IsManhUser = 0 AND up.EMAIL_ADDRESS not like N'<literal:12>') -- [comment omitted]
					)
				)
				AND
				(@Supervisor IS NULL OR up.Supervisor = @Supervisor)
			ORDER BY up.DESCRIPTION ASC;
		END
	ELSE
		BEGIN
			SELECT 
				up.USER_NAME AS N'<literal:13>',
				up.DESCRIPTION AS N'<literal:14>',
				up.DEPARTMENT As N'<literal:15>',
				up.SUPERVISOR AS N'<literal:16>',
				sup.DESCRIPTION AS SUPERVISOR_DESCRIPTION
			FROM USER_PROFILE up
			LEFT JOIN USER_PROFILE sup ON up.SUPERVISOR = sup.USER_NAME
			WHERE 
				up.ACTIVE = N'<literal:17>'
				AND
				(@Supervisor IS NULL OR up.Supervisor = @Supervisor)
			ORDER BY up.DESCRIPTION ASC;
		END
END

