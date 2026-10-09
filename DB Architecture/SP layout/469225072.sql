/*
       Mod Number    | Programmer  | Date        | Modification Description
       -------------------------------------------------------------------- 
       200919        | RJR         | 03/28/17    | Created
	   203942		 | RJR		   | 05/05/17	 | Updated for tile support. 
	   203962		 | RJR		   | 05/25/17	 | Allow users to pick the tiles they want. 
	   224086		 | AH		   | 05/08/18    | Added DecimalConfig
	   219661		 | MMM		   | 05/14/18    | Returned security checkpionts as part of dashboard model
*/

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

SELECT @roundoff = sys1value FROM GENERIC_CONFIG_DETAIL WHERE RECORD_TYPE = N'DECIMALPOS'and IDENTIFIER = N'70'

SELECT @featureEnabled = dbo.fn_GetFeatureEnabled(N'FEATURE_48197_NEW_WAREHOUSE_DASHBOARD', @username);

SELECT @cognosReportServerURI = SYSTEM_VALUE FROM SYSTEM_CONFIG_DETAIL WHERE RECORD_TYPE = N'Technical'and SYS_KEY = N'630';

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
    N'SCALAR' AS N'EntityType',
    N'DashboardModel' AS N'EntityName',
	N'/scale/dist/dashboard/dashboard.component.html' as DashboardTemplate,	
	N'/scale/dist/dashboard/dashboardGadgetSelector.component.html' as GadgetSelectorTemplate, 
	@culture as Culture,
	N'' AS Warehouse,
	N'' AS Company,
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
	N'/scale/dist/dashboard/dashboardGadgetCardSelector.component.html' as GadgetSelectorCardTemplate,
	N'/scale/dist/dashboard/dashboardWidget.component.html' as DashboardWidgetTemplate,
	@cognosReportServerURI AS CognosReportServerURI,
	FORMAT(GETDATE(), N'd', @culture) AS TodayDate;


select 
	N'TABLE_Tiles' AS N'EntityType',
	stmt_detail_key_num AS Id,
	detail_desc as Description, 
	N'' AS Link, 
	dbo.RSCMfn_RtrvResource(N'LOADING',N'Text',@culture) AS Stats,
	N'true' AS Loading, 
	N'false' AS Error
from DATA_RETRIEVAL_STMT_DETAIL 
where 
	stmt_header_key_num = 10004 and active = N'Y' 
	and stmt_detail_key_num in (select tile_id from dashboard_tile_access where user_name = @username)
	and N'Y' = isnull((select checkpointvalue from SECfn_GetSecurityCheckPoint((select form_id from FORM where FORM_KEY_NAME = N'ACTIONTILE_' + detail_desc), @username) where checkpointId = 1), N'Y');
	
	
	
	
select 
	N'TABLE_Widgets' AS N'EntityType',
	WIDGET_ID AS Id,
	WIDGET_ID AS Name,
	WIDGET_DESCRIPTION as Description, 
	URL AS URL, 
	CATEGORY AS Category,
	Is_Default as IsDefault
from DASHBOARD_WIDGETS
where 
	active = N'Y' 
	and N'Y' = isnull((select checkpointvalue from SECfn_GetSecurityCheckPoint((select form_id from FORM where FORM_KEY_NAME = N'WIDGET_' + WIDGET_ID), @username) where checkpointId = 1), N'Y');
	
	
	
	
select 
	N'TABLE_Categories' AS N'EntityType',
	IDENTIFIER AS Id,
	Description as Description 
	from   GENERIC_CONFIG_DETAIL  where RECORD_TYPE =N'DASHWDGT CT'