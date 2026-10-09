/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	153124	  	| MDL   	| 02/05/15	| Created.

	activate customize screen and deactivate base
*/

CREATE PROCEDURE META_ActivateCustomizeScreen(@objectId numeric(9))  As declare @formid numeric(5);
Select
   @formId = Form_Id
from
   MAIN_UI_SCREEN
where
   object_id =@objectId;
Update
   MAIN_UI_SCREEN
Set
   Active = N'P'
WHERE
   object_id =@objectId;
Update
   MAIN_UI_SCREEN
Set
   Active = N'N'
WHERE
   Object_id = (
      select
         object_id
      from
         main_ui_screen
      where
         form_id = @formId
         and object_id != @objectId
   ) ;
Update
   MAIN_UI_SCREEN
Set
   Active = N'Y'
WHERE
   object_id =@objectId;
