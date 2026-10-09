/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	9211		| RAB			| 05/31/02	| Created.
	9390		| RAB			| 07/26/02	| Modified not to traverse up the ShippingTree.
	9593		| RAB			| 10/09/02	| Modified for standards.
	14473		| TDL			| 04/13/04	| Fixed Apostrophes

	Sets the status of a container, updates any parent
	containers status within the same treeUnit.
	
	Parameters
		int		iIntContNum		The ShippingContainer to update.
		int		iNewSts			The new status.
*/
CREATE PROCEDURE SCB_SetStatus(
	@iIntContNum numeric(9),
	@iNewSts numeric(3))
AS
	SET NOCOUNT ON;

	-- local variables	
	declare @iParent numeric(9);

	-- get information about the current container.
	SELECT @iParent = PARENT
	  FROM SHIPPING_CONTAINER
	 WHERE INTERNAL_CONTAINER_NUM = @iIntContNum;

	-- update the current container.
	UPDATE SHIPPING_CONTAINER
	   SET STATUS = @iNewSts,
		   PROCESS_STAMP = N'SCB_SetStatus',
		   DATE_TIME_STAMP = GETUTCDATE()
	 WHERE INTERNAL_CONTAINER_NUM = @iIntContNum;
	if (@@ERROR <> 0) return -1;
	 
	-- update any parents status up the ShippingContainer tree.
	while (@iParent > 0)
	begin
		-- Parent containers always have the min status of
		-- their children.
		UPDATE SHIPPING_CONTAINER
		   SET STATUS = (SELECT MIN(STATUS) 
						   FROM SHIPPING_CONTAINER
						  WHERE PARENT = @iParent),
			   PROCESS_STAMP = N'SCB_SetStatus',
			   DATE_TIME_STAMP = GETUTCDATE()
		 WHERE INTERNAL_CONTAINER_NUM = @iParent;
		if (@@ERROR <> 0) return -1;
		 
		-- Get the next parent.
		SELECT @iParent = PARENT
		  FROM SHIPPING_CONTAINER
		 WHERE INTERNAL_CONTAINER_NUM = @iParent;
	end; -- end while up ShippingContainer tree.
-- end SCB_SetStatus
