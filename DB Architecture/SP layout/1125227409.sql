/*
       Mod Number    | Programmer  | Date        | Modification Description
       -------------------------------------------------------------------- 
       198229        | SAM         | 08/25/16    | Created
       198579        | SAM         | 03/02/17    | Added culture to model
	   198586        | AH          | 03/22/17    | Added @locateAllSec, @locatePendingStatus to model.
	   198586        | AH          | 03/22/17    | Changed locate all security to 21
	   198586        | SAM         | 03/02/17    | Removed ReceivingPreference model
	   198583        | SAM         | 03/02/17    | retrieved locatingheader, receiving preferences, genericconfigdetail
	   198585        | AH          | 04/04/17    | Added Locate security.
	   203854        | AH          | 04/25/17    | Added DefaultLocatingRule in ReceiptWorkbenchModel.
	   202562        | AH          | 05/03/17    | Added cancelCheckinSec,cancelAllCheckinSec.
	   202563        | AH          | 05/09/2017  | Added Un locate securities	   
	   202555        | SAM         | 05/16/2017  | retrieved weightUm
	   202556		 | SAM		   | 05/23/2017  | Added logic for Disposition codes
	   202566		 | AH          | 05/30/17    | Added immediateNeedsSec
	   202553		 | SAM		   | 06/06/2017  | ReceiptWorkbench Lot support.
	   203799        | AH          | 06/08/17    | Added support for verfiy item qc .
	   202564        | AH          | 06/19/17    | Add support to cancel container.
	   207006		 | SAM		   | 06/30/2017  | Added company list
	   202123		 | SAM		   | 07/08/2017  | added print security
	   202294		 | AH		   | 07/03/2017  | added receipt container security
	   209907		 | SAM		   | 07/18/2017  | set initiation to false
	   210930		 | SAM		   | 07/25/2017  | display only active company
	   202123		 | MHM		   | 09/04/17    | Passing internalReceiptNum param.
	   212879		 | MHM		   | 09/06/17    | Defaulting the first record from the Receiving preference dropdown when *default receiving preference in not configured.
	   216086		 | AH		   | 11/22/17    | Updated print securities
	   234753		 | MMM		   | 05/10/19    | Authorized default receiving preference by logged in user.
	   234754		 | MMM		   | 05/21/19	 | Preference list does not need to be authorized, system uses selected value from authorized combo datasource.
*/

CREATE PROCEDURE MetaTrans_ReceiptWorkbench  
@internalreceiptnum numeric(9) = 0,
@username nvarchar(30),
@culture nvarchar(200)
AS
declare @locateAllSec nvarchar(20);
declare @locateSec  nvarchar(20);
declare @cancelCheckinSec  nvarchar(20);
declare @cancelAllCheckinSec  nvarchar(20);
declare @unlocateAllSec  nvarchar(20);
declare @unlocateSec  nvarchar(20);
declare @immediateNeedsSec  nvarchar(20);
declare @cancelContainerSec  nvarchar(20);
declare @deleteSec  nvarchar(20);
declare @useLocUmOverrides nvarchar(20)
declare @printDefaultDocsSec nvarchar(20);
declare @printSelectedDocsSec nvarchar(20);
declare @printPreviewSec nvarchar(20);
declare @newLineSec nvarchar(20);
declare @contSec nvarchar(20);
Declare @receivingPreference nvarchar(25);
Declare @modifyRecPref nvarchar(25);
Declare @printSec nvarchar(25);

