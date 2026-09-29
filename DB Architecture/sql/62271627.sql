-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
 /* [comment omitted] */










CREATE PROCEDURE TOOLBOX_SetServerPathValues(@serverPath nvarchar(100))  
AS 
BEGIN
DECLARE @pathSeparator nvarchar(1);

if @serverPath not like N'<literal:1>' AND @serverPath not like N'<literal:2>'
begin
	set @pathSeparator = N'<literal:3>';

	-- [comment omitted]

	-- [comment omitted]
	update system_config_detail
	   set system_value = @serverPath + @pathSeparator + N'<literal:4>'
	 where record_type = N'<literal:5>' and sys_key = N'<literal:6>';
	
	-- [comment omitted]
	update system_config_detail 
	   set system_value = @serverPath  + @pathSeparator +  N'<literal:7>'
	   where record_type = N'<literal:8>' and sys_key = N'<literal:9>';
	 
	-- [comment omitted]
	update system_config_detail
	   set system_value = @serverPath  + @pathSeparator +  N'<literal:10>' + @pathSeparator + N'<literal:11>'
	 where record_type = N'<literal:12>' and sys_key = N'<literal:13>';
	 
	 -- [comment omitted]
	update system_config_detail
	   set system_value = @serverPath  + @pathSeparator +  N'<literal:14>' + @pathSeparator + N'<literal:15>'
	 where record_type = N'<literal:16>' and sys_key = N'<literal:17>';
end
else
begin
	set @pathSeparator = N'<literal:18>';
end

-- [comment omitted]
update system_config_detail
   set system_value = @serverPath  + @pathSeparator +  N'<literal:19>'
 where record_type = N'<literal:20>' and sys_key = N'<literal:21>';

-- [comment omitted]
update system_config_detail
   set system_value = @serverPath  + @pathSeparator +  N'<literal:22>' + @pathSeparator + N'<literal:23>'
 where record_type = N'<literal:24>' and sys_key = N'<literal:25>';

-- [comment omitted]
update system_config_detail
   set system_value = @serverPath  + @pathSeparator +  N'<literal:26>' + @pathSeparator + N'<literal:27>'
 where record_type = N'<literal:28>' and sys_key = N'<literal:29>';

-- [comment omitted]
update system_config_detail
   set system_value = @serverPath  + @pathSeparator +  N'<literal:30>' + @pathSeparator + N'<literal:31>'
 where record_type = N'<literal:32>' and sys_key = N'<literal:33>';

-- [comment omitted]
update system_config_detail
   set system_value = @serverPath  + @pathSeparator +  N'<literal:34>' + @pathSeparator + N'<literal:35>'
 where record_type = N'<literal:36>' and sys_key = N'<literal:37>';

-- [comment omitted]
update system_config_detail
   set system_value = @serverPath  + @pathSeparator +  N'<literal:38>' + @pathSeparator + N'<literal:39>'
 where record_type = N'<literal:40>' and sys_key = N'<literal:41>';

-- [comment omitted]
update system_config_detail 
   set system_value = @serverPath + @pathSeparator + N'<literal:42>' + @pathSeparator + N'<literal:43>' + @pathSeparator + N'<literal:44>'
 where  record_type=N'<literal:45>' and sys_key=N'<literal:46>';

-- [comment omitted]
update system_config_detail
   set system_value = @serverPath  + @pathSeparator +  N'<literal:47>' + @pathSeparator + N'<literal:48>' + @pathSeparator + N'<literal:49>'
 where record_type = N'<literal:50>' and sys_key = N'<literal:51>';

-- [comment omitted]
update system_config_detail
   set system_value = @serverPath  + @pathSeparator +  N'<literal:52>'
 where record_type = N'<literal:53>' and sys_key = N'<literal:54>';

-- [comment omitted]
update system_config_detail 
   set system_value = @serverPath  + @pathSeparator +  N'<literal:55>' 
 where  record_type = N'<literal:56>' and sys_key=N'<literal:57>';

-- [comment omitted]
update system_config_detail
   set system_value = @serverPath  + @pathSeparator +  N'<literal:58>'
 where record_type = N'<literal:59>' and sys_key = N'<literal:60>';

-- [comment omitted]
update system_config_detail
   set system_value = @serverPath  + @pathSeparator +  N'<literal:61>' + @pathSeparator + N'<literal:62>'
 where record_type = N'<literal:63>' and sys_key = N'<literal:64>';

-- [comment omitted]
update system_config_detail
   set system_value = @serverPath  + @pathSeparator +  N'<literal:65>'
 where record_type = N'<literal:66>' and sys_key = N'<literal:67>';

-- [comment omitted]
update system_config_detail
   set system_value = @serverPath  + @pathSeparator +  N'<literal:68>' + @pathSeparator + N'<literal:69>'
 where record_type = N'<literal:70>' and sys_key = N'<literal:71>';

update system_config_detail 
   set system_value = @serverPath  + @pathSeparator +  N'<literal:72>' + @pathSeparator + N'<literal:73>' 
   where record_type = N'<literal:74>' and sys_key = N'<literal:75>';

-- [comment omitted]
update system_config_detail
   set system_value = @serverPath  + @pathSeparator +  N'<literal:76>'
 where record_type = N'<literal:77>' and sys_key = N'<literal:78>';

 -- [comment omitted]
update system_config_detail
   set system_value = @serverPath  + @pathSeparator +  N'<literal:79>'
 where record_type = N'<literal:80>' and sys_key = N'<literal:81>';

-- [comment omitted]
update system_config_detail
   set system_value = @serverPath  + @pathSeparator +  N'<literal:82>'
 where record_type = N'<literal:83>' and sys_key = N'<literal:84>';

 -- [comment omitted]
 update warehouse
   set SSRS_PDF_DIRECTORY = @serverPath  + @pathSeparator +  N'<literal:85>' + @pathSeparator + N'<literal:86>';

-- [comment omitted]
update system_config_detail
	set system_value = @serverPath  + @pathSeparator + N'<literal:87>' + @pathSeparator + N'<literal:88>'
	where record_type = N'<literal:89>' and sys_key = N'<literal:90>';

-- [comment omitted]
update system_config_detail 
	set system_value = @serverPath + @pathSeparator + N'<literal:91>' + @pathSeparator + N'<literal:92>'
	where  record_type=N'<literal:93>' and sys_key=N'<literal:94>';

-- [comment omitted]
update system_config_detail   
 set system_value = @serverPath + @pathSeparator + N'<literal:95>' + @pathSeparator + N'<literal:96>'  
 where  record_type=N'<literal:97>' and sys_key=N'<literal:98>'; 
   
END
