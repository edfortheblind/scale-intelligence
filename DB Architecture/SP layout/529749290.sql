/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	16132	| MB	| 05/18/05	| Created.

	Returns a rowset used for ShippingContainerList.rpt.
	
	Parameters:
		internalLoadNum	The internal Load number.


	Returns:
		Rowset with a row for each internalLoadNum and summary information for
		the Shipping Container List corresponding to that internalLoadNum.

*/
-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;


CREATE PROCEDURE RPT_ShipContListDetails(
	@INTERNAL_LOAD_NUM numeric(9))

AS
begin
	
	set nocount on;
	select 
		SC.CONTAINER_ID,
		SC.TRACKING_NUMBER,
		SH.SHIP_TO_POSTAL_CODE,
		SC.WEIGHT,
		SC.TOTAL_FREIGHT_CHARGE,
		SC.USER_DEF1 dtlUserDef1,
		SC.USER_DEF2 dtlUserDef2,
		SC.USER_DEF3 dtlUserDef3,
		SC.USER_DEF4 dtlUserDef4,
		SC.USER_DEF5 dtlUserDef5,
		SC.USER_DEF6 dtlUserDef6,
		SC.USER_DEF7 dtlUserDef7,
		SC.USER_DEF8 dtlUserDef8

	from
		shipping_container sc
		inner join shipment_header sh
		on
		sc.internal_shipment_num = sh.internal_shipment_num
	where
		sc.parent is null
		and
		sh.shipping_load_num = @INTERNAL_LOAD_NUM;



end -- RPT_ShipContListDetails