select  @locateAllSec =  CheckPointValue  from SECfn_GetSecurityCheckPoint(4038,@username) where checkpointId=21;
select  @locateSec =  CheckPointValue  from SECfn_GetSecurityCheckPoint(4038,@username) where checkpointId=32;
select  @cancelCheckinSec =  CheckPointValue  from SECfn_GetSecurityCheckPoint(4038,@username) where checkpointId=23;
select  @cancelAllCheckinSec =  CheckPointValue  from SECfn_GetSecurityCheckPoint(4038,@username) where checkpointId=24;
select  @unlocateAllSec =  CheckPointValue  from SECfn_GetSecurityCheckPoint(4038,@username) where checkpointId=33;
select  @unlocateSec =  CheckPointValue  from SECfn_GetSecurityCheckPoint(4038,@username) where checkpointId=34;
select  @immediateNeedsSec =  CheckPointValue  from SECfn_GetSecurityCheckPoint(4038,@username) where checkpointId=28;
select  @cancelContainerSec =  CheckPointValue  from SECfn_GetSecurityCheckPoint(4038,@username) where checkpointId=27;
select  @deleteSec =  CheckPointValue  from SECfn_GetSecurityCheckPoint(4038,@username) where checkpointId=29;
select  @printDefaultDocsSec =  CheckPointValue  from SECfn_GetSecurityCheckPoint(4038,@username) where checkpointId=30;
select  @printSelectedDocsSec =  CheckPointValue  from SECfn_GetSecurityCheckPoint(4038,@username) where checkpointId=31;
select  @printPreviewSec =  CheckPointValue  from SECfn_GetSecurityCheckPoint(4038,@username) where checkpointId=26;
select  @printSec =  CheckPointValue  from SECfn_GetSecurityCheckPoint(4038,@username) where checkpointId=25;
select  @modifyRecPref =  CheckPointValue  from SECfn_GetSecurityCheckPoint(4038,@username) where checkpointId=22;
select  @useLocUmOverrides = SYSTEM_VALUE from SYSTEM_CONFIG_DETAIL where  SYS_KEY = N'100' AND record_type = N'Inventory';
select  @newLineSec = CheckPointValue from SECfn_GetSecurityCheckPoint(3035,@username) where checkpointId=2;
select  @contSec = CheckPointValue from SECfn_GetSecurityCheckPoint(3005,@username) where checkpointId=2;

	SELECT RP.* INTO #tempReceivingPreferences
	FROM   RECEIVING_PREFERENCES RP
	LEFT OUTER JOIN RECEIVING_PREFERENCE_USER_AUTHORIZATION RPUA ON RP.PREFERENCE_NAME = RPUA.PREFERENCE_NAME
	WHERE  ACTIVE = N'Y' AND (RP.USER_AUTHORIZATION = N'All' or RPUA.USER_NAME = @username); 

	SET @receivingPreference = (SELECT TOP 1 ISNULL(RECEIVING_PREFERENCE,  N'*Default') FROM USER_PROFILE WHERE [USER_NAME]= @username)
	IF @receivingPreference = N'*Default' AND NOT EXISTS (SELECT TOP 1 1 FROM RECEIVING_PREFERENCES WHERE PREFERENCE_NAME=N'*Default' AND ACTIVE=N'Y')
	   SET @receivingPreference = (SELECT TOP 1 PREFERENCE_NAME FROM #tempReceivingPreferences  ORDER BY PREFERENCE_NAME)


  SELECT
    N'SCALAR' AS N'EntityType',
    N'ReceiptWorkbenchModel' AS N'EntityName',
      case @internalreceiptnum when 0 then N'' else (select Receipt_ID from Receipt_header where Internal_receipt_num=@internalreceiptnum) end as N'ReceiptId',         
      @receivingPreference as ReceivingPreference,
       N'false' as N'Initiation',
       (select isnull(RECEIVING_PREFERENCE,N'*Default') from USER_PROFILE where [USER_NAME]= @username) as DefaultReceivingPreference,
	   N'*Default' as DefaultLocatingRule,
       N'/scale/dist/receiving/ReceiptWorkbench.component.html' as ReceiptWorkbenchTemplate,	
       N'/scale/dist/receiving/partialcheckin.component.html' as PartialCheckinTemplate,	
       N'/scale/dist/catchweight/catchWeight.component.html' as CatchWeightTemplate,
	   N'/scale/dist/verifyInboundQc/verifyInboundQc.component.html' as VerifyInboundQcTemplate,
	   N'/scale/dist/verifyItemUm/verifyItemUm.component.html' as VerifyItemTemplate,
	   N'/scale/dist/LpEntry/lpEntry.component.html' as LpEntryTemplate,
	   N'/scale/dist/putawayGroups/putawayGroups.component.html' as PutawayGroupsTemplate,		
		@culture as Culture,
		N'' WAREHOUSE,
		N'' AS Company,
		@locateAllSec as LocateAllSec,
		@locateSec as LocateSec,
		@cancelCheckinSec  as CancelCheckinSec,
		@cancelAllCheckinSec  as CancelAllCheckinSec,
		@unlocateSec  as UnlocateSec,
		@unlocateAllSec  as UnlocateAllSec,
		@immediateNeedsSec  as ImmediateNeedsSec,
		@cancelContainerSec as CancelContainerSec,
		@deleteSec as DeleteSec,
		@useLocUmOverrides AS UseLocUmOverrides,
		@printDefaultDocsSec as PrintDefaultDocs,
		@printSelectedDocsSec as PrintSelectedDocs,
		@printPreviewSec as PrintPreviewSec,
		@newLineSec as NewLineSec,
		@contSec as ContSec,
		@modifyRecPref as ModifyRecPref,
		@printSec as PrintSec;

SELECT
    N'SCALAR' AS N'EntityType',
    N'PackingModel' AS N'EntityName',
	N'/scale/dist/lotinfo/lotinfo.component.html' as LotInfoTemplate,
	N'/scale/dist/serialInfo/serialNumberEntry.component.html' as SerialInfoTemplate,
	@culture as Culture,
    N'' WAREHOUSE,
    N'' AS Company;

SELECT DISTINCT N'TABLE_ReceivingPrefernces' AS N'EntityType', 
       N'ReceivingPrefernces'       AS N'EntityName', 
       preference_name              AS N'Identifier', 
       description                  AS N'Description', 
       * 
FROM   RECEIVING_PREFERENCES;
 
SELECT N'ID_DESC_TABLE'      AS N'EntityType', 
       N'LocatingRuleHeader' AS N'EntityName', 
       locating_name         AS N'Identifier', 
       description           AS N'Description' 
FROM   locating_rule_header 
WHERE  active = N'Y'; 


SELECT N'TABLE_DispositionCodeGenericConfigDetail'                  AS N'EntityType', 
       N'DispositionCodeGenericConfigDetail' AS N'EntityName', 
       IDENTIFIER, DESCRIPTION, SYS1VALUE,RECORD_TYPE
FROM   generic_config_detail 
WHERE  record_type = N'DISPOSCODE' 
       AND active = N'Y'; 

SELECT N'TABLE_ReasonCodesGenericConfigDetail'                  AS N'EntityType', 
       N'ReasonCodesGenericConfigDetail' AS N'EntityName', 
       IDENTIFIER, DESCRIPTION, SYS3VALUE,RECORD_TYPE
FROM   generic_config_detail 
WHERE  record_type = N'QUAL RC' 
       AND sys1value = N'RECEIVING' 
       AND active = N'Y';

SELECT N'TABLE_FunctionalAreaStatusFlow' AS N'EntityType',
	   N'ContainerStatusFlow' AS N'EntityName',
	   STATUS ,STATUS_NAME,SYSTEM_STS
FROM FUNCTIONAL_AREA_STATUS_FLOW
WHERE FUNCTIONAL_AREA= N'INBOUND';

SELECT N'ID_DESC_TABLE'                  AS N'EntityType', 
       N'WeightUmGenericConfigDetail' AS N'EntityName', 
       identifier                        AS N'Identifier', 
       description                       AS N'Description' 
FROM   generic_config_detail 
WHERE  record_type = N'UMWEIGHT' 
       AND active = N'Y';

SELECT N'ID_DESC_TABLE'                  AS N'EntityType', 
       N'QuantityUmGenericConfigDetail' AS N'EntityName', 
       identifier                        AS N'Identifier', 
       description                       AS N'Description' 
FROM   generic_config_detail 
WHERE  record_type = N'UMQUANTITY' 
       AND active = N'Y';

SELECT N'ID_DESC_TABLE'                  AS N'EntityType',   
       N'CompanyList' AS N'EntityName',   
       COMPANY                        AS N'Identifier',   
       NAME                       AS N'Description'   
FROM   COMPANY WHERE ACTIVE = N'Y'; 