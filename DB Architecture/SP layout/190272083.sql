/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	197238	| DP	| 03/03/17	| Created
	199271	| RS	| 14/03/2017| Added LogoffDateTime.
*/

CREATE PROCEDURE UA_InsightDetailPaneData(@guId nvarchar(100),@culture nvarchar(10))  
AS 
BEGIN

SELECT top 1 N'SCALAR' AS SCALAR,
             UA.USER_TYPE AS UserType,
             UA.USER_NAME AS UserName,
             UA.DEVICE AS Device,
			 UA.LOGOFF_DATE_TIME As LogoffDateTime	 
FROM USER_ACTIVITY UA
WHERE GUID = @guId;


END
