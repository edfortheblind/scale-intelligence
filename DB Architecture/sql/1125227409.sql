-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






























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
select  @useLocUmOverrides = SYSTEM_VALUE from SYSTEM_CONFIG_DETAIL where  SYS_KEY = N'<literal:1>' AND record_type = N'<literal:2>';
select  @newLineSec = CheckPointValue from SECfn_GetSecurityCheckPoint(3035,@username) where checkpointId=2;
select  @contSec = CheckPointValue from SECfn_GetSecurityCheckPoint(3005,@username) where checkpointId=2;

	SELECT RP.* INTO #tempReceivingPreferences
	FROM   RECEIVING_PREFERENCES RP
	LEFT OUTER JOIN RECEIVING_PREFERENCE_USER_AUTHORIZATION RPUA ON RP.PREFERENCE_NAME = RPUA.PREFERENCE_NAME
	WHERE  ACTIVE = N'<literal:3>' AND (RP.USER_AUTHORIZATION = N'<literal:4>' or RPUA.USER_NAME = @username); 

	SET @receivingPreference = (SELECT TOP 1 ISNULL(RECEIVING_PREFERENCE,  N'<literal:5>') FROM USER_PROFILE WHERE [USER_NAME]= @username)
	IF @receivingPreference = N'<literal:6>' AND NOT EXISTS (SELECT TOP 1 1 FROM RECEIVING_PREFERENCES WHERE PREFERENCE_NAME=N'<literal:7>' AND ACTIVE=N'<literal:8>')
	   SET @receivingPreference = (SELECT TOP 1 PREFERENCE_NAME FROM #tempReceivingPreferences  ORDER BY PREFERENCE_NAME)


  SELECT
    N'<literal:9>' AS N'<literal:10>',
    N'<literal:11>' AS N'<literal:12>',
      case @internalreceiptnum when 0 then N'<literal:13>' else (select Receipt_ID from Receipt_header where Internal_receipt_num=@internalreceiptnum) end as N'<literal:14>',         
      @receivingPreference as ReceivingPreference,
       N'<literal:15>' as N'<literal:16>',
       (select isnull(RECEIVING_PREFERENCE,N'<literal:17>') from USER_PROFILE where [USER_NAME]= @username) as DefaultReceivingPreference,
	   N'<literal:18>' as DefaultLocatingRule,
       N'<literal:19>' as ReceiptWorkbenchTemplate,	
       N'<literal:20>' as PartialCheckinTemplate,	
       N'<literal:21>' as CatchWeightTemplate,
	   N'<literal:22>' as VerifyInboundQcTemplate,
	   N'<literal:23>' as VerifyItemTemplate,
	   N'<literal:24>' as LpEntryTemplate,
	   N'<literal:25>' as PutawayGroupsTemplate,		
		@culture as Culture,
		N'<literal:26>' WAREHOUSE,
		N'<literal:27>' AS Company,
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
    N'<literal:28>' AS N'<literal:29>',
    N'<literal:30>' AS N'<literal:31>',
	N'<literal:32>' as LotInfoTemplate,
	N'<literal:33>' as SerialInfoTemplate,
	@culture as Culture,
    N'<literal:34>' WAREHOUSE,
    N'<literal:35>' AS Company;

SELECT DISTINCT N'<literal:36>' AS N'<literal:37>', 
       N'<literal:38>'       AS N'<literal:39>', 
       preference_name              AS N'<literal:40>', 
       description                  AS N'<literal:41>', 
       * 
FROM   RECEIVING_PREFERENCES;
 
SELECT N'<literal:42>'      AS N'<literal:43>', 
       N'<literal:44>' AS N'<literal:45>', 
       locating_name         AS N'<literal:46>', 
       description           AS N'<literal:47>' 
FROM   locating_rule_header 
WHERE  active = N'<literal:48>'; 


SELECT N'<literal:49>'                  AS N'<literal:50>', 
       N'<literal:51>' AS N'<literal:52>', 
       IDENTIFIER, DESCRIPTION, SYS1VALUE,RECORD_TYPE
FROM   generic_config_detail 
WHERE  record_type = N'<literal:53>' 
       AND active = N'<literal:54>'; 

SELECT N'<literal:55>'                  AS N'<literal:56>', 
       N'<literal:57>' AS N'<literal:58>', 
       IDENTIFIER, DESCRIPTION, SYS3VALUE,RECORD_TYPE
FROM   generic_config_detail 
WHERE  record_type = N'<literal:59>' 
       AND sys1value = N'<literal:60>' 
       AND active = N'<literal:61>';

SELECT N'<literal:62>' AS N'<literal:63>',
	   N'<literal:64>' AS N'<literal:65>',
	   STATUS ,STATUS_NAME,SYSTEM_STS
FROM FUNCTIONAL_AREA_STATUS_FLOW
WHERE FUNCTIONAL_AREA= N'<literal:66>';

SELECT N'<literal:67>'                  AS N'<literal:68>', 
       N'<literal:69>' AS N'<literal:70>', 
       identifier                        AS N'<literal:71>', 
       description                       AS N'<literal:72>' 
FROM   generic_config_detail 
WHERE  record_type = N'<literal:73>' 
       AND active = N'<literal:74>';

SELECT N'<literal:75>'                  AS N'<literal:76>', 
       N'<literal:77>' AS N'<literal:78>', 
       identifier                        AS N'<literal:79>', 
       description                       AS N'<literal:80>' 
FROM   generic_config_detail 
WHERE  record_type = N'<literal:81>' 
       AND active = N'<literal:82>';

SELECT N'<literal:83>'                  AS N'<literal:84>',   
       N'<literal:85>' AS N'<literal:86>',   
       COMPANY                        AS N'<literal:87>',   
       NAME                       AS N'<literal:88>'   
FROM   COMPANY WHERE ACTIVE = N'<literal:89>'; 