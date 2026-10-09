/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE Rtv_LocationInventoryAttributes   
     @InternalRecContNum numeric(9)
    
AS    
   SET NOCOUNT ON    
   SELECT *    
     FROM LOCATION_INVENTORY_ATTRIBUTES    
 WHERE OBJECT_ID In (Select Loc_Inv_Attributes_Id  from RECEIPT_CONTAINER where INTERNAL_REC_CONT_NUM =  @InternalRecContNum)