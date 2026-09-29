-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */




CREATE PROCEDURE wm_UReceiptInterfaceBatch  
 @BatchId nvarchar(50)
 As
 UPDATE RECEIPT_HEADER set UPLOAD_INTERFACE_BATCH = null  
 where UPLOAD_INTERFACE_BATCH = @BatchId; 

 UPDATE RECEIPT_CONTAINER set UPLOAD_INTERFACE_BATCH = null
 where  UPLOAD_INTERFACE_BATCH = @BatchId;