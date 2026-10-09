/*
	Mod Number  | Programmer    | Date       | Modification Description
	--------------------------------------------------------------------
	19159       | MAG	    | 05/12/2006 | Created.
	224179		| SO		| 05/11/2018 | Modified to pass current utc date for datetimestamp

	Creates a stored procedure used to insert accessorial headers.
*/


CREATE PROCEDURE dbc_IAccessorialHeader(
        @ratingService nvarchar(50),
        @accessorialCode nvarchar(25),
        @ratingId nvarchar(25),
        @description nvarchar(50),
        @applyPerContainer nchar(1) = null,
        @userDef1 nvarchar(25) = null,
        @userDef2 nvarchar(25) = null,
        @userDef3 nvarchar(25) = null,
        @userDef4 nvarchar(25) = null,
        @userDef5 nvarchar(25) = null,
        @userDef6 nvarchar(25) = null,
        @userDef7 numeric(19,5) = null,
        @userDef8 numeric(19,5) = null,
        @userStamp nvarchar(30) = null,
        @processStamp nvarchar(100) = null,
        @alwaysApply nchar(1) = null)
AS
        SET NOCOUNT ON;
        
        --
        -- insert the new Accessorial Header
        --
        INSERT INTO ACCESSORIAL_HEADER
                (RATING_SERVICE,
                 ACCESSORIAL_CODE,
                 RATING_ID,
                 DESCRIPTION,
                 APPLY_PER_CONTAINER,
                 SYSTEM_CREATED,
                 USER_DEF1,
                 USER_DEF2,
                 USER_DEF3,
                 USER_DEF4,
                 USER_DEF5,
                 USER_DEF6,
                 USER_DEF7,
                 USER_DEF8,
                 USER_STAMP,
                 PROCESS_STAMP,
                 DATE_TIME_STAMP,
                 ALWAYS_APPLY)
        select
                @ratingService,
                 @accessorialCode,
                 @ratingId,
                 @description,
                 @applyPerContainer,
                N'Y',
                 @userDef1,
                 @userDef2,
                 @userDef3,
                 @userDef4,
                 @userDef5,
                 @userDef6,
                 @userDef7,
                 @userDef8,
                 @userStamp,
                 @processStamp,
                 getutcdate(),
                 @alwaysApply
     WHERE NOT EXISTS(SELECT *
                        FROM ACCESSORIAL_HEADER
                       WHERE RATING_ID = @ratingId
                         AND RATING_SERVICE = @ratingService
                         AND ACCESSORIAL_CODE = @accessorialCode);
-- end dbc_IAccessorialDetail
