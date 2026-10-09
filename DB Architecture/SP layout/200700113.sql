/*
	Mod Number  | Programmer    | Date       | Modification Description
	--------------------------------------------------------------------
	19056       | RAB           | 6/12/2006  | Created.

	Inserts a record for dbChange scripts.
*/

CREATE PROCEDURE dbc_IRatingService(
    @active nchar(1),
    @processStamp nvarchar(100),
    @ratingId nvarchar(25),
    @ratingService nvarchar(50),
    @serviceSymbol nvarchar(50),
    @userDef1 nvarchar(25) = NULL,
    @userDef2 nvarchar(25) = NULL,
    @userDef3 nvarchar(25) = NULL,
    @userDef4 nvarchar(25) = NULL,
    @userDef5 nvarchar(25) = NULL,
    @userDef6 nvarchar(25) = NULL,
    @userDef7 numeric(19,5) = NULL,
    @userDef8 numeric(19,5) = NULL)
AS
    SET NOCOUNT ON;

    INSERT INTO RATING_SERVICE
        (ACTIVE,
         DATE_TIME_STAMP,
         PROCESS_STAMP,
         RATING_ID,
         RATING_SERVICE,
         SERVICE_SYMBOL,
         USER_DEF1,
         USER_DEF2,
         USER_DEF3,
         USER_DEF4,
         USER_DEF5,
         USER_DEF6,
         USER_DEF7,
         USER_DEF8,
         USER_STAMP)
    SELECT @active,
           GETUTCDATE(),
           @processStamp,
           @ratingId,
           @ratingService,
           @serviceSymbol,
           @userDef1,
           @userDef2,
           @userDef3,
           @userDef4,
           @userDef5,
           @userDef6,
           @userDef7,
           @userDef8,
           N'System'
     WHERE NOT EXISTS(SELECT *
                        FROM RATING_SERVICE
                       WHERE RATING_ID = @ratingId
                         AND RATING_SERVICE = @ratingService);
-- end dbc_IRatingService
