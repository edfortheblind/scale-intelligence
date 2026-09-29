-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */








CREATE PROCEDURE MetaTpmTrans_Dashboard
@username nvarchar(30),
@culture nvarchar(200)
AS

DECLARE @companyImage NVARCHAR(MAX);
DECLARE @centerImageUrl NVARCHAR(MAX);
DECLARE @userType NVARCHAR(MAX);
DECLARE @checkpointId Numeric(3,0);
DECLARE @tpmOrderEntryCheckpoint varchar(1);
DECLARE @tpmOrderStatusCheckpoint varchar(1);
DECLARE @tpmReceiptEntryCheckpoint varchar(1);
DECLARE @tpmReceiptStatusCheckpoint varchar(1);
DECLARE @tpmPOCheckpoint varchar(1);
DECLARE @tpmPOStatusCheckpoint varchar(1);
DECLARE @tpmPersonalViewsCheckpoint varchar(1);


select @userType=USER_TYPE FROM WEB_USER WHERE WEB_USER=@username;

SELECT * INTO #securityCheckpionts from SECfn_GetSecurityCheckPointByUsername(@username);

SET @checkpointId = 1;

select @tpmOrderEntryCheckpoint	= CheckPointValue from #securityCheckpionts where form_id=4058 and checkpointId=@checkpointId;
select @tpmOrderStatusCheckpoint = CheckPointValue from #securityCheckpionts where form_id=4065 and checkpointId=@checkpointId;
select @tpmReceiptEntryCheckpoint = CheckPointValue from #securityCheckpionts where form_id=4064 and checkpointId=@checkpointId;
select @tpmReceiptStatusCheckpoint = CheckPointValue from #securityCheckpionts where form_id=4072 and checkpointId=@checkpointId;
select @tpmPOCheckpoint	= CheckPointValue from #securityCheckpionts where form_id=4075 and checkpointId=@checkpointId;
select @tpmPOStatusCheckpoint = CheckPointValue from #securityCheckpionts where form_id=4078 and checkpointId=@checkpointId;
select @tpmPersonalViewsCheckpoint = CheckPointValue from #securityCheckpionts where form_id=4063 and checkpointId=@checkpointId;

IF(@userType=N'<literal:1>')
 BEGIN
   DECLARE @company NVARCHAR(MAX);
   SELECT @company=COMPANY FROM WEB_USER WHERE WEB_USER=@username;
   IF(@company=N'<literal:2>' OR @company IS NULL)
     BEGIN 
	   	SELECT @companyImage= SYSTEM_VALUE FROM  SYSTEM_CONFIG_DETAIL where SYS_KEY=N'<literal:3>' AND RECORD_TYPE=N'<literal:4>';   
		SELECT @centerImageUrl= SYSTEM_VALUE FROM  SYSTEM_CONFIG_DETAIL where SYS_KEY=N'<literal:5>' AND RECORD_TYPE=N'<literal:6>';   
	 END
   ELSE
    BEGIN	   
		SET @companyImage=(SELECT TOP 1 WEB_HEADER_GRAPHIC_CENTER FROM COMPANY WHERE ACTIVE=N'<literal:7>' AND COMPANY =@company);
		SET @centerImageUrl = (SELECT TOP 1 WEB_HEADER_URL_CENTER FROM COMPANY WHERE ACTIVE=N'<literal:8>' AND COMPANY =@company);

		IF(@companyImage IS NULL OR @companyImage = N'<literal:9>')  
			BEGIN
				SELECT @companyImage= SYSTEM_VALUE FROM  SYSTEM_CONFIG_DETAIL where SYS_KEY=N'<literal:10>' AND RECORD_TYPE=N'<literal:11>'; 
				SELECT @centerImageUrl= SYSTEM_VALUE FROM  SYSTEM_CONFIG_DETAIL where SYS_KEY=N'<literal:12>' AND RECORD_TYPE=N'<literal:13>';    
			END	   
	 END
 END
ELSE
  BEGIN
	IF ((select COUNT(*) from WEB_USER WHERE WEB_USER=@username AND COMPANY_AUTH=N'<literal:14>') > 0 
		 OR (select COUNT(*) from WEB_USER_COMPANY_ASSIGNMENT where COMPANY IN (SELECT COMPANY FROM COMPANY WHERE ACTIVE=N'<literal:15>') AND WEB_USER=@username) > 1)
	BEGIN
		SELECT @companyImage= SYSTEM_VALUE FROM  SYSTEM_CONFIG_DETAIL where SYS_KEY=N'<literal:16>' AND RECORD_TYPE=N'<literal:17>';   
		SELECT @centerImageUrl= SYSTEM_VALUE FROM  SYSTEM_CONFIG_DETAIL where SYS_KEY=N'<literal:18>' AND RECORD_TYPE=N'<literal:19>';   
	END
	ELSE
		BEGIN
			SET @companyImage=(SELECT TOP 1 WEB_HEADER_GRAPHIC_CENTER FROM COMPANY WHERE ACTIVE=N'<literal:20>' AND COMPANY IN (SELECT COMPANY FROM WEB_USER_COMPANY_ASSIGNMENT  WHERE WEB_USER=@username));
			SET @centerImageUrl = (SELECT TOP 1 WEB_HEADER_URL_CENTER FROM COMPANY WHERE ACTIVE=N'<literal:21>' AND COMPANY IN (SELECT COMPANY FROM WEB_USER_COMPANY_ASSIGNMENT  WHERE WEB_USER=@username));

			IF(@companyImage IS NULL OR @companyImage = N'<literal:22>')  
				BEGIN
					SELECT @companyImage= SYSTEM_VALUE FROM  SYSTEM_CONFIG_DETAIL where SYS_KEY=N'<literal:23>' AND RECORD_TYPE=N'<literal:24>'; 
					SELECT @centerImageUrl= SYSTEM_VALUE FROM  SYSTEM_CONFIG_DETAIL where SYS_KEY=N'<literal:25>' AND RECORD_TYPE=N'<literal:26>';    
				END
			END
  END
  SELECT
    N'<literal:27>' AS N'<literal:28>',
    N'<literal:29>' AS N'<literal:30>',
	N'<literal:31>' as DashboardTemplate,	
	@culture as Culture,
	N'<literal:32>' AS Warehouse,
	N'<literal:33>' AS Company,
	@companyImage AS CompanyImage,	
	@centerImageUrl AS CenterImageUrl,
	N'<literal:34>' AS TpmDashboardManhattanSCALE,
	@tpmOrderEntryCheckpoint AS ShowTpmOrderEntry,
	@tpmOrderStatusCheckpoint AS ShowTpmOrderStatus,
	@tpmReceiptEntryCheckpoint AS ShowTpmReceiptEntry,
	@tpmReceiptStatusCheckpoint AS ShowTpmReceiptStatus,
	@tpmPOCheckpoint AS ShowTpmPurchaseOrder,
	@tpmPOStatusCheckpoint AS ShowTpmPurchaseOrderStatus,
	@tpmPersonalViewsCheckpoint AS ShowTpmPersonalViews;