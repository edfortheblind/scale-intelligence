/*
	Mod Number	| Programmer	| Date   	| Modification Description
	-------------------------------------------------------------------- 
	185059		| AH			| 11/28/16	| Created.
	180229		| AH			| 12/01/16	| Added Security Checkpoints to the model.
	186999		| SAM			| 12/06/16	| corrected Security Checkpoints.
	192039		| SAM			| 12/12/16  | Added Lot Support
	191839		| AH			| 12/12/16  | Added culture 
	196752      | SAM			| 02/13/17  | Added QCReasonCodesTemplate.
	203506		| SAM			| 04/12/17	| Handled displaying of um drop down during add/view 

*/

CREATE PROCEDURE MetaTrans_ShippingContainerQC
@username nvarchar(30),
@culture nvarchar(200),
@warehouse nvarchar(25)
AS
declare @validateItem nvarchar(100);
declare @blindQcInspection nvarchar(20);
declare @lotverificationReq nvarchar(20);
declare @promptUnknownItem nvarchar(20);
declare @printQcContainerSecurity nvarchar(20);
declare @confirmQcResult nvarchar(20);
declare @fillCountQty nvarchar(20);
declare @scanItemCount nvarchar(20);
declare @forceQcPass nvarchar(20);



select
@blindQcInspection = CASE BLIND_QC When N'Y' then N'true' else N'false' end,
@lotverificationReq = CASE LOT_VERIFICATION_REQ When N'Y' then N'true' else N'false' end,
@promptUnknownItem = CASE PROMPT_UNKNOWN_ITEM When N'Y' then N'true' else N'false' end
from PACKING_PREFERENCES where PREFERENCE_NAME = ( select isnull(PACKING_PREFERENCE,N'*Default') from USER_PROFILE where [USER_NAME]= @userName )

select @printQcContainerSecurity =  CheckPointValue from SECfn_GetSecurityCheckPoint(4005,@username) where checkpointId=34
select @confirmQcResult =  CheckPointValue from SECfn_GetSecurityCheckPoint(4005,@username) where checkpointId=22
select @fillCountQty =  CheckPointValue from SECfn_GetSecurityCheckPoint(4005,@username) where checkpointId=23
select @scanItemCount =  CheckPointValue from SECfn_GetSecurityCheckPoint(4005,@username) where checkpointId=24
select @forceQcPass =  CheckPointValue from SECfn_GetSecurityCheckPoint(4005,@username) where checkpointId=25





select
@validateItem = CASE SYSTEM_VALUE When N'Y' then N'true' else N'false' end
from SYSTEM_CONFIG_DETAIL where  RECORD_TYPE = N'inventory'  AND SYS_KEY = N'110'


  SELECT
    N'SCALAR' AS N'EntityType',
    N'ShippingContainerQCModel' AS N'EntityName',
	@blindQcInspection as BlindQcInspection,
	@lotverificationReq as LotVerificationReq,
	@promptUnknownItem as PromptUnknownItem,
	@validateItem as ValidateItem,
    N'' as N'ContainerId',
	N'true' as N'Initiation',
	N'/scale/dist/qc/shippingContainerQC.component.html' as QCTemplate,
	N'/scale/dist/qc/shippingContainerQCReasonCodes.component.html' as QCReasonCodesTemplate,
	@printQcContainerSecurity as PrintContainerQCSec,
	@confirmQcResult  as ConfirmQcResultSec,
	@fillCountQty as FillCountQtySec, 
	@scanItemCount as ScanItemCountSec,
	@warehouse  as Warehouse,
	@forceQcPass as ForceQcPassSec,
    N'' AS Company,
	@culture as Culture

	
select 
N'TABLE_ReasonCodes' AS N'EntityType',
Description,Identifier from GENERIC_CONFIG_DETAIL where sys1value =N'20' and RECORD_TYPE = N'QUAL RC';

SELECT N'ID_DESC_TABLE'      AS N'EntityType', 
       N'UnitOfMeasure' AS N'EntityName', 
       IDENTIFIER         AS N'Identifier', 
       description           AS N'Description' 
FROM   generic_CONFIG_DETAIL 
WHERE  RECORD_TYPE = N'UMQUANTITY';



