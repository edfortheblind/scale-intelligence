/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	16123	| MB	| 03/24/05	| Created.
	17771	| PKN	| 12/01/05	| Replaced SOURCE_ADDRESS with SHIP_FROM_ADDRESS 
/
	Returns a rowset used for the header of RPT_ContPutawayListHeader.
		
*/

-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;


CREATE PROCEDURE RPT_ContPutawayListHeader(
	@INTERNAL_REC_CONT_NUM numeric(9))

AS
begin
	set nocount on;
	select 
		-- print company at the top of the list if present.
		case
			when rh.company is not null
			then rh.company
			else rh.warehouse
		end companyOrWarehouse,
		rc.RECEIPT_DATE,
		rc.CONTAINER_TYPE,
		rc.CONTAINER_ID HdrContainer_ID,
		rh.RECEIPT_ID,
		rh.receipt_ID_Type,
		rh.receipt_type,
		rc.converted_loc_qty as HdrQuantity,
		rc.converted_qty_um as HdrQuantity_UM,
		rc.quantity as HdrBaseQuantity,
		rc.quantity_um as HdrBaseQuantity_UM,
		rc.ITEM HdrItem,
		rc.ITEM_DESC HdrItem_Desc,
		rc.FROM_LOCATION,
		rc.TO_LOCATION to_HdrLocation,
		rc.STATUS_FAILED,
		rh.SHIP_FROM_NAME,
		rh.SHIP_FROM_ADDRESS1,
		rh.SHIP_FROM_ADDRESS2,
		rh.SHIP_FROM_ADDRESS3,
		rh.SHIP_FROM_CITY,
		rh.SHIP_FROM_STATE,
		rh.SHIP_FROM_COUNTRY,
		rh.SHIP_FROM_POSTAL_CODE,
		rc.user_def1 hdrcontdef1,
		rc.user_def2 hdrcontdef2,
		rc.user_def3 hdrcontdef3,
		rc.user_def4 hdrcontdef4,
		rc.user_def5 hdrcontdef5,
		rc.user_def6 hdrcontdef6,
		rc.user_def7 hdrcontdef7,
		rc.user_def8 hdrcontdef8,
		rh.user_def1 hdrdef1,
		rh.user_def2 hdrdef2,
		rh.user_def3 hdrdef3,
		rh.user_def4 hdrdef4,
		rh.user_def5 hdrdef5,
		rh.user_def6 hdrdef6,
		rh.user_def7 hdrdef7,
		rh.user_def8 hdrdef8
		
	from
		receipt_container rc
		inner join receipt_header rh
		on
		rc.internal_receipt_num = rh.internal_receipt_num
	where
		rc.internal_rec_cont_num = @INTERNAL_REC_CONT_NUM;

end -- RPT_ContPutawayListHeader




