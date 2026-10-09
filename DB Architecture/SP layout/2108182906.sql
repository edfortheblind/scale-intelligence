
/*
	Mod Number  | Programmer    | Date       | Modification Description
	--------------------------------------------------------------------
	            | DBCGenerator  | 6/21/2005	| Created.
             19249  | RLG           | 6/05/2005	| Forced build to compile
	     	    | KT            | 9/21/2005	| Added recordTypeText parameter
	224179		| SO			| 05/11/2018 | Modified to pass current utc date for datetimestamp.

	Inserts a record for dbChange scripts.
*/

CREATE PROCEDURE dbc_ILookupReference(
    @configRecordType nvarchar(50) = NULL,
    @includeWarehouse nchar(1) = NULL,
    @processStamp nvarchar(100),
    @recordType nvarchar(50),
    @recordTypeText nvarchar(2000) = NULL,
    @tableField1 nvarchar(50),
    @tableField1Type nchar(1),
    @tableField10 nvarchar(50) = NULL,
    @tableField10Type nchar(1) = NULL,
    @tableField2 nvarchar(50) = NULL,
    @tableField2Type nchar(1) = NULL,
    @tableField3 nvarchar(50) = NULL,
    @tableField3Type nchar(1) = NULL,
    @tableField4 nvarchar(50) = NULL,
    @tableField4Type nchar(1) = NULL,
    @tableField5 nvarchar(50) = NULL,
    @tableField5Type nchar(1) = NULL,
    @tableField6 nvarchar(50) = NULL,
    @tableField6Type nchar(1) = NULL,
    @tableField7 nvarchar(50) = NULL,
    @tableField7Type nchar(1) = NULL,
    @tableField8 nvarchar(50) = NULL,
    @tableField8Type nchar(1) = NULL,
    @tableField9 nvarchar(50) = NULL,
    @tableField9Type nchar(1) = NULL,
    @tableName nvarchar(50),
    @useActiveFlag nchar(1) = NULL,
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

    INSERT INTO LOOKUP_REFERENCE
        (CONFIG_RECORD_TYPE,
         DATE_TIME_STAMP,
         INCLUDE_WAREHOUSE,
         PROCESS_STAMP,
         RECORD_TYPE,
         TABLE_FIELD1,
         TABLE_FIELD1_TYPE,
         TABLE_FIELD10,
         TABLE_FIELD10_TYPE,
         TABLE_FIELD2,
         TABLE_FIELD2_TYPE,
         TABLE_FIELD3,
         TABLE_FIELD3_TYPE,
         TABLE_FIELD4,
         TABLE_FIELD4_TYPE,
         TABLE_FIELD5,
         TABLE_FIELD5_TYPE,
         TABLE_FIELD6,
         TABLE_FIELD6_TYPE,
         TABLE_FIELD7,
         TABLE_FIELD7_TYPE,
         TABLE_FIELD8,
         TABLE_FIELD8_TYPE,
         TABLE_FIELD9,
         TABLE_FIELD9_TYPE,
         TABLE_NAME,
         USE_ACTIVE_FLAG,
         USER_DEF1,
         USER_DEF2,
         USER_DEF3,
         USER_DEF4,
         USER_DEF5,
         USER_DEF6,
         USER_DEF7,
         USER_DEF8,
         USER_STAMP)
    SELECT @configRecordType,
           getutcdate(),
           @includeWarehouse,
           @processStamp,
           @recordType,
           @tableField1,
           @tableField1Type,
           @tableField10,
           @tableField10Type,
           @tableField2,
           @tableField2Type,
           @tableField3,
           @tableField3Type,
           @tableField4,
           @tableField4Type,
           @tableField5,
           @tableField5Type,
           @tableField6,
           @tableField6Type,
           @tableField7,
           @tableField7Type,
           @tableField8,
           @tableField8Type,
           @tableField9,
           @tableField9Type,
           @tableName,
           @useActiveFlag,
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
                        FROM LOOKUP_REFERENCE
                       WHERE RECORD_TYPE = @recordType
                       AND TABLE_NAME = @tableName
                       AND CONFIG_RECORD_TYPE = @configRecordType);

	
	if (@recordTypeText is not null)	
	
	begin exec dbc_IResourceFileBase           
	@resourceGroup = N'Text',           
	@resourceKey = @recordType,           
	@text = @recordTypeText,           
	@processStamp = @processStamp;
	end;


-- end dbc_ILookupReference
