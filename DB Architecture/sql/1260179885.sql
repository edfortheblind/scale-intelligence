-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
CREATE Procedure CheckSecurityPermission
as
begin

 -- [comment omitted]
 
 Create Table tempSecurityCheck
 (Action nvarchar(100), oldFormId int, oldCheckpoints nvarchar(10),oldCheckpointNames NVARCHAR(MAX), 
 newFormId int,newCheckpointNames NVARCHAR(MAX), newCheckpoints nvarchar(10));
	 insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'<literal:1>', 3041, N'<literal:2>', 4103, N'<literal:3>');
	 insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'<literal:4>', 3064, N'<literal:5>', 3001, N'<literal:6>');
	 insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'<literal:7>', 3064, N'<literal:8>', 3001, N'<literal:9>');
	 insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'<literal:10>', 4007, N'<literal:11>', 3001, N'<literal:12>');
	 insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'<literal:13>', 4038, N'<literal:14>', 3001, N'<literal:15>');
	  insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'<literal:16>', 3081, N'<literal:17>', 3001, N'<literal:18>');
	  insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'<literal:19>', 2757, N'<literal:20>', 3033, N'<literal:21>');
	  insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'<literal:22>', 2772, N'<literal:23>', 3033, N'<literal:24>');
	  insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'<literal:25>', 4048, N'<literal:26>', 3033, N'<literal:27>');
	  insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'<literal:28>', 3064, N'<literal:29>', 3033, N'<literal:30>');
	  insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'<literal:31>', 3039, N'<literal:32>', 3033, N'<literal:33>');
	  insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'<literal:34>', 4090, N'<literal:35>', 3033, N'<literal:36>');
	  insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'<literal:37>', 4056, N'<literal:38>', 3033, N'<literal:39>');
	  insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'<literal:40>', 2757, N'<literal:41>', 3033, N'<literal:42>');
	  insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'<literal:43>', 2757, N'<literal:44>', 3033, N'<literal:45>');
	  insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'<literal:46>', 4038, N'<literal:47>', 3034, N'<literal:48>');
	  insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'<literal:49>', 3011, N'<literal:50>', 2760, N'<literal:51>');
	  insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'<literal:52>', 3042, N'<literal:53>', 2760, N'<literal:54>');
	  insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'<literal:55>', 4005, N'<literal:56>', 3020, N'<literal:57>');
 WITH OldCheckpoints AS (
    SELECT t.Action, t.oldFormId, STRING_AGG(dbo.RSCMfn_RtrvResource(scp.RESOURCE_FILE_KEY,N'<literal:58>',N'<literal:59>'), N'<literal:60>') AS oldCheckpointNames
    FROM tempSecurityCheck t
    CROSS APPLY STRING_SPLIT(t.oldCheckpoints, N'<literal:61>') AS splitIds
    JOIN Security_Checkpoint scp ON scp.CHECK_POINT = TRY_CAST(splitIds.value AS INT)
	and scp.FORM_ID = t.oldFormId
    GROUP BY t.Action, t.oldFormId
),
NewCheckpoints AS (
    SELECT t.Action, t.newFormId, STRING_AGG(dbo.RSCMfn_RtrvResource(scp.RESOURCE_FILE_KEY,N'<literal:62>',N'<literal:63>'), N'<literal:64>') AS newCheckpointNames
    FROM tempSecurityCheck t
    CROSS APPLY STRING_SPLIT(t.newCheckpoints, N'<literal:65>') AS splitIds
    JOIN Security_Checkpoint scp ON scp.CHECK_POINT = TRY_CAST(splitIds.value AS INT)
	and scp.FORM_ID = t.newFormId
    GROUP BY t.Action, t.newFormId
)

UPDATE t
SET t.oldCheckpointNames = o.oldCheckpointNames,
    t.newCheckpointNames = n.newCheckpointNames
FROM tempSecurityCheck t
LEFT JOIN OldCheckpoints o ON t.Action = o.Action AND t.oldFormId = o.oldFormId
LEFT JOIN NewCheckpoints n ON t.Action = n.Action AND t.newFormId = n.newFormId;


