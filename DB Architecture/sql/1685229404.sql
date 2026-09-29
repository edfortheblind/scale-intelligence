-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */



	

CREATE PROCEDURE PMN_IndexUsage
AS

-- [comment omitted]
SELECT   OBJECT_NAME(IUS.[OBJECT_ID]) AS [OBJECT NAME],
         IND.[NAME] AS [INDEX NAME],
         USER_SEEKS,
         USER_SCANS,
         USER_LOOKUPS,
         USER_UPDATES 
FROM     SYS.DM_DB_INDEX_USAGE_STATS AS ius
         INNER JOIN SYS.INDEXES AS ind
           ON IND.[OBJECT_ID] = IUS.[OBJECT_ID] AND IND.INDEX_ID = IUS.INDEX_ID 
WHERE    OBJECTPROPERTY(IUS.[OBJECT_ID],N'<literal:1>') = 1 
ORDER BY OBJECT_NAME(IUS.[OBJECT_ID])
