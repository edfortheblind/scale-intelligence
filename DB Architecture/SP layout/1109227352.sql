/*
	Mod Number	| Programmer	| Date   	| Modification Description
	-------------------------------------------------------------------- 
	185059		| MDL			| 08/25/16	| Created.
	185964		| MDL			| 09/05/16	| Modified to select more fields.
	187802		| MDL			| 09/25/16	| Added security checkpoint.
	185762      | AH            | 11/21/16  | setting isQtyEntryRequired to true if DEFAULT_QTY_FROM is ITEM
	188476      | MDL           | 11/30/16  | Added logic for lot screen.
	191074		| DN			| 01/23/17	| Updated parameter types
	191838      | AH            | 02/07/17  | Added culture to packing model
	201999      | AH            | 04/07/17  | Added InitiationField.
	210997      | AH            | 04/28/17  | Added AutoPrintAtClose to packing model.
	211209      | SAM           | 07/30/17  | added workteam.
	233066		| MMM           | 04/08/19  | Moved container types data fetch logic to Pakcing Get api
*/

CREATE PROCEDURE MetaTrans_Packing @username nvarchar(30), @culture nvarchar(10)
AS
declare @packingId nvarchar(100);
declare @validateItem nvarchar(100);
declare @verifyContainer nvarchar(100);
declare @allowOverPack nvarchar(100);
declare @isManualAssignContainer nvarchar(100);
declare @isQtyEntryRequired nvarchar(20);
declare @autoPrintAtClose nvarchar(20);

declare @closeContainerSecurity nvarchar(20);
declare @printpackingContainerSecurity nvarchar(20);

select @packingId = INITIATION_FIELD  , 
@validateItem = CASE VALIDATE_ITEM When N'Y' then N'true' else N'false' end,
@verifyContainer = CASE VERIFY_CONTAINER_ID When N'Y' then N'true' else N'false' end,
@isManualAssignContainer = CASE CONTAINER_ASSIGNMENT_METHOD When N'System' then N'false' else N'true' end,
@allowOverPack = CASE ALLOW_OVER_PACKING When N'Y' then N'true' else N'false' end,
@isQtyEntryRequired = CASE DEFAULT_QTY_FROM When N'ITEM' then N'true' else N'false' end,
@autoPrintAtClose =  AUTO_PRINT_AT_CLOSE 
from PACKING_PREFERENCES where PREFERENCE_NAME = ( select isnull(PACKING_PREFERENCE,N'*Default') from USER_PROFILE where [USER_NAME]= @userName )

select @closeContainerSecurity= CheckPointValue from SECfn_GetSecurityCheckPoint(73,@username) where checkpointId=1
select @printpackingContainerSecurity =  CheckPointValue from SECfn_GetSecurityCheckPoint(31,@username) where checkpointId=1

	SELECT
    N'SCALAR' AS N'EntityType',
    N'PackingModel' AS N'EntityName',
	dbo.RSCMfn_RtrvResource(@packingId,N'Text',@culture) as N'PackingIdText',
	@verifyContainer as VerifyContainerId,
	@validateItem as ValidateItem,
	@isManualAssignContainer as IsManualAssign,
	@allowOverPack as AllowOverPack,
	@isQtyEntryRequired as QtyEntryRequired,
	@autoPrintAtClose as AutoPrintAtClose,
	N'' as N'PackingId',
	N'' as N'Team',
	N'false' as N'Initiation',
	@packingId as N'InitiationField',
	N'/scale/dist/packing/packing.component.html' as PackingTemplate,
	N'/scale/dist/lotinfo/lotinfo.component.html' as LotInfoTemplate,
	N'/scale/dist/serialInfo/serialNumberEntry.component.html' as SerialInfoTemplate,
	@closeContainerSecurity as CloseContainerSec,
	@printpackingContainerSecurity as PrintContainerSec,
	@culture as Culture,
    N'' WAREHOUSE,
    N'' AS Company

select 
N'TABLE_OverPackReasons' AS N'EntityType',
Description,Identifier from GENERIC_CONFIG_DETAIL where sys1value =N'Packing' and @allowOverPack =N'true';

SELECT N'ID_DESC_TABLE'                  AS N'EntityType', 
       N'WorkTeam' AS N'EntityName', 
       identifier                        AS N'Identifier', 
       description                       AS N'Description' 
FROM   generic_config_detail 
WHERE  record_type = N'WORKTEAM' 
       AND active = N'Y';

