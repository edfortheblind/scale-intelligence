/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	17568	| SAT	| 09/20/05	| Created
	18757	| MDL	| 09/27/06	| Add Field Path and PathType
	35428	| TDA	| 09/19/08	| Removed Legacy Form
	55745	| TDA	| 08/10/09	| Removed Image Resource Key
	131874	| RJR	| 10/28/13	| Added "show in app menu"
	146910	| RJR	| 09/10/14	| Added "restrictions id"
	151124	| MMM	| 01/05/14	| Added "Defaults Id"
	224179	| SO	| 05/11/2018| Modified to pass current utc date for datetimestamp.

*/
CREATE PROCEDURE dbc_IMainUiScreen(
    @active nchar(1),
    @assemblyName nvarchar(100),
    @className nvarchar(100),
    @formId numeric(5),
    @functionalArea nvarchar(50),
    @menuResourceKey nvarchar(50),
    @namespace nvarchar(100),
    @processStamp nvarchar(100),
    @userDef1 nvarchar(25) = NULL,
    @userDef2 nvarchar(25) = NULL,
    @userDef3 nvarchar(25) = NULL,
    @userDef4 nvarchar(25) = NULL,
    @userDef5 nvarchar(25) = NULL,
    @userDef6 nvarchar(25) = NULL,
    @userDef7 numeric(19,5) = NULL,
    @userDef8 numeric(19,5) = NULL,
    @path nvarchar(250) = NULL,
    @pathType numeric(3) = 1,
	@objectIdentifier nvarchar(50), 
	@showInAppMenu nchar(1) = N'Y', 
	@restrictionsId nvarchar(100) = NULL, 
	@defaultsId nvarchar(100) = NULL	)
AS
    SET NOCOUNT ON;
	
	declare @recordCount int;
	
	
	Select @recordCount = count(*) from MAIN_UI_SCREEN where FORM_ID=@formId and SYSTEM_CREATED =N'N' and ACTIVE = N'Y';
	
	if( @recordCount > 0)
	begin
		set @active =N'N';
	End

    INSERT INTO MAIN_UI_SCREEN
        (ACTIVE,
         ASSEMBLY_NAME,
         CLASS_NAME,
         DATE_TIME_STAMP,
         FORM_ID,
         FUNCTIONAL_AREA,
         MENU_RESOURCE_KEY,
         NAMESPACE,
         PROCESS_STAMP,
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
		 PATH,
		 PATH_TYPE,
		 OBJECT_IDENTIFIER, 
		 SHOW_IN_APP_MENU, 
		 RESTRICTIONS_ID, 
		 DEFAULTS_ID)

    SELECT @active,
           @assemblyName,
           @className,
           getutcdate(),
           @formId,
           @functionalArea,
           @menuResourceKey,
           @namespace,
           @processStamp,
           N'Y',
           @userDef1,
           @userDef2,
           @userDef3,
           @userDef4,
           @userDef5,
           @userDef6,
           @userDef7,
           @userDef8,
           N'System',
		   @path,
		   @pathType,
		   @objectIdentifier, 
		   @showInAppMenu, 
		   @restrictionsId, 
		   @defaultsId
		   WHERE NOT EXISTS(SELECT *
                        FROM MAIN_UI_SCREEN
                       WHERE FORM_ID = @formId having COUNT(*) > 1);
