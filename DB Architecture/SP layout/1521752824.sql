/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	55738	| VM	| 10/30/25	| Take existing security and forms for config Security Permissions
*/

CREATE PROCEDURE SEC_GetSecurityForms(
	@userName nvarchar(30),
	@culture nvarchar(5),
	@allForms bit,
	@isManhAuthorizedUser bit,
	@restrictedFormIds nvarchar(4000)
)
AS
SET NOCOUNT ON;
BEGIN

-- detect culture
SELECT @culture = COALESCE(NULLIF(@culture, N''), (SELECT SYSTEM_VALUE FROM SYSTEM_CONFIG_DETAIL WHERE SYS_KEY = N'80' AND RECORD_TYPE = N'Technical')) 

-- moving resource language tables outside function, save as prefiltred for faster run.
select RESOURCE_LANGUAGE, RESOURCE_GROUP, RESOURCE_KEY, TEXT INTO #RESOURCE_FILE_CUSTOM from RESOURCE_FILE_CUSTOM where RESOURCE_GROUP=N'Text' and RESOURCE_LANGUAGE =@culture
select RESOURCE_LANGUAGE, RESOURCE_GROUP, RESOURCE_KEY, TEXT INTO #RESOURCE_FILE_BASE from RESOURCE_FILE_BASE where RESOURCE_GROUP=N'Text' and RESOURCE_LANGUAGE =@culture
select RESOURCE_LANGUAGE, RESOURCE_GROUP, RESOURCE_KEY, TEXT INTO #RESOURCE_FILE_BASEen from RESOURCE_FILE_BASE where RESOURCE_GROUP=N'Text' and RESOURCE_LANGUAGE =N'en-US'
create index idx_RESOURCE_FILE_BASE_RESOURCE_KEY on #RESOURCE_FILE_BASE(RESOURCE_KEY)
create index idx_RESOURCE_FILE_BASEen_RESOURCE_KEY on #RESOURCE_FILE_BASEen(RESOURCE_KEY)

