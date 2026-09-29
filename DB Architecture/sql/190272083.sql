-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE UA_InsightDetailPaneData(@guId nvarchar(100),@culture nvarchar(10))  
AS 
BEGIN

SELECT top 1 N'<literal:1>' AS SCALAR,
             UA.USER_TYPE AS UserType,
             UA.USER_NAME AS UserName,
             UA.DEVICE AS Device,
			 UA.LOGOFF_DATE_TIME As LogoffDateTime	 
FROM USER_ACTIVITY UA
WHERE GUID = @guId;


END