WITH SecurityCheck AS (
-- [comment omitted]
    SELECT 
        T.Action, 
        T.oldFormId as N'<literal:66>',
		dbo.RSCMfn_RtrvResource(fOld.Form_Key_Name,N'<literal:67>',N'<literal:68>') as N'<literal:69>',
		T.oldCheckpoints as N'<literal:70>', 
		T.oldCheckpointNames as N'<literal:71>',
        T.newFormId as N'<literal:72>',dbo.RSCMfn_RtrvResource(fNew.Form_Key_Name,N'<literal:73>',N'<literal:74>') as N'<literal:75>',
		T.newCheckpoints as N'<literal:76>',
		T.newCheckpointNames as N'<literal:77>',
        UP.user_name AS N'<literal:78>',
        N'<literal:79>' AS N'<literal:80>'
    FROM user_profile UP
    CROSS JOIN tempSecurityCheck T
	inner join Form fOld on T.oldFormId = fOld.Form_Id
	inner join Form fNew on T.newFormId = fNew.Form_Id
    WHERE dbo.SecurityPermissionEnabled(UP.user_name, T.oldFormId, T.oldCheckpoints) = 1
    AND dbo.SecurityPermissionEnabled(UP.user_name, T.newFormId, T.newCheckpoints) = 0
	AND UP.USER_NAME <> N'<literal:81>'

    UNION ALL
-- [comment omitted]
    SELECT 
        T.Action, 
        T.oldFormId as N'<literal:82>',
		dbo.RSCMfn_RtrvResource(fOld.Form_Key_Name,N'<literal:83>',N'<literal:84>') as N'<literal:85>',
		T.oldCheckpoints as N'<literal:86>', 
		T.oldCheckpointNames as N'<literal:87>',
        T.newFormId as N'<literal:88>',dbo.RSCMfn_RtrvResource(fNew.Form_Key_Name,N'<literal:89>',N'<literal:90>') as N'<literal:91>',
		T.newCheckpoints as N'<literal:92>',
		T.newCheckpointNames as N'<literal:93>',
        N'<literal:94>' AS N'<literal:95>',
        N'<literal:96>' AS N'<literal:97>'
    FROM tempSecurityCheck T
	inner join Form fOld on T.oldFormId = fOld.Form_Id
	inner join Form fNew on T.newFormId = fNew.Form_Id
    WHERE dbo.SecurityPermissionEnabled(N'<literal:98>', T.oldFormId, T.oldCheckpoints) = 1
    AND dbo.SecurityPermissionEnabled(N'<literal:99>', T.newFormId, T.newCheckpoints) = 0

    UNION ALL
-- [comment omitted]
    SELECT 
        T.Action, 
         T.oldFormId as N'<literal:100>',
		dbo.RSCMfn_RtrvResource(fOld.Form_Key_Name,N'<literal:101>',N'<literal:102>') as N'<literal:103>',
		T.oldCheckpoints as N'<literal:104>', 
		T.oldCheckpointNames as N'<literal:105>',
        T.newFormId as N'<literal:106>',dbo.RSCMfn_RtrvResource(fNew.Form_Key_Name,N'<literal:107>',N'<literal:108>') as N'<literal:109>',
		T.newCheckpoints as N'<literal:110>',
		T.newCheckpointNames as N'<literal:111>',
        SG.SECURITY_GROUP AS N'<literal:112>',
        N'<literal:113>' AS N'<literal:114>'
    FROM SECURITY_GROUP SG
    CROSS JOIN tempSecurityCheck T
	inner join Form fOld on T.oldFormId = fOld.Form_Id
	inner join Form fNew on T.newFormId = fNew.Form_Id
    WHERE dbo.SecurityPermissionEnabled(SG.SECURITY_GROUP, T.oldFormId, T.oldCheckpoints) = 1
    AND dbo.SecurityPermissionEnabled(SG.SECURITY_GROUP, T.newFormId, T.newCheckpoints) = 0
)
SELECT * FROM SecurityCheck;
drop table tempSecurityCheck
end



