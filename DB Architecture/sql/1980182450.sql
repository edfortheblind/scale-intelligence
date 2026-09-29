-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */








CREATE PROCEDURE dbc_IFeatureManagement
    @feature_name NVARCHAR(255),
    @enabled CHAR(1),
    @prod_release NVARCHAR(50),
    @process_stamp NVARCHAR(100),
	@removed NCHAR(1) = N'<literal:1>' 
AS
BEGIN
    SET NOCOUNT ON;
 
    -- [comment omitted]
    IF NOT EXISTS(SELECT TOP 1 1 
                  FROM FEATURE_MANAGEMENT 
                  WHERE FEATURE_NAME = @feature_name)
    BEGIN
        -- [comment omitted]
        INSERT INTO FEATURE_MANAGEMENT 
        (FEATURE_NAME, ENABLED, USER_STAMP, DATE_TIME_STAMP, CREATED_DATE, PRODUCT_RELEASE, PROCESS_STAMP)
        VALUES 
        (@feature_name, @enabled, N'<literal:2>', GETUTCDATE(), GETUTCDATE(), @prod_release, @process_stamp);
 
        PRINT N'<literal:3>';
    END
    ELSE
    BEGIN
        UPDATE FEATURE_MANAGEMENT SET ENABLED = @enabled,PRODUCT_RELEASE = @prod_release,DATE_TIME_STAMP= GETUTCDATE(), PROCESS_STAMP = @process_stamp WHERE FEATURE_NAME= @feature_name
    END
END;
-- [comment omitted]