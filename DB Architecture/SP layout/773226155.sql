---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------------------------------------------------


/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	185350	| MHM	| 09/19/16	| Created
	191074	| DN	| 01/23/17	| Updated parameter types
	204419	| RJR	| 04/24/17	| Added passedWhsVal and passedWhsFld.
*/
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



CREATE PROCEDURE MetaTrans_GetLookup(
@recordType nvarchar(50), @passedWhsVal nvarchar(200), @passedWhsFld nvarchar(50), @culture nvarchar(10))
-- cannot pass warehouse as type of warehouse field as there can be a list of warehouses passed here
AS
	SET NOCOUNT ON;

	-- please note company and warehouse are required
	
	begin 		
		SELECT 
			N'SCALAR' AS N'EntityType',
			N'LookupReference' AS N'EntityName', 
			@recordType AS N'RecordType', 
			LR.TABLE_FIELD1 AS N'TableField1',
			LR.TABLE_FIELD2 AS N'TableField2', 
			LR.TABLE_FIELD3 AS N'TableField3',
			LR.TABLE_FIELD4 AS N'TableField4', 
			LR.TABLE_FIELD5 AS N'TableField5',
			LR.TABLE_FIELD6 AS N'TableField6',
			LR.TABLE_FIELD7 AS N'TableField7',
			LR.TABLE_FIELD8 AS N'TableField8',
			LR.TABLE_FIELD9 AS N'TableField9',
			LR.TABLE_FIELD10 AS N'TableField10',
			LR.TABLE_FIELD1_TYPE AS N'TableField1Type',
			LR.TABLE_FIELD2_TYPE AS N'TableField2Type',
			LR.TABLE_FIELD3_TYPE AS N'TableField3Type',
			LR.TABLE_FIELD4_TYPE AS N'TableField4Type',
			LR.TABLE_FIELD5_TYPE AS N'TableField5Type',
			LR.TABLE_FIELD6_TYPE AS N'TableField6Type',
			LR.TABLE_FIELD7_TYPE AS N'TableField7Type',
			LR.TABLE_FIELD8_TYPE AS N'TableField8Type',
			LR.TABLE_FIELD9_TYPE AS N'TableField9Type',
			LR.TABLE_FIELD10_TYPE AS N'TableField10Type',			
			@passedWhsVal as N'PassedWhsValue', 
			@passedWhsFld as N'PassedWhsField', 
			N'' AS N'Company', 
			N''  AS N'Warehouse'
		FROM 
			LOOKUP_REFERENCE LR
		WHERE 
			RECORD_TYPE=@recordType
	end 
	