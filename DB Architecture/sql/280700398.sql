-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */



































CREATE PROCEDURE dbc_IScreenControlAttributes(



    @active char(1),



    @attributeName nvarchar(100),



    @attributeValue nvarchar(500),



    @isControlProperty char(1),



    @processStamp nvarchar(100),



    @screenControlId numeric(9),



    @userDef1 nvarchar(25) = NULL,



    @userDef2 nvarchar(25) = NULL,



    @userDef3 nvarchar(25) = NULL,



    @userDef4 nvarchar(25) = NULL,



    @userDef5 nvarchar(25) = NULL,



    @userDef6 nvarchar(25) = NULL,



    @userDef7 numeric(19,5) = NULL,



    @userDef8 numeric(19,5) = NULL,



	@token1 nvarchar(25) =NULL,



	@token2 nvarchar(25) =NULL,



	@token3 nvarchar(25) =NULL,



	@token4 nvarchar(25) =NULL,



	@token5 nvarchar(25) =NULL,



	@token6 nvarchar(25) =NULL,



	@token7 nvarchar(25) =NULL,



	@token8 nvarchar(25) =NULL,



	@token9 nvarchar(25) =NULL,



	@token10 nvarchar(25) =NULL)



AS



    SET NOCOUNT ON;







    INSERT INTO SCREEN_CONTROL_ATTRIBUTES



        (ACTIVE,



         ATTRIBUTE_NAME,



         ATTRIBUTE_VALUE,



         DATE_TIME_STAMP,



         IS_CONTROL_PROPERTY,



         PROCESS_STAMP,



         SCREEN_CONTROL_ID,



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

		 

		 TOKEN1,

		 

		 TOKEN2,

		 

		 TOKEN3,

		 

		 TOKEN4,

		 

		 TOKEN5,

		 

		 TOKEN6,

		 

		 TOKEN7,

		 

		 TOKEN8,

		 

		 TOKEN9,

		 

		 TOKEN10)



    SELECT @active,



           @attributeName,



           @attributeValue,



           getutcdate(),



           @isControlProperty,



           @processStamp,



           @screenControlId,



           N'<literal:1>',



           @userDef1,



           @userDef2,



           @userDef3,



           @userDef4,



           @userDef5,



           @userDef6,



           @userDef7,



           @userDef8,



           N'<literal:2>',



		   @token1,



		   @token2,



		   @token3,



		   @token4,



		   @token5,



		   @token6,



		   @token7,



		   @token8,



		   @token9,



		   @token10



     WHERE NOT EXISTS(SELECT *



                        FROM SCREEN_CONTROL_ATTRIBUTES



                       WHERE SCREEN_CONTROL_ID = @screenControlId and ATTRIBUTE_NAME = @attributeName and ATTRIBUTE_VALUE = @attributeValue);



-- [comment omitted]