/*
	Mod Number	| Programmer	| Date   	| Modification Description
	-------------------------------------------------------------------- 
	49522		| AD			| 05/05/25	| Created.
*/

CREATE PROCEDURE MetaTrans_GetEmployees
    @User nvarchar(30) = NULL,
	@Supervisor nvarchar(30) = NULL
AS
BEGIN
    SET NOCOUNT ON;

	 DECLARE @IsManhUser BIT;
	 DECLARE @IsSaaSApplication BIT;
	 DECLARE @IsFeatureFlagOn BIT;

	-- Determine if feature flag is on or off
	SELECT @IsFeatureFlagOn =
		CASE
			WHEN ENABLED = N'Y' THEN 1
			ELSE 0
		END
	FROM FEATURE_MANAGEMENT
	WHERE FEATURE_NAME = N'FEATURE_25641_HIDE_MANH_USER'

	-- Determine if is a saas application
	SELECT @IsSaaSApplication =
		CASE
			WHEN SYSTEM_VALUE = N'Y' THEN 1
			ELSE 0
		END
	FROM SYSTEM_CONFIG_DETAIL
	WHERE RECORD_TYPE = N'SaaS'
		AND SYS_KEY = N'10'

    -- Determine if the input user has a signature
    SELECT @IsManhUser = 
        CASE 
            WHEN EMAIL_ADDRESS like N'%@manh.com' THEN 1 
            ELSE 0 
        END
    FROM USER_PROFILE
    WHERE USER_NAME = @User;
	
	IF (@IsSaaSApplication = 1  AND @IsFeatureFlagOn = 1) 
		BEGIN
			SELECT 
				up.USER_NAME AS N'UserName',
				up.DESCRIPTION AS N'Description',
				up.DEPARTMENT As N'Department',
				up.SUPERVISOR AS N'Supervisor',
				sup.DESCRIPTION AS SUPERVISOR_DESCRIPTION
			FROM USER_PROFILE up
			LEFT JOIN USER_PROFILE sup ON up.SUPERVISOR = sup.USER_NAME
			WHERE 
				up.ACTIVE = N'Y'
				AND
				(
					@User IS NULL -- if no user input, return all
					OR
					(
						@IsManhUser = 1 -- user is a manh user: return all
						OR
						(@IsManhUser = 0 AND up.EMAIL_ADDRESS not like N'%@manh.com') -- logged in user is production user and return only production users
					)
				)
				AND
				(@Supervisor IS NULL OR up.Supervisor = @Supervisor)
			ORDER BY up.DESCRIPTION ASC;
		END
	ELSE
		BEGIN
			SELECT 
				up.USER_NAME AS N'UserName',
				up.DESCRIPTION AS N'Description',
				up.DEPARTMENT As N'Department',
				up.SUPERVISOR AS N'Supervisor',
				sup.DESCRIPTION AS SUPERVISOR_DESCRIPTION
			FROM USER_PROFILE up
			LEFT JOIN USER_PROFILE sup ON up.SUPERVISOR = sup.USER_NAME
			WHERE 
				up.ACTIVE = N'Y'
				AND
				(@Supervisor IS NULL OR up.Supervisor = @Supervisor)
			ORDER BY up.DESCRIPTION ASC;
		END
END

