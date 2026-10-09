/*
	Mod Number	| Programmer	| Date   	| Modification Description
	178075		| MDL		| 06/01/16	| Created.
	178076      | KSS       | 06/13/16  | BreadCrumbUrl added
	178078      | KSS       | 06/13/16  | ChartArea added
	180058		| RJR		| 06/29/16	| Added culture parameter.
	

	Return Model for Monitoring screen builder
	
	Parameters
		internalFormId .
*/	

CREATE PROCEDURE MetaTrans_GetMonitoringBuilderModel(
@internalFormId numeric(5), @culture nvarchar(10))

AS
	SET NOCOUNT ON;

	--company and warehouse are required to check on access
	SELECT N'SCALAR' AS N'EntityType',
	N'Form' AS N'EntityName', 
	case when @internalFormId = 0 then (select max(form_Id)+1 from form) else @internalFormId end AS N'FormId',
	N'' AS N'FormKeyName', 
	N'' AS N'Warehouse', 
	N'' AS N'Company';

	SELECT N'SCALAR' AS N'EntityType',
	N'MainUiScreen' AS N'EntityName',
	N'' AS N'FunctionalArea';


	SELECT N'SCALAR' AS N'EntityType',
	N'ActionsBar' AS N'EntityName',
	N'' AS N'jumpToInsight';

	SELECT N'SCALAR' AS N'EntityType',
	N'ChartArea' AS N'EntityName',
	N'' AS N'DataBinding',
	N'' AS N'drilldownToInsight',
	N'' AS N'InsightCriteria',
	N'' AS N'StoredProcedure';

	SELECT N'SCALAR' AS N'EntityType',
	N'IndicatorTile' AS N'EntityName',
	N'' AS N'StoredProcedure';



