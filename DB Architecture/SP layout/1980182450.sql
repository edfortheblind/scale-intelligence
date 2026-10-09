
/*
	Mod Number  | Programmer    | Date       | Modification Description
	--------------------------------------------------------------------
	43357       | SG            | 19/11/2024 | Created.
			

	Inserts a record for dbChange scripts.
*/

CREATE PROCEDURE dbc_IFeatureManagement
    @feature_name NVARCHAR(255),
    @enabled CHAR(1),
    @prod_release NVARCHAR(50),
    @process_stamp NVARCHAR(100),
	@removed NCHAR(1) = N'N' 
AS
BEGIN
    SET NOCOUNT ON;
 
    -- Check if the feature already exists
    IF NOT EXISTS(SELECT TOP 1 1 
                  FROM FEATURE_MANAGEMENT 
                  WHERE FEATURE_NAME = @feature_name)
    BEGIN
        -- Insert a new record into the FEATURE_MANAGEMENT table
        INSERT INTO FEATURE_MANAGEMENT 
        (FEATURE_NAME, ENABLED, USER_STAMP, DATE_TIME_STAMP, CREATED_DATE, PRODUCT_RELEASE, PROCESS_STAMP)
        VALUES 
        (@feature_name, @enabled, N'System', GETUTCDATE(), GETUTCDATE(), @prod_release, @process_stamp);
 
        PRINT N'Feature inserted successfully.';
    END
    ELSE
    BEGIN
        UPDATE FEATURE_MANAGEMENT SET ENABLED = @enabled,PRODUCT_RELEASE = @prod_release,DATE_TIME_STAMP= GETUTCDATE(), PROCESS_STAMP = @process_stamp WHERE FEATURE_NAME= @feature_name
    END
END;
-- end dbc_IFeatureManagement