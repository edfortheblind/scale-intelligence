/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	204235	| SO	| 07/07/17	| Created
*/

CREATE PROCEDURE MetaTrans_ManualLaborActivityLog(
	@culture nvarchar(10))

AS
BEGIN
	   SET NOCOUNT ON;

	   SELECT 
	   N'SCALAR' AS N'EntityType',
	   N'ManualLaborActivity' AS N'EntityName',
	   NULL AS N'warehouse',
	   NULL AS N'company',
	   N'' as N'userName',
	   N'' as N'activityType',
	   N'' as N'transactionCount',
	   N'' as N'startDateTime',
	   N'' as N'endDateTime',
	   N'' as N'elapsedTime',
	   N'' as N'userDefinedField1',
	   N'' as N'userDefinedField2',
	   N'' as N'userDefinedField3',
	   N'' as N'userDefinedField4',
	   N'' as N'userDefinedField5',
	   N'' as N'userDefinedField6',
	   0.0 as N'userDefinedField7',
	   0.0 as N'userDefinedField8'	

END
