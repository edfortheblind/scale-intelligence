-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */








CREATE PROCEDURE TOOLBOX_GetServerPathValues
AS
    -- [comment omitted]
    select  1 as N'<literal:1>', 
        (CASE WHEN system_value like N'<literal:2>' OR system_value like N'<literal:3>' THEN 1 ELSE 0 end)  as N'<literal:4>',
        system_value as server_path 
    from 
        system_config_detail 
    where 
        (record_type = N'<literal:5>' and sys_key in (N'<literal:6>', N'<literal:7>')) 
        or (record_type = N'<literal:8>' and sys_key in (N'<literal:9>')) 
        or (record_type = N'<literal:10>' and sys_key in (N'<literal:11>', N'<literal:12>', N'<literal:13>', N'<literal:14>')) 
        or (record_type = N'<literal:15>' and sys_key in (N'<literal:16>', N'<literal:17>', N'<literal:18>', N'<literal:19>', N'<literal:20>', N'<literal:21>',N'<literal:22>')) 
        or (record_type = N'<literal:23>' and sys_key in (N'<literal:24>', N'<literal:25>')) 
        or (record_type = N'<literal:26>' and sys_key in (N'<literal:27>', N'<literal:28>'))

    union all 

    -- [comment omitted]
    select 1 as N'<literal:29>', 
        (CASE WHEN ssrs_pdf_directory like N'<literal:30>' OR ssrs_pdf_directory like N'<literal:31>' THEN 1 ELSE 0 end)  as N'<literal:32>',
        ssrs_pdf_directory as server_path
    from 
        warehouse
    where 
        ssrs_pdf_directory is not null
        
    union all

    -- [comment omitted]
    select  0 as N'<literal:33>' ,
        0,
        system_value as server_path 
    from 
        system_config_detail 
    where 
        (record_type = N'<literal:34>' and sys_key in (N'<literal:35>')) 
        or (record_type = N'<literal:36>' and sys_key in (N'<literal:37>'))
 
	