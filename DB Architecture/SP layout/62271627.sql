 /*--Mod Number 	| Programer	| Date	    | Modification Description
 -------------------|-----------|-----------|-------------------------
		169268      | RJR       | 12/01/15  | Created.
		170363		| RJR		| 01/30/16	| Added new system values.
		174701		| SAM       | 03/16/16  | Excluded certain record types that have static content 
		177316		| SAM       | 04/14/16  | Added pathSeparator for Azure and excluded interface xsl config update if azure
		220943		| AS		| 04/20/18  | Moved XSL directories
		233107		| MJ		| 05/21/19	| Update for SRC File Path Technical value.
*/


CREATE PROCEDURE TOOLBOX_SetServerPathValues(@serverPath nvarchar(100))  
AS 
BEGIN
DECLARE @pathSeparator nvarchar(1);

if @serverPath not like N'https:%.file.core.windows.net%' AND @serverPath not like N'https:%.core.chinacloudapi.cn%'
begin
	set @pathSeparator = N'\';

	-- update only for file system as below folders are static

	-- Personal Views default report directory
	update system_config_detail
	   set system_value = @serverPath + @pathSeparator + N'Reporting'
	 where record_type = N'Web Inq' and sys_key = N'80';
	
	-- Workflow Directory
	update system_config_detail 
	   set system_value = @serverPath  + @pathSeparator +  N'Workflow'
	   where record_type = N'Technical' and sys_key = N'350';
	 
	-- Web Services Schemas 
	update system_config_detail
	   set system_value = @serverPath  + @pathSeparator +  N'Schemas' + @pathSeparator + N'Web Services'
	 where record_type = N'Technical' and sys_key = N'510';
	 
	 -- interface Schemas 
	update system_config_detail
	   set system_value = @serverPath  + @pathSeparator +  N'Schemas' + @pathSeparator + N'Interface'
	 where record_type = N'Interface' and sys_key = N'230';
end
else
begin
	set @pathSeparator = N'/';
end

-- Billing Mgmt File Path 
update system_config_detail
   set system_value = @serverPath  + @pathSeparator +  N'BillingMgt'
 where record_type = N'PkCost' and sys_key = N'10';

-- Billing Mgmt Output Path
update system_config_detail
   set system_value = @serverPath  + @pathSeparator +  N'BillingMgt' + @pathSeparator + N'Interfaces'
 where record_type = N'PkCost' and sys_key = N'20';

-- Slotting Upload File Path
update system_config_detail
   set system_value = @serverPath  + @pathSeparator +  N'Slotting' + @pathSeparator + N'Upload'
 where record_type = N'SLOT' and sys_key = N'10';

-- Int Download Input Dir
update system_config_detail
   set system_value = @serverPath  + @pathSeparator +  N'Interface' + @pathSeparator + N'Input'
 where record_type = N'Interface' and sys_key = N'30';

-- Int Download Output Dir
update system_config_detail
   set system_value = @serverPath  + @pathSeparator +  N'Interface' + @pathSeparator + N'Output'
 where record_type = N'Interface' and sys_key = N'40';

-- Int Upload Output Dir
update system_config_detail
   set system_value = @serverPath  + @pathSeparator +  N'Interface' + @pathSeparator + N'Upload'
 where record_type = N'Interface' and sys_key = N'150';

-- Interface Error Original Data Output Directory
update system_config_detail 
   set system_value = @serverPath + @pathSeparator + N'Interface' + @pathSeparator + N'Output' + @pathSeparator + N'Original Data Files'
 where  record_type=N'Interface' and sys_key=N'220';

-- MR File Path
update system_config_detail
   set system_value = @serverPath  + @pathSeparator +  N'Reporting' + @pathSeparator + N'MA Starter Reports' + @pathSeparator + N'SQL Server'
 where record_type = N'Technical' and sys_key = N'100';

-- template file path
update system_config_detail
   set system_value = @serverPath  + @pathSeparator +  N'Printing'
 where record_type = N'Technical' and sys_key = N'170';

-- Personal Alerts
update system_config_detail 
   set system_value = @serverPath  + @pathSeparator +  N'Printing' 
 where  record_type = N'Technical' and sys_key=N'310';

-- Order Directory
update system_config_detail
   set system_value = @serverPath  + @pathSeparator +  N'WebOrder'
 where record_type = N'Web Inq' and sys_key = N'60';

-- Reviewed Order Directory
update system_config_detail
   set system_value = @serverPath  + @pathSeparator +  N'WebOrder' + @pathSeparator + N'Reviewed'
 where record_type = N'Web Inq' and sys_key = N'90';

-- Performance Management Default Documents
update system_config_detail
   set system_value = @serverPath  + @pathSeparator +  N'Performance Management'
 where record_type = N'PERFMAN' and sys_key = N'10';

-- Performance Management Analytics
update system_config_detail
   set system_value = @serverPath  + @pathSeparator +  N'Performance Management' + @pathSeparator + N'Analytics'
 where record_type = N'PERFMAN' and sys_key = N'30';

update system_config_detail 
   set system_value = @serverPath  + @pathSeparator +  N'Reporting' + @pathSeparator + N'SSRS' 
   where record_type = N'Technical' and sys_key = N'380';

--Notification Template Path
update system_config_detail
   set system_value = @serverPath  + @pathSeparator +  N'NotificationTemplate'
 where record_type = N'Technical' and sys_key = N'400';

 --Metadata export directory
update system_config_detail
   set system_value = @serverPath  + @pathSeparator +  N'Export'
 where record_type = N'Technical' and sys_key = N'430';

--SRC File Path
update system_config_detail
   set system_value = @serverPath  + @pathSeparator +  N'Screen Flows'
 where record_type = N'Technical' and sys_key = N'440';

 -- SSRS pdf directory
 update warehouse
   set SSRS_PDF_DIRECTORY = @serverPath  + @pathSeparator +  N'Printing' + @pathSeparator + N'SSRS';

-- Web Stylesheet directory
update system_config_detail
	set system_value = @serverPath  + @pathSeparator + N'TPM' + @pathSeparator + N'xsl'
	where record_type = N'Web Inq' and sys_key = N'120';

-- Interface Stylesheet directory
update system_config_detail 
	set system_value = @serverPath + @pathSeparator + N'Interface' + @pathSeparator + N'xsl'
	where  record_type=N'Interface' and sys_key=N'180';

-- Path for storing captured images
update system_config_detail   
 set system_value = @serverPath + @pathSeparator + N'DocumentStore' + @pathSeparator + N'Images'  
 where  record_type=N'Technical' and sys_key=N'610'; 
   
END
