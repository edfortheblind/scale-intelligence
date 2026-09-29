-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







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
   Active = N'<literal:1>'
WHERE
   object_id =@objectId;
Update
   MAIN_UI_SCREEN
Set
   Active = N'<literal:2>'
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
   Active = N'<literal:3>'
WHERE
   object_id =@objectId;
