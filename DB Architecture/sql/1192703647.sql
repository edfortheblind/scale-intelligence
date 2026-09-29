-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */



	


CREATE PROCEDURE INV_DeleteArgumentGroup(
	@groupId nvarchar(32))
AS
	SET NOCOUNT ON;

	DELETE INVENTORY_ARGUMENT
	 WHERE GROUP_ID = @groupId;
	if (@@ERROR <> 0) return -1;

-- [comment omitted]


