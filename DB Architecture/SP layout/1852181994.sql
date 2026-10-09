/*
	Mod Number  | Programmer    | Date       | Modification Description
	--------------------------------------------------------------------
	 224179		| SO			| 05/11/2018 | Modified to pass current utc date for datetimestamp.
*/


CREATE PROCEDURE dbc_IDockMgrGridCustomization(
    @description nvarchar(50) = NULL,
    @entity nvarchar(50),
    @perspective numeric(9),
    @processStamp nvarchar(100),
    @userDef1 nvarchar(25) = NULL,
    @userDef2 nvarchar(25) = NULL,
    @userDef3 nvarchar(25) = NULL,
    @userDef4 nvarchar(25) = NULL,
    @userDef5 nvarchar(25) = NULL,
    @userDef6 nvarchar(25) = NULL,
    @userDef7 numeric(19,5) = NULL,
    @userDef8 numeric(19,5) = NULL,
    @visibleProperty nvarchar(50),
    @position numeric(3),
	@columnWidth numeric(9))
AS
    SET NOCOUNT ON;

    INSERT INTO DOCK_MGR_GRID_CUSTOMIZATION
        (DATE_TIME_STAMP,
         DESCRIPTION,
         ENTITY,
         PERSPECTIVE,
         PROCESS_STAMP,
         USER_DEF1,
         USER_DEF2,
         USER_DEF3,
         USER_DEF4,
         USER_DEF5,
         USER_DEF6,
         USER_DEF7,
         USER_DEF8,
         USER_STAMP,
         VISIBLE_PROPERTY,
         POSITION,
		 COLUMN_WIDTH)
    SELECT 
		getutcdate(),
		@description,
		@entity,
		OBJECT_ID,
		@processStamp,
		@userDef1,
		@userDef2,
		@userDef3,
		@userDef4,
		@userDef5,
		@userDef6,
		@userDef7,
		@userDef8,
		N'System',
		@visibleProperty,
		@position,
		@columnWidth
		FROM GENERIC_CONFIG_DETAIL
		WHERE RECORD_TYPE = N'DOCKMANGRIDPERSPECTIVE'
		  AND IDENTIFIER = @perspective
		  AND NOT EXISTS (
		    SELECT * FROM DOCK_MGR_GRID_CUSTOMIZATION
		    WHERE ENTITY = @entity
		    AND VISIBLE_PROPERTY = @visibleProperty
		    AND PERSPECTIVE = (
		      SELECT OBJECT_ID FROM GENERIC_CONFIG_DETAIL
		      WHERE RECORD_TYPE = N'DOCKMANGRIDPERSPECTIVE'
		        AND IDENTIFIER = @perspective));

