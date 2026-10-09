/*
	Task  | By  | Date     | Modification Description
	-------------------------------------------------
	14842 | RAB	| 09/09/04 | Created.
*/	


CREATE PROCEDURE INV_DeleteArgumentGroup(
	@groupId nvarchar(32))
AS
	SET NOCOUNT ON;

	DELETE INVENTORY_ARGUMENT
	 WHERE GROUP_ID = @groupId;
	if (@@ERROR <> 0) return -1;

-- end 


