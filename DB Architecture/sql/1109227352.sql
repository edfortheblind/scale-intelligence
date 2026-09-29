-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */















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
@validateItem = CASE VALIDATE_ITEM When N'<literal:1>' then N'<literal:2>' else N'<literal:3>' end,
@verifyContainer = CASE VERIFY_CONTAINER_ID When N'<literal:4>' then N'<literal:5>' else N'<literal:6>' end,
@isManualAssignContainer = CASE CONTAINER_ASSIGNMENT_METHOD When N'<literal:7>' then N'<literal:8>' else N'<literal:9>' end,
@allowOverPack = CASE ALLOW_OVER_PACKING When N'<literal:10>' then N'<literal:11>' else N'<literal:12>' end,
@isQtyEntryRequired = CASE DEFAULT_QTY_FROM When N'<literal:13>' then N'<literal:14>' else N'<literal:15>' end,
@autoPrintAtClose =  AUTO_PRINT_AT_CLOSE 
from PACKING_PREFERENCES where PREFERENCE_NAME = ( select isnull(PACKING_PREFERENCE,N'<literal:16>') from USER_PROFILE where [USER_NAME]= @userName )

select @closeContainerSecurity= CheckPointValue from SECfn_GetSecurityCheckPoint(73,@username) where checkpointId=1
select @printpackingContainerSecurity =  CheckPointValue from SECfn_GetSecurityCheckPoint(31,@username) where checkpointId=1

	SELECT
    N'<literal:17>' AS N'<literal:18>',
    N'<literal:19>' AS N'<literal:20>',
	dbo.RSCMfn_RtrvResource(@packingId,N'<literal:21>',@culture) as N'<literal:22>',
	@verifyContainer as VerifyContainerId,
	@validateItem as ValidateItem,
	@isManualAssignContainer as IsManualAssign,
	@allowOverPack as AllowOverPack,
	@isQtyEntryRequired as QtyEntryRequired,
	@autoPrintAtClose as AutoPrintAtClose,
	N'<literal:23>' as N'<literal:24>',
	N'<literal:25>' as N'<literal:26>',
	N'<literal:27>' as N'<literal:28>',
	@packingId as N'<literal:29>',
	N'<literal:30>' as PackingTemplate,
	N'<literal:31>' as LotInfoTemplate,
	N'<literal:32>' as SerialInfoTemplate,
	@closeContainerSecurity as CloseContainerSec,
	@printpackingContainerSecurity as PrintContainerSec,
	@culture as Culture,
    N'<literal:33>' WAREHOUSE,
    N'<literal:34>' AS Company

select 
N'<literal:35>' AS N'<literal:36>',
Description,Identifier from GENERIC_CONFIG_DETAIL where sys1value =N'<literal:37>' and @allowOverPack =N'<literal:38>';

SELECT N'<literal:39>'                  AS N'<literal:40>', 
       N'<literal:41>' AS N'<literal:42>', 
       identifier                        AS N'<literal:43>', 
       description                       AS N'<literal:44>' 
FROM   generic_config_detail 
WHERE  record_type = N'<literal:45>' 
       AND active = N'<literal:46>';

