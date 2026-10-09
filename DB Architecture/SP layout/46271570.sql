/*--Mod Number 	| Programer	| Date	    | Modification Description
 -------------------|-----------|-----------|-------------------------
		169268      | RJR       | 12/01/15  | Created.
		170363		| RJR		| 01/30/16	| Added new system values.
		177712		| SAM		| 05/04/16	| Added AzurePathSupported, IsAzurePath to the select query
		220943		| AS		| 04/20/18  | Moved XSL directories
		233107		| MJ		| 05/21/19	| Update for SRC File Path Technical value.
*/

CREATE PROCEDURE TOOLBOX_GetServerPathValues
AS
    -- Records supporting Azure file storage
    select  1 as N'AzurePathSupported', 
        (CASE WHEN system_value like N'https:%.file.core.windows.net%' OR system_value like N'https:%.core.chinacloudapi.cn%' THEN 1 ELSE 0 end)  as N'IsAzurePath',
        system_value as server_path 
    from 
        system_config_detail 
    where 
        (record_type = N'PkCost' and sys_key in (N'10', N'20')) 
        or (record_type = N'SLOT' and sys_key in (N'10')) 
        or (record_type = N'Interface' and sys_key in (N'30', N'40', N'150', N'220')) 
        or (record_type = N'Technical' and sys_key in (N'100', N'170', N'310', N'380', N'400', N'430',N'440')) 
        or (record_type = N'Web Inq' and sys_key in (N'60', N'90')) 
        or (record_type = N'PERFMAN' and sys_key in (N'10', N'30'))

    union all 

    -- Records supporting Azure file storage
    select 1 as N'AzurePathSupported', 
        (CASE WHEN ssrs_pdf_directory like N'https:%.file.core.windows.net%' OR ssrs_pdf_directory like N'https:%.core.chinacloudapi.cn%' THEN 1 ELSE 0 end)  as N'IsAzurePath',
        ssrs_pdf_directory as server_path
    from 
        warehouse
    where 
        ssrs_pdf_directory is not null
        
    union all

    -- Records that doesnt support Azure file storage
    select  0 as N'AzurePathSupported' ,
        0,
        system_value as server_path 
    from 
        system_config_detail 
    where 
        (record_type = N'Technical' and sys_key in (N'350')) 
        or (record_type = N'Web Inq' and sys_key in (N'80'))
 
	