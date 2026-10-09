/*
	Mod Number  | Programmer    | Date       | Modification Description
	--------------------------------------------------------------------
	131874      | RJR			| 10/26/2013 | Created
	133104		| RJR			| 12/17/2013 | Added sequence
	133993		| TDA			| 12/18/2013 | Added LAYOUT_CSS_CLASS
	136463		| RJR			| 02/12/2014 | Added ACTIVE.
	138675		| RJR			| 03/17/2014 | Added default action.
	138370		| TDA			| 04/29/2014 | Renamed LAYOUT_CSS_CLASS to DIV_CSS_CLASS
	147605		| TDA			| 10/03/2014 | Added FIXED_TO_TOP	
	162720		| MDL			| 07/14/2015 | Added contentLoadingType	
	224179		| SO			| 05/11/2018 | Modified to pass current utc date for datetimestamp.
	Inserts a record for dbChange scripts.
*/

CREATE PROCEDURE dbc_IScreenGroup(
    @active char(1),
    @contentLoadingType numeric(5) = 0,
    @defaultAction nvarchar(250) = NULL,
    @divCssClass nvarchar(1000) = NULL,
    @fixedToTop char(1) = N'N',
    @groupName nvarchar(50),
    @groupType numeric(3),
    @nestedGroupUnit numeric(9),
    @parentGroupId numeric(9) = NULL,
    @processStamp nvarchar(100),
    @resourceKey nvarchar(50) = NULL,
    @rowCssClass nvarchar(1000) = NULL,
    @screenPartId numeric(9),
    @sequence numeric(9),
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

    INSERT INTO SCREEN_GROUP
        (ACTIVE,
         Content_Loading_Type,
         DATE_TIME_STAMP,
         DEFAULT_ACTION,
         DIV_CSS_CLASS,
         FIXED_TO_TOP,
         GROUP_NAME,
         GROUP_TYPE,
         NESTED_GROUP_UNIT,
         PARENT_GROUP_ID,
         PROCESS_STAMP,
         RESOURCE_KEY,
         ROW_CSS_CLASS,
         SCREEN_PART_ID,
         SEQUENCE,
         SYSTEM_CREATED,
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
           @contentLoadingType,
           getutcdate(),
           @defaultAction,
           @divCssClass,
           @fixedToTop,
           @groupName,
           @groupType,
           @nestedGroupUnit,
           @parentGroupId,
           @processStamp,
           @resourceKey,
           @rowCssClass,
           @screenPartId,
           @sequence,
           N'Y',
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
                        FROM SCREEN_GROUP
                       WHERE GROUP_NAME = @groupName and SCREEN_PART_ID = @screenPartId);
-- end dbc_IScreenGroup
-- end dbc_IScreenGroup