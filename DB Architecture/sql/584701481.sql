-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
CREATE PROCEDURE DIM_InsightDetailPaneData
(
	@msgID numeric(9), 
	@culture nvarchar(10)
)  
AS 
BEGIN

SELECT top 1 N'<literal:1>' AS SCALAR,
	DIM.MSG_ID as  MsgID,
	DIM.STATUS as Status
FROM DIF_INCOMING_MESSAGE DIM
WHERE MSG_ID= @msgID;

END


