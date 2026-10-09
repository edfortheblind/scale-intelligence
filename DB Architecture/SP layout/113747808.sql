/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	16123	| MB	| 03/24/05	| Created.

	Returns a rowset used for the header of RPT_ContPutawayListDetails.
		
*/

-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;


CREATE PROCEDURE RPT_ContPutawayListDetails(
	@INTERNAL_REC_CONT_NUM numeric(9))

AS
begin
	set nocount on;
	select 
		rc.converted_loc_qty as Quantity,
		rc.converted_qty_um as Quantity_UM,
		rc.quantity as BaseQuantity,
		rc.quantity_um as BaseQuantity_UM,
		rc.TO_LOCATION,
		rc.CONTAINER_ID,
		rc.STATUS_FAILED,
		rd.ITEM,
		rd.ITEM_DESC,
		rd.ITEM_SIZE,
		rd.ITEM_COLOR,
		rd.ITEM_STYLE,
		rc.LOT,
		rd.USER_DEF1 dtldef1,
		rd.USER_DEF2 dtldef2,
		rd.USER_DEF3 dtldef3,
		rd.USER_DEF4 dtldef4,
		rd.USER_DEF5 dtldef5,
		rd.USER_DEF6 dtldef6,
		rd.USER_DEF7 dtldef7,
		rd.USER_DEF8 dtldef8,
		rc.USER_DEF1 dtlcontdef1,
		rc.USER_DEF2 dtlcontdef2,
		rc.USER_DEF3 dtlcontdef3,
		rc.USER_DEF4 dtlcontdef4,
		rc.USER_DEF5 dtlcontdef5,
		rc.USER_DEF6 dtlcontdef6,
		rc.USER_DEF7 dtlcontdef7,
		rc.USER_DEF8 dtlcontdef8

	
		from
			receipt_container rc
			inner join receipt_detail rd
			on
			rc.internal_receipt_line_num = rd.internal_receipt_line_num
			
		where
			rc.parent = @INTERNAL_REC_CONT_NUM
			and
			(
				rc.to_location is not null
				or
				rc.status_failed = N'Y'
			)
		order by
			rc.to_location,
			rc.item;

end -- RPT_ContPutawayListDetails




