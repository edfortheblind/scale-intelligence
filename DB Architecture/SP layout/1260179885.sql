CREATE Procedure CheckSecurityPermission
as
begin

 -- create temp table with Checkpoint data
 
 Create Table tempSecurityCheck
 (Action nvarchar(100), oldFormId int, oldCheckpoints nvarchar(10),oldCheckpointNames NVARCHAR(MAX), 
 newFormId int,newCheckpointNames NVARCHAR(MAX), newCheckpoints nvarchar(10));
	 insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'Save image', 3041, N'38,1', 4103, N'1');
	 insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'Finished item breakdown', 3064, N'1', 3001, N'1');
	 insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'Lot change on finished item breakdown', 3064, N'1', 3001, N'1');
	 insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'Lot change on packing', 4007, N'1', 3001, N'1');
	 insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'Lot change on receit workbench', 4038, N'1', 3001, N'1');
	  insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'Lot update', 3081, N'1', 3001, N'1,3');
	  insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'Work confirmation', 2757, N'30', 3033, N'1');
	  insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'Inventory adjustment', 2772, N'1', 3033, N'1');
	  insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'Work order confirmation', 4048, N'1', 3033, N'1');
	  insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'Finished item breakdown', 3064, N'1', 3033, N'1');
	  insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'Cycle count reconcile', 3039, N'1', 3033, N'1');
	  insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'Company transfer', 4090, N'1', 3033, N'1');
	  insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'Status change', 4056, N'1', 3033, N'1');
	  insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'Override pick', 2757, N'35', 3033, N'1');
	  insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'Override putaway', 2757, N'37', 3033, N'1');
	  insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'Receipt workbench', 4038, N'1', 3034, N'1');
	  insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'Transfer container', 3011, N'1', 2760, N'1');
	  insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'Transfer shipment line', 3042, N'1', 2760, N'1');
	  insert into tempSecurityCheck(Action,oldFormId,oldCheckpoints,newFormId,newCheckpoints) values (N'Container QC', 4005, N'1', 3020, N'1');
 WITH OldCheckpoints AS (
    SELECT t.Action, t.oldFormId, STRING_AGG(dbo.RSCMfn_RtrvResource(scp.RESOURCE_FILE_KEY,N'Text',N'en-US'), N', ') AS oldCheckpointNames
    FROM tempSecurityCheck t
    CROSS APPLY STRING_SPLIT(t.oldCheckpoints, N',') AS splitIds
    JOIN Security_Checkpoint scp ON scp.CHECK_POINT = TRY_CAST(splitIds.value AS INT)
	and scp.FORM_ID = t.oldFormId
    GROUP BY t.Action, t.oldFormId
),
NewCheckpoints AS (
    SELECT t.Action, t.newFormId, STRING_AGG(dbo.RSCMfn_RtrvResource(scp.RESOURCE_FILE_KEY,N'Text',N'en-US'), N', ') AS newCheckpointNames
    FROM tempSecurityCheck t
    CROSS APPLY STRING_SPLIT(t.newCheckpoints, N',') AS splitIds
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
--First check User level
    SELECT 
        T.Action, 
        T.oldFormId as N'Previous Form Id',
		dbo.RSCMfn_RtrvResource(fOld.Form_Key_Name,N'Text',N'en-US') as N'Previous Form name',
		T.oldCheckpoints as N'Previous Check points', 
		T.oldCheckpointNames as N'Previous Check point names',
        T.newFormId as N'New Form Id',dbo.RSCMfn_RtrvResource(fNew.Form_Key_Name,N'Text',N'en-US') as N'New Form name',
		T.newCheckpoints as N'New Check points',
		T.newCheckpointNames as N'New Check point names',
        UP.user_name AS N'Entity Name',
        N'User' AS N'Entity Type'
    FROM user_profile UP
    CROSS JOIN tempSecurityCheck T
	inner join Form fOld on T.oldFormId = fOld.Form_Id
	inner join Form fNew on T.newFormId = fNew.Form_Id
    WHERE dbo.SecurityPermissionEnabled(UP.user_name, T.oldFormId, T.oldCheckpoints) = 1
    AND dbo.SecurityPermissionEnabled(UP.user_name, T.newFormId, T.newCheckpoints) = 0
	AND UP.USER_NAME <> N'System'

    UNION ALL
-- check System level
    SELECT 
        T.Action, 
        T.oldFormId as N'Previous Form Id',
		dbo.RSCMfn_RtrvResource(fOld.Form_Key_Name,N'Text',N'en-US') as N'Previous Form name',
		T.oldCheckpoints as N'Previous Check points', 
		T.oldCheckpointNames as N'Previous Check point names',
        T.newFormId as N'New Form Id',dbo.RSCMfn_RtrvResource(fNew.Form_Key_Name,N'Text',N'en-US') as N'New Form name',
		T.newCheckpoints as N'New Check points',
		T.newCheckpointNames as N'New Check point names',
        N'System' AS N'Entity Name',
        N'System' AS N'Entity Type'
    FROM tempSecurityCheck T
	inner join Form fOld on T.oldFormId = fOld.Form_Id
	inner join Form fNew on T.newFormId = fNew.Form_Id
    WHERE dbo.SecurityPermissionEnabled(N'System', T.oldFormId, T.oldCheckpoints) = 1
    AND dbo.SecurityPermissionEnabled(N'System', T.newFormId, T.newCheckpoints) = 0

    UNION ALL
-- check Group level
    SELECT 
        T.Action, 
         T.oldFormId as N'Previous Form Id',
		dbo.RSCMfn_RtrvResource(fOld.Form_Key_Name,N'Text',N'en-US') as N'Previous Form name',
		T.oldCheckpoints as N'Previous Check points', 
		T.oldCheckpointNames as N'Previous Check point names',
        T.newFormId as N'New Form Id',dbo.RSCMfn_RtrvResource(fNew.Form_Key_Name,N'Text',N'en-US') as N'New Form name',
		T.newCheckpoints as N'New Check points',
		T.newCheckpointNames as N'New Check point names',
        SG.SECURITY_GROUP AS N'Entity Name',
        N'Group' AS N'Entity Type'
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



