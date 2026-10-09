/*
	Task	| By	| Date			| Modification Description
	-------------------------------------------------
	104233	| MMM	| 26/11/2012	| Created.
	
	This procedure clears the group position and group number from all shipping containers and
	work instructions in the group of specified container
*/	

CREATE PROCEDURE SHP_RemoveContainerGroup (
		@containerId nvarchar(25),
		@warehouse nvarchar(25),
		@user nvarchar(30)
	)
AS

	-- Clear spot or group position from parent containers in the group
	UPDATE	SHIPPING_CONTAINER 
	SET		GROUP_POSITION = 0,
			GROUP_NUM = 0,
			USER_STAMP = @user,
			PROCESS_STAMP = N'SHP_RemoveContainerGroup',
			DATE_TIME_STAMP = GETUTCDATE()
	FROM	SHIPPING_CONTAINER
	WHERE	SHIPPING_CONTAINER.INTERNAL_CONTAINER_NUM IN (
				SELECT	CSC.PARENT
				FROM	SHIPPING_CONTAINER CSC, WORK_INSTRUCTION GWI, WORK_INSTRUCTION WI
				WHERE	WI.CONTAINER_ID = @containerId
					AND WI.FROM_WHS = @warehouse
					AND WI.INSTRUCTION_TYPE = N'DETAIL' 
					AND GWI.GROUP_NUM = WI.GROUP_NUM
					AND GWI.CONDITION <> N'CLOSED'
					AND GWI.INSTRUCTION_TYPE = N'DETAIL' 
					AND CSC.INTERNAL_CONTAINER_NUM = GWI.INTERNAL_CONTAINER_NUM
					AND CSC.PARENT IS NOT NULL)

	-- Clear spot or group position from child containers in the group
	UPDATE 	SHIPPING_CONTAINER
	SET		GROUP_POSITION = 0,
			GROUP_NUM = 0,
			USER_STAMP = @user,
			PROCESS_STAMP = N'SHP_RemoveContainerGroup',
			DATE_TIME_STAMP = GETUTCDATE()
	FROM	SHIPPING_CONTAINER, WORK_INSTRUCTION GWI, WORK_INSTRUCTION WI
	WHERE	WI.CONTAINER_ID = @containerId
				AND WI.FROM_WHS = @warehouse
				AND WI.INSTRUCTION_TYPE = N'DETAIL' 
				AND GWI.GROUP_NUM = WI.GROUP_NUM
				AND GWI.CONDITION <> N'CLOSED'
				AND GWI.INSTRUCTION_TYPE = N'DETAIL' 
				AND SHIPPING_CONTAINER.INTERNAL_CONTAINER_NUM = GWI.INTERNAL_CONTAINER_NUM
				
	-- Clear group number from all work instructions in the group
	UPDATE	WORK_INSTRUCTION
	SET		GROUP_NUM = NULL,
			USER_STAMP = @user,
			PROCESS_STAMP = N'SHP_RemoveContainerGroup',
			DATE_TIME_STAMP = GETUTCDATE()			
	FROM	WORK_INSTRUCTION
	WHERE	WORK_INSTRUCTION.INTERNAL_INSTRUCTION_NUM IN(
				SELECT	DISTINCT GWI.INTERNAL_INSTRUCTION_NUM 
				FROM	WORK_INSTRUCTION GWI, WORK_INSTRUCTION WI
				WHERE	WI.CONTAINER_ID = @containerId
					AND WI.FROM_WHS = @warehouse
					AND WI.INSTRUCTION_TYPE = N'DETAIL' 
					AND GWI.GROUP_NUM = WI.GROUP_NUM
					AND GWI.CONDITION <> N'CLOSED' )
