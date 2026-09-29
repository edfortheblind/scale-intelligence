-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */









CREATE PROCEDURE MetaTrans_Dashboard
@username nvarchar(30),
@culture nvarchar(200)
AS

Declare @roundoff numeric(9,0);

declare @inboundActivityCheckpiont varchar(1);
declare @receiptsByTimeCheckpiont varchar(1);
declare @dockToStockCheckpiont varchar(1);
declare @outboundActivityCheckpiont varchar(1);
declare @shipmentsByTimeCheckpiont varchar(1);
declare @ordersThroughputCheckpiont varchar(1);
declare @workActivityCheckpiont varchar(1);
declare @laborActivityCheckpiont varchar(1);
declare @liveTilesCheckpiont varchar(1);
declare @featureEnabled varchar(1);
declare @cognosReportServerURI varchar(max);

SELECT @roundoff = sys1value FROM GENERIC_CONFIG_DETAIL WHERE RECORD_TYPE = N'<literal:1>'and IDENTIFIER = N'<literal:2>'

SELECT @featureEnabled = dbo.fn_GetFeatureEnabled(N'<literal:3>', @username);

SELECT @cognosReportServerURI = SYSTEM_VALUE FROM SYSTEM_CONFIG_DETAIL WHERE RECORD_TYPE = N'<literal:4>'and SYS_KEY = N'<literal:5>';

SELECT * INTO #securityCheckpionts from SECfn_GetSecurityCheckPoint(4046,@username);

select @inboundActivityCheckpiont	= CheckPointValue from #securityCheckpionts where checkpointId=21
select @receiptsByTimeCheckpiont	= CheckPointValue from #securityCheckpionts where checkpointId=22
select @dockToStockCheckpiont		= CheckPointValue from #securityCheckpionts where checkpointId=23
select @outboundActivityCheckpiont	= CheckPointValue from #securityCheckpionts where checkpointId=24
select @shipmentsByTimeCheckpiont	= CheckPointValue from #securityCheckpionts where checkpointId=25
select @ordersThroughputCheckpiont	= CheckPointValue from #securityCheckpionts where checkpointId=26
select @workActivityCheckpiont		= CheckPointValue from #securityCheckpionts where checkpointId=27
select @laborActivityCheckpiont		= CheckPointValue from #securityCheckpionts where checkpointId=28
select @liveTilesCheckpiont			= CheckPointValue from #securityCheckpionts where checkpointId=29

select
    N'<literal:6>' AS N'<literal:7>',
    N'<literal:8>' AS N'<literal:9>',
	N'<literal:10>' as DashboardTemplate,	
	N'<literal:11>' as GadgetSelectorTemplate, 
	@culture as Culture,
	N'<literal:12>' AS Warehouse,
	N'<literal:13>' AS Company,
	@roundoff  AS DecimalConfig,
	@inboundActivityCheckpiont AS ShowInboundActivity, 
	@receiptsByTimeCheckpiont AS ShowReceiptsByTime,
	@dockToStockCheckpiont AS ShowDockToStock,
	@outboundActivityCheckpiont AS ShowOutboundActivity,
	@shipmentsByTimeCheckpiont AS ShowShipmentsByTime,
	@ordersThroughputCheckpiont AS ShowOrdersThroughput,
	@workActivityCheckpiont AS ShowWorkActivity,
	@laborActivityCheckpiont AS ShowLaborActivity,
	@liveTilesCheckpiont AS ShowLiveTiles,
	@featureEnabled AS ShowWidgets,
	N'<literal:14>' as GadgetSelectorCardTemplate,
	N'<literal:15>' as DashboardWidgetTemplate,
	@cognosReportServerURI AS CognosReportServerURI,
	FORMAT(GETDATE(), N'<literal:16>', @culture) AS TodayDate;


select 
	N'<literal:17>' AS N'<literal:18>',
	stmt_detail_key_num AS Id,
	detail_desc as Description, 
	N'<literal:19>' AS Link, 
	dbo.RSCMfn_RtrvResource(N'<literal:20>',N'<literal:21>',@culture) AS Stats,
	N'<literal:22>' AS Loading, 
	N'<literal:23>' AS Error
from DATA_RETRIEVAL_STMT_DETAIL 
where 
	stmt_header_key_num = 10004 and active = N'<literal:24>' 
	and stmt_detail_key_num in (select tile_id from dashboard_tile_access where user_name = @username)
	and N'<literal:25>' = isnull((select checkpointvalue from SECfn_GetSecurityCheckPoint((select form_id from FORM where FORM_KEY_NAME = N'<literal:26>' + detail_desc), @username) where checkpointId = 1), N'<literal:27>');
	
	
	
	
select 
	N'<literal:28>' AS N'<literal:29>',
	WIDGET_ID AS Id,
	WIDGET_ID AS Name,
	WIDGET_DESCRIPTION as Description, 
	URL AS URL, 
	CATEGORY AS Category,
	Is_Default as IsDefault
from DASHBOARD_WIDGETS
where 
	active = N'<literal:30>' 
	and N'<literal:31>' = isnull((select checkpointvalue from SECfn_GetSecurityCheckPoint((select form_id from FORM where FORM_KEY_NAME = N'<literal:32>' + WIDGET_ID), @username) where checkpointId = 1), N'<literal:33>');
	
	
	
	
select 
	N'<literal:34>' AS N'<literal:35>',
	IDENTIFIER AS Id,
	Description as Description 
	from   GENERIC_CONFIG_DETAIL  where RECORD_TYPE =N'<literal:36>'