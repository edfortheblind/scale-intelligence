CREATE PROCEDURE DOM_InsightDetailPaneData
(
	@msgID numeric(9), 
	@culture nvarchar(10)
)  
AS 
BEGIN

SELECT top 1 N'SCALAR' AS SCALAR,
	DOM.MSG_ID as  MsgID,
	DOM.STATUS as Status
FROM DIF_OUTGOING_MESSAGE DOM
WHERE MSG_ID= @msgID;

END


