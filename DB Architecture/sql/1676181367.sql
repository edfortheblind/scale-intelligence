-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */











CREATE PROCEDURE dbc_IAccessorialDetail(
    @accessorialCode nvarchar(25),
    @accessorialSubCode nvarchar(25),
    @allowOverride nchar(1),
	@applyToContainerContents nchar(1),
    @description nvarchar(50),
    @externalSymbol nvarchar(50) = NULL,
	@headerId numeric(9),  
    @includeFreightInAmt nchar(1) = NULL,
    @processStamp nvarchar(100),
    @ratingId nvarchar(25),
    @ratingService nvarchar(50),
    @requiredForRating nchar(1),
    @useValueAsAmt nchar(1) = NULL,
    @userDef1 nvarchar(25) = NULL,
    @userDef2 nvarchar(25) = NULL,
    @userDef3 nvarchar(25) = NULL,
    @userDef4 nvarchar(25) = NULL,
    @userDef5 nvarchar(25) = NULL,
    @userDef6 nvarchar(25) = NULL,
    @userDef7 numeric(19,5) = NULL,
    @userDef8 numeric(19,5) = NULL,
    @value nvarchar(50) = NULL,
    @valueType nvarchar(25),
	@parent nvarchar(50) = NULL)
AS  
    SET NOCOUNT ON;  
  
  	declare @parentObjectId numeric(9);

	set @parentObjectId = 0;

	if (@parent is not null)
		select top 1 @parentObjectId = ad.OBJECT_ID from ACCESSORIAL_DETAIL ad where ad.ACCESSORIAL_SUB_CODE = @parent and RATING_ID = @ratingId and RATING_SERVICE = @ratingService and ACCESSORIAL_CODE = @accessorialCode  and VALUE_TYPE = N'<literal:1>';
  
    INSERT INTO ACCESSORIAL_DETAIL  
        (ACCESSORIAL_CODE,  
         ACCESSORIAL_SUB_CODE,  
         ALLOW_OVERRIDE,  
         APPLY_TO_CONTAINER_CONTENTS,  
         DATE_TIME_STAMP,  
         DESCRIPTION,  
         EXTERNAL_SYMBOL,  
         HEADER_ID,  
         INCLUDE_FREIGHT_IN_AMT,  
         PROCESS_STAMP,  
         RATING_ID,  
         RATING_SERVICE,  
         REQUIRED_FOR_RATING,  
         SYSTEM_CREATED,  
         USE_VALUE_AS_AMT,  
         USER_DEF1,  
         USER_DEF2,  
         USER_DEF3,  
         USER_DEF4,  
         USER_DEF5,  
         USER_DEF6,  
         USER_DEF7,  
         USER_DEF8,  
         USER_STAMP,  
         VALUE,  
         VALUE_TYPE,
         PARENT_OBJECT_ID)  
    SELECT @accessorialCode,  
           @accessorialSubCode,  
           @allowOverride,  
           @applyToContainerContents,  
           getutcdate(),  
           @description,  
           @externalSymbol,  
           @headerId,  
           @includeFreightInAmt,  
           @processStamp,  
           @ratingId,  
           @ratingService,  
           @requiredForRating,  
           N'<literal:2>',  
           @useValueAsAmt,  
           @userDef1,  
           @userDef2,  
           @userDef3,  
           @userDef4,  
           @userDef5,  
           @userDef6,  
           @userDef7,  
           @userDef8,  
           N'<literal:3>',  
           @value,  
           @valueType,
           @parentObjectId  
     WHERE NOT EXISTS(SELECT *  
                        FROM ACCESSORIAL_DETAIL  
                       WHERE RATING_ID = @ratingId  
                         AND RATING_SERVICE = @ratingService  
                         AND ACCESSORIAL_CODE = @accessorialCode  
                         AND EXTERNAL_SYMBOL = @externalSymbol);  
-- [comment omitted]