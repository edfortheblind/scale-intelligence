/*
Task    | Programmer | Date    | Description  
 -------|------------|---------------------------------------  
 235874 | SO         | 06/12/19 | Also upload manually closed receipts; break update into three statements
*/
CREATE PROCEDURE wm_UReceiptInterfaceBatch  
 @BatchId nvarchar(50)
 As
 UPDATE RECEIPT_HEADER set UPLOAD_INTERFACE_BATCH = null  
 where UPLOAD_INTERFACE_BATCH = @BatchId; 

 UPDATE RECEIPT_CONTAINER set UPLOAD_INTERFACE_BATCH = null
 where  UPLOAD_INTERFACE_BATCH = @BatchId;