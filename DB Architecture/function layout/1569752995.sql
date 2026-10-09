

CREATE FUNCTION SecurityPermissionEnabled(
    @userName nvarchar(30), 
    @formId numeric(5), 
    @checkPoints NVARCHAR(300) -- Now accepts comma-separated checkpoints
)
RETURNS BIT
AS
BEGIN
    DECLARE @result BIT = 1;  -- Assume access is granted (all 'Y')
    DECLARE @userSec NVARCHAR(MAX);
    DECLARE @checkPointValue INT;
    DECLARE @pos INT = 1;
    DECLARE @nextPos INT;

	--Find by group
	SET @userSec = (SELECT SEC_VALUES FROM SECURITY WHERE FORM_ID = @formId AND USER_NAME = @userName AND SECURITY_LEVEL = N'Group');
    -- Fetch security values for the user
	IF (@userSec IS NULL)
		SET @userSec = (SELECT SEC_VALUES FROM SECURITY WHERE FORM_ID = @formId AND USER_NAME = @userName AND SECURITY_LEVEL = N'User');
    
	IF (@userSec IS NULL)
		SET @userSec = (SELECT SEC_VALUES FROM SECURITY WHERE FORM_ID = @formId AND USER_NAME = @userName  AND SECURITY_LEVEL = N'System');
	-- If security is not set, return 1 (default allow)
    IF (@userSec IS NULL)
        RETURN 1;

    -- Loop through each checkpoint in the comma-separated list
    WHILE @pos <= LEN(@checkPoints)
    BEGIN
        -- Find the next comma
        SET @nextPos = CHARINDEX(N',', @checkPoints, @pos);

        -- If there are no more commas, take the last value
        IF @nextPos = 0
            SET @nextPos = LEN(@checkPoints) + 1;

        -- Extract the current checkpoint value
        SET @checkPointValue = CAST(SUBSTRING(@checkPoints, @pos, @nextPos - @pos) AS INT);

        -- Ensure the position is within the valid range
        IF @checkPointValue < 1 OR @checkPointValue > LEN(@userSec)
            RETURN 0;  -- Return 0 if out of range

        -- Check if security is 'Y' at the given position
        IF SUBSTRING(@userSec, @checkPointValue, 1) <> N'Y'
        BEGIN
            SET @result = 0;
            BREAK; -- No need to check further if one fails
        END

        -- Move to the next checkpoint in the list
        SET @pos = @nextPos + 1;
    END

    RETURN @result;
END;
