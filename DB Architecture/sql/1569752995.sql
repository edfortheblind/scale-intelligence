-- DOCUMENTATION ONLY: literals/comments removed; do not execute.


CREATE FUNCTION SecurityPermissionEnabled(
    @userName nvarchar(30), 
    @formId numeric(5), 
    @checkPoints NVARCHAR(300) -- [comment omitted]
)
RETURNS BIT
AS
BEGIN
    DECLARE @result BIT = 1;  -- [comment omitted]
    DECLARE @userSec NVARCHAR(MAX);
    DECLARE @checkPointValue INT;
    DECLARE @pos INT = 1;
    DECLARE @nextPos INT;

	-- [comment omitted]
	SET @userSec = (SELECT SEC_VALUES FROM SECURITY WHERE FORM_ID = @formId AND USER_NAME = @userName AND SECURITY_LEVEL = N'<literal:1>');
    -- [comment omitted]
	IF (@userSec IS NULL)
		SET @userSec = (SELECT SEC_VALUES FROM SECURITY WHERE FORM_ID = @formId AND USER_NAME = @userName AND SECURITY_LEVEL = N'<literal:2>');
    
	IF (@userSec IS NULL)
		SET @userSec = (SELECT SEC_VALUES FROM SECURITY WHERE FORM_ID = @formId AND USER_NAME = @userName  AND SECURITY_LEVEL = N'<literal:3>');
	-- [comment omitted]
    IF (@userSec IS NULL)
        RETURN 1;

    -- [comment omitted]
    WHILE @pos <= LEN(@checkPoints)
    BEGIN
        -- [comment omitted]
        SET @nextPos = CHARINDEX(N'<literal:4>', @checkPoints, @pos);

        -- [comment omitted]
        IF @nextPos = 0
            SET @nextPos = LEN(@checkPoints) + 1;

        -- [comment omitted]
        SET @checkPointValue = CAST(SUBSTRING(@checkPoints, @pos, @nextPos - @pos) AS INT);

        -- [comment omitted]
        IF @checkPointValue < 1 OR @checkPointValue > LEN(@userSec)
            RETURN 0;  -- [comment omitted]

        -- [comment omitted]
        IF SUBSTRING(@userSec, @checkPointValue, 1) <> N'<literal:5>'
        BEGIN
            SET @result = 0;
            BREAK; -- [comment omitted]
        END

        -- [comment omitted]
        SET @pos = @nextPos + 1;
    END

    RETURN @result;
END;