--LoadAllFormsWithExistingSecurityPermissions
if @allForms = 1 -- used for adding a new security permission
begin
	-- convert list of string id's to table by table value function
	select VALUE INTO #RESTRICTED_FORMIDS from GENfn_SplitString(@restrictedFormIds,N',')
	
	--moving Parent key form outside search not to be executed for each line
	SELECT FORM_ID into #parentKey FROM FORM WHERE PARENT_KEY_NAME IN (SELECT FORM_KEY_NAME FROM FORM WHERE FORM_ID IN(N'2106',N'2553' )) OR FORM_ID IN ( N'2106',N'2553' )

	-- execute main search and store to temporary table for later be completed with detected resources
	select Form_id, FORM_KEY_NAME, SECURITY_LEVEL, USER_NAME, SEC_VALUES, CHECKPOINTID, CHECKPOINTVALUE, RESOURCEFILEKEY, ASSOCIATED_FORM_KEY, USER_DEF1, USER_DEF2, USER_DEF3, USER_DEF4, USER_DEF5, USER_DEF6, USER_DEF7, USER_DEF8 
	INTO #SecurityPermissionAll
	from  (select form.FORM_ID, FORM_KEY_NAME, SECURITY_LEVEL, USER_NAME, SEC_VALUES , CHECKPOINTID, CHECKPOINTVALUE, (SELECT RESOURCE_FILE_KEY FROM SECURITY_CHECKPOINT SC WHERE SC.CHECK_POINT = F.CHECKPOINTID AND FORM_ID = S.FORM_ID) AS RESOURCEFILEKEY, ASSOCIATED_FORM_KEY, S.USER_DEF1, S.USER_DEF2, S.USER_DEF3, S.USER_DEF4, S.USER_DEF5, S.USER_DEF6, S.USER_DEF7, S.USER_DEF8   
			from FORM 
			left join SECURITY S on form.FORM_ID = s.FORM_ID and s.USER_NAME = @userName
			left join SECfn_GetSecurityCheckPointByUsername(@userName) F on form.FORM_ID = f.Form_Id and(CheckPointValue not in (N'-'))
			where form.SECURITY_ACTIVE = N'Y' 
			and form.FORM_ID NOT IN ( SELECT FORM_ID FROM #parentKey )
			AND (@isManhAuthorizedUser=1 OR Form.Form_Id NOT IN (select VALUE from #RESTRICTED_FORMIDS) )
	) securityPermission  
	where (ASSOCIATED_FORM_KEY is null or FORM_ID = (select max(FORM_ID) from FORM where ASSOCIATED_FORM_KEY = securityPermission.ASSOCIATED_FORM_KEY) ) --takes only max form_id records when the associated_form_key available

	-- fill main search with detected resources
	select Form_id, FORM_KEY_NAME, SECURITY_LEVEL, USER_NAME, SEC_VALUES, CHECKPOINTID, CHECKPOINTVALUE, RESOURCEFILEKEY, ASSOCIATED_FORM_KEY, t.USER_DEF1, t.USER_DEF2, t.USER_DEF3, t.USER_DEF4, t.USER_DEF5, t.USER_DEF6, t.USER_DEF7, t.USER_DEF8 
	,COALESCE(rf1.TEXT, rf2.TEXT, rf3.TEXT, RESOURCEFILEKEY) ResoruceFileText
	,COALESCE(fn1.TEXT, fn2.TEXT, fn3.TEXT, FORM_KEY_NAME) FormName
	from #SecurityPermissionAll t
	left join #RESOURCE_FILE_CUSTOM rf1 on rf1.RESOURCE_KEY=RESOURCEFILEKEY
	left join #RESOURCE_FILE_BASE rf2 on rf2.RESOURCE_KEY=RESOURCEFILEKEY
	left join #RESOURCE_FILE_BASEen rf3 on rf3.RESOURCE_KEY=RESOURCEFILEKEY
	left join #RESOURCE_FILE_CUSTOM fn1 on fn1.RESOURCE_KEY=FORM_KEY_NAME
	left join #RESOURCE_FILE_BASE fn2 on fn2.RESOURCE_KEY=FORM_KEY_NAME
	left join #RESOURCE_FILE_BASEen fn3 on fn3.RESOURCE_KEY=FORM_KEY_NAME
	
	drop table #SecurityPermissionAll
	drop table #RESTRICTED_FORMIDS
	drop table #parentKey
end
else --LoadUserExistingSecurityPermissions, used for editing a security permission
begin
	-- execute main search and store to temporary table for later be completed with detected resources
	select Form_id, FORM_KEY_NAME, SECURITY_LEVEL, USER_NAME, SEC_VALUES, CHECKPOINTID, CHECKPOINTVALUE, RESOURCEFILEKEY, ASSOCIATED_FORM_KEY, USER_DEF1, USER_DEF2, USER_DEF3, USER_DEF4, USER_DEF5, USER_DEF6, USER_DEF7, USER_DEF8 
	INTO #SecurityPermission
	from  (select form.FORM_ID, FORM_KEY_NAME, SECURITY_LEVEL, USER_NAME, SEC_VALUES , CHECKPOINTID, CHECKPOINTVALUE, (SELECT RESOURCE_FILE_KEY FROM SECURITY_CHECKPOINT SC WHERE SC.CHECK_POINT = F.CHECKPOINTID AND FORM_ID = S.FORM_ID) AS RESOURCEFILEKEY, ASSOCIATED_FORM_KEY, S.USER_DEF1, S.USER_DEF2, S.USER_DEF3, S.USER_DEF4, S.USER_DEF5, S.USER_DEF6, S.USER_DEF7, S.USER_DEF8   from SECURITY S LEFT JOIN FORM on s.FORM_ID  = form.FORM_ID, SECfn_GetSecurityCheckPointByUsername(@userName) F   WHERE USER_NAME = @userName AND (CheckPointValue not in (N'-')) AND S.FORM_ID = F.FORM_ID  )  securityPermission
	where (ASSOCIATED_FORM_KEY is null or FORM_ID = (select max(FORM_ID) from FORM where ASSOCIATED_FORM_KEY = securityPermission.ASSOCIATED_FORM_KEY) )

	-- fill main search with detected resources
	select Form_id, FORM_KEY_NAME, SECURITY_LEVEL, USER_NAME, SEC_VALUES, CHECKPOINTID, CHECKPOINTVALUE, RESOURCEFILEKEY, ASSOCIATED_FORM_KEY, t.USER_DEF1, t.USER_DEF2, t.USER_DEF3, t.USER_DEF4, t.USER_DEF5, t.USER_DEF6, t.USER_DEF7, t.USER_DEF8 
	,COALESCE(rf1.TEXT, rf2.TEXT, rf3.TEXT, RESOURCEFILEKEY) ResoruceFileText
	,COALESCE(fn1.TEXT, fn2.TEXT, fn3.TEXT, FORM_KEY_NAME) FormName
	from #SecurityPermission t
	left join #RESOURCE_FILE_CUSTOM rf1 on rf1.RESOURCE_KEY=RESOURCEFILEKEY
	left join #RESOURCE_FILE_BASE rf2 on rf2.RESOURCE_KEY=RESOURCEFILEKEY
	left join #RESOURCE_FILE_BASEen rf3 on rf3.RESOURCE_KEY=RESOURCEFILEKEY
	left join #RESOURCE_FILE_CUSTOM fn1 on fn1.RESOURCE_KEY=FORM_KEY_NAME
	left join #RESOURCE_FILE_BASE fn2 on fn2.RESOURCE_KEY=FORM_KEY_NAME
	left join #RESOURCE_FILE_BASEen fn3 on fn3.RESOURCE_KEY=FORM_KEY_NAME
	drop table #SecurityPermission
end


drop table #RESOURCE_FILE_CUSTOM
drop table #RESOURCE_FILE_BASE
drop table #RESOURCE_FILE_BASEen

END;
