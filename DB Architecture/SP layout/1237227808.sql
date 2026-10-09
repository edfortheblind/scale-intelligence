/*
	Mod Number	| Programmer	| Date   	| Modification Description
	-------------------------------------------------------------------- 
	12936		| SSM			| 08/30/22	| Created.
*/

CREATE PROCEDURE MetaTrans_SinglesPacking @username nvarchar(30), @culture nvarchar(10)
AS
declare @packingId nvarchar(100);

select @packingId = N'WMTOTE'

  SELECT
    N'SCALAR' AS N'EntityType',
    N'PackingModel' AS N'EntityName',
	dbo.RSCMfn_RtrvResource(@packingId,N'Text',@culture) as N'PackingIdText',
	N'' as N'ToteId',
	N'true' as N'Initiation',
	@packingId as N'InitiationField',
	N'/scale/dist/singlesPacking/singlesPacking.component.html' as SingleUnitPackingTemplate,
    N'' WAREHOUSE,
    N'' AS Company,
	@culture as Culture

	