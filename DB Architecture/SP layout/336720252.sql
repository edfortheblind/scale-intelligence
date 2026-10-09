CREATE procedure DeleteDefaultViewerSettings( 
@formId numeric(5)) as
begin

declare @actionMenuId numeric(9);
	
	if (@formId is null or @formId <= 0)
		return;
		
	select @actionMenuId = ACTION_MENU_ID from VIEWER_TEMPLATE where FORM_ID = @formId;
	
	if (@actionMenuId is null)
		return;
	
	if (@actionMenuId > 0)
	begin
		update VIEWER_TEMPLATE set ACTION_MENU_ID = null where FORM_ID = @formId;
		delete from ACTION_MENU_OPTION where ACTION_MENU_ID = @actionMenuId;
		delete from ACTION_MENU where OBJECT_ID = @actionMenuId;
	end

end