-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE wm_RReceiptContainer02
	@ContainerId nvarchar(25),
	@warehouse nvarchar(25)

AS
   SET NOCOUNT ON
   SELECT RC.* 
	FROM RECEIPT_CONTAINER RC, RECEIPT_HEADER RH    
		WHERE  
				RC.CONTAINER_ID = @ContainerId 
				and RH.INTERNAL_RECEIPT_NUM = RC.INTERNAL_RECEIPT_NUM   
				and RC.RECEIPT_ID = RH.RECEIPT_ID
				and RH.warehouse = IsNull(@warehouse, RH.Warehouse) 
				and RH.CLOSE_DATE is null 
	
