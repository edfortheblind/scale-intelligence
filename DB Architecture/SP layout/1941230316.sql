/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	191732	| DP	| 12/19/16	| Created
	191074	| DN	| 01/23/17	| Updated parameter types
*/

-- Get Data for receipt container which internal convert into JSON and send to client


CREATE PROCEDURE RCPT_ContainerInsightListPaneData(@internalRecContNum numeric(9), @culture nvarchar(10))  
AS 
BEGIN

SELECT top 1 N'SCALAR' AS SCALAR,
    RC.INTERNAL_REC_CONT_NUM AS InternalRecContNum
FROM METADATA_INSIGHT_RECEIPT_CONTAINER_VIEW RC
WHERE INTERNAL_REC_CONT_NUM = @internalRecContNum;

END
