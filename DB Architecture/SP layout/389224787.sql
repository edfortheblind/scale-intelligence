/*
       Mod Number    | Programmer  | Date        | Modification Description
       -------------------------------------------------------------------- 
       224208        | MHM         | 05/23/18    | Created	 
	   216573        | MHM         | 05/25/18    | Modified for company center graphic image.
	   250642        | MHM         | 05/05/20    | Fixed the center image and url issue for the external user.
	   249938        | SKT         | 06/13/20    | Modified to add security for tpm dashboard tiles.
*/

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

IF(@userType=N'External')
 BEGIN
   DECLARE @company NVARCHAR(MAX);
   SELECT @company=COMPANY FROM WEB_USER WHERE WEB_USER=@username;
   IF(@company=N'' OR @company IS NULL)
     BEGIN 
	   	SELECT @companyImage= SYSTEM_VALUE FROM  SYSTEM_CONFIG_DETAIL where SYS_KEY=N'140' AND RECORD_TYPE=N'Web Inq';   
		SELECT @centerImageUrl= SYSTEM_VALUE FROM  SYSTEM_CONFIG_DETAIL where SYS_KEY=N'170' AND RECORD_TYPE=N'Web Inq';   
	 END
   ELSE
    BEGIN	   
		SET @companyImage=(SELECT TOP 1 WEB_HEADER_GRAPHIC_CENTER FROM COMPANY WHERE ACTIVE=N'Y' AND COMPANY =@company);
		SET @centerImageUrl = (SELECT TOP 1 WEB_HEADER_URL_CENTER FROM COMPANY WHERE ACTIVE=N'Y' AND COMPANY =@company);

		IF(@companyImage IS NULL OR @companyImage = N'')  
			BEGIN
				SELECT @companyImage= SYSTEM_VALUE FROM  SYSTEM_CONFIG_DETAIL where SYS_KEY=N'140' AND RECORD_TYPE=N'Web Inq'; 
				SELECT @centerImageUrl= SYSTEM_VALUE FROM  SYSTEM_CONFIG_DETAIL where SYS_KEY=N'170' AND RECORD_TYPE=N'Web Inq';    
			END	   
	 END
 END
ELSE
  BEGIN
	IF ((select COUNT(*) from WEB_USER WHERE WEB_USER=@username AND COMPANY_AUTH=N'ALL') > 0 
		 OR (select COUNT(*) from WEB_USER_COMPANY_ASSIGNMENT where COMPANY IN (SELECT COMPANY FROM COMPANY WHERE ACTIVE=N'Y') AND WEB_USER=@username) > 1)
	BEGIN
		SELECT @companyImage= SYSTEM_VALUE FROM  SYSTEM_CONFIG_DETAIL where SYS_KEY=N'140' AND RECORD_TYPE=N'Web Inq';   
		SELECT @centerImageUrl= SYSTEM_VALUE FROM  SYSTEM_CONFIG_DETAIL where SYS_KEY=N'170' AND RECORD_TYPE=N'Web Inq';   
	END
	ELSE
		BEGIN
			SET @companyImage=(SELECT TOP 1 WEB_HEADER_GRAPHIC_CENTER FROM COMPANY WHERE ACTIVE=N'Y' AND COMPANY IN (SELECT COMPANY FROM WEB_USER_COMPANY_ASSIGNMENT  WHERE WEB_USER=@username));
			SET @centerImageUrl = (SELECT TOP 1 WEB_HEADER_URL_CENTER FROM COMPANY WHERE ACTIVE=N'Y' AND COMPANY IN (SELECT COMPANY FROM WEB_USER_COMPANY_ASSIGNMENT  WHERE WEB_USER=@username));

			IF(@companyImage IS NULL OR @companyImage = N'')  
				BEGIN
					SELECT @companyImage= SYSTEM_VALUE FROM  SYSTEM_CONFIG_DETAIL where SYS_KEY=N'140' AND RECORD_TYPE=N'Web Inq'; 
					SELECT @centerImageUrl= SYSTEM_VALUE FROM  SYSTEM_CONFIG_DETAIL where SYS_KEY=N'170' AND RECORD_TYPE=N'Web Inq';    
				END
			END
  END
  SELECT
    N'SCALAR' AS N'EntityType',
    N'DashboardModel' AS N'EntityName',
	N'/tpm/dist/tpmdashboard/tpmdashboard.component.html' as DashboardTemplate,	
	@culture as Culture,
	N'' AS Warehouse,
	N'' AS Company,
	@companyImage AS CompanyImage,	
	@centerImageUrl AS CenterImageUrl,
	N'ManhattanSCALE.png' AS TpmDashboardManhattanSCALE,
	@tpmOrderEntryCheckpoint AS ShowTpmOrderEntry,
	@tpmOrderStatusCheckpoint AS ShowTpmOrderStatus,
	@tpmReceiptEntryCheckpoint AS ShowTpmReceiptEntry,
	@tpmReceiptStatusCheckpoint AS ShowTpmReceiptStatus,
	@tpmPOCheckpoint AS ShowTpmPurchaseOrder,
	@tpmPOStatusCheckpoint AS ShowTpmPurchaseOrderStatus,
	@tpmPersonalViewsCheckpoint AS ShowTpmPersonalViews;