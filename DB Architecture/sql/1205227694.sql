-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */












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
@blindQcInspection = CASE BLIND_QC When N'<literal:1>' then N'<literal:2>' else N'<literal:3>' end,
@lotverificationReq = CASE LOT_VERIFICATION_REQ When N'<literal:4>' then N'<literal:5>' else N'<literal:6>' end,
@promptUnknownItem = CASE PROMPT_UNKNOWN_ITEM When N'<literal:7>' then N'<literal:8>' else N'<literal:9>' end
from PACKING_PREFERENCES where PREFERENCE_NAME = ( select isnull(PACKING_PREFERENCE,N'<literal:10>') from USER_PROFILE where [USER_NAME]= @userName )

select @printQcContainerSecurity =  CheckPointValue from SECfn_GetSecurityCheckPoint(4005,@username) where checkpointId=34
select @confirmQcResult =  CheckPointValue from SECfn_GetSecurityCheckPoint(4005,@username) where checkpointId=22
select @fillCountQty =  CheckPointValue from SECfn_GetSecurityCheckPoint(4005,@username) where checkpointId=23
select @scanItemCount =  CheckPointValue from SECfn_GetSecurityCheckPoint(4005,@username) where checkpointId=24
select @forceQcPass =  CheckPointValue from SECfn_GetSecurityCheckPoint(4005,@username) where checkpointId=25





select
@validateItem = CASE SYSTEM_VALUE When N'<literal:11>' then N'<literal:12>' else N'<literal:13>' end
from SYSTEM_CONFIG_DETAIL where  RECORD_TYPE = N'<literal:14>'  AND SYS_KEY = N'<literal:15>'


  SELECT
    N'<literal:16>' AS N'<literal:17>',
    N'<literal:18>' AS N'<literal:19>',
	@blindQcInspection as BlindQcInspection,
	@lotverificationReq as LotVerificationReq,
	@promptUnknownItem as PromptUnknownItem,
	@validateItem as ValidateItem,
    N'<literal:20>' as N'<literal:21>',
	N'<literal:22>' as N'<literal:23>',
	N'<literal:24>' as QCTemplate,
	N'<literal:25>' as QCReasonCodesTemplate,
	@printQcContainerSecurity as PrintContainerQCSec,
	@confirmQcResult  as ConfirmQcResultSec,
	@fillCountQty as FillCountQtySec, 
	@scanItemCount as ScanItemCountSec,
	@warehouse  as Warehouse,
	@forceQcPass as ForceQcPassSec,
    N'<literal:26>' AS Company,
	@culture as Culture

	
select 
N'<literal:27>' AS N'<literal:28>',
Description,Identifier from GENERIC_CONFIG_DETAIL where sys1value =N'<literal:29>' and RECORD_TYPE = N'<literal:30>';

SELECT N'<literal:31>'      AS N'<literal:32>', 
       N'<literal:33>' AS N'<literal:34>', 
       IDENTIFIER         AS N'<literal:35>', 
       description           AS N'<literal:36>' 
FROM   generic_CONFIG_DETAIL 
WHERE  RECORD_TYPE = N'<literal:37>';



