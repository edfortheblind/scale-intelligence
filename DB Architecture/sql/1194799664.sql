-- DOCUMENTATION ONLY: literals/comments removed; do not execute.



CREATE procedure WRK_UpdateDockWorkCreated(
	@SourceKey numeric(9))
as
	declare @internalContainerNum numeric(9)
	
	update dock_mgmt_work_data
	set work_created = N'<literal:1>'
	where object_id = @SourceKey;
	
	select @internalContainerNum = INTERNAL_CONTAINER_NUM from dock_mgmt_work_data where object_id = @SourceKey;
	 
	exec WRK_UpdateShipContWorkCreated @internalContainerNum;	
	
