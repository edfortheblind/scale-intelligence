/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	16129	| MB	| 04/01/05	| Created.

	Returns a rowset used for PickingGroupPickList.rpt.
	
	Parameters:
		parentInstr	The parent instruction number.
		documentType	The document type which will get printed.


	Returns:
		Rowset with a row for each parent instruction and summary information for
		the work instructions corresponding to that parent instruction.

*/
-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;


CREATE PROCEDURE RPT_PickingGroupPickList(
	@GROUP_NUMBER numeric(9),
	@DOCUMENT_TYPE nvarchar(25))

AS
begin
	set nocount on;
	select 
		dtl.Warehouse,
		dtl.launch_num,
		dtl.item,
		dtl.item_Desc,
		dtl.item_Size,
		dtl.item_Color,
		dtl.item_Style,
		dtl.lot,
		cnt.quantity,
		cnt.quantity_um,
		
		case 
			when parentCont.container_type is null
		     	then cnt.container_type
		     	else parentCont.container_type
		end containerType,

		cnt.Group_Num,
		cnt.location,
		cnt.group_position,

		case
			when cnt.Container_type = N'-' 
			then cnt.Quantity 
			else 1 
		end cnvqty,

		case
			when cnt.Container_type = N'-' 
			then cnt.Quantity_Um 
			else cnt.Container_Type 
		end cnvum,

		dbo.RPTfn_GetCommentText(dtl.internal_shipment_num, dtl.internal_shipment_line_num, N'SHIPMENT', @DOCUMENT_TYPE) dtl_comments
	from
		shipping_container cnt

		left outer Join shipping_container parentCont
		on 
			cnt.parent = parentCont.internal_container_num,

		shipment_detail dtl
	where
		cnt.group_num = @GROUP_NUMBER
		and 
		cnt.internal_shipment_line_num = dtl.internal_shipment_line_num
	order by
		cnt.location,
		cnt.group_position 

end -- RPT_OrderPickListDetails



