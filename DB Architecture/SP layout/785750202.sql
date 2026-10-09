/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	16138	| SWB	| 04/27/05	| Created.
	5110    | AK    | 06/13/07  | Modified to use Shipping Load View.


	Returns a rowset used for the header of TruckManifest.rpt.
	
	Parameters:
		INTERNAL_LOAD_NUM  The internal load number.
		

	Returns:
		Rowset with a row for each internal load number and summary information for
		the load corresponding to that internal load number.

*/



CREATE PROCEDURE RPT_TruckManifestHeader(
	@INTERNAL_LOAD_NUM numeric(9))
	
AS
begin
	set nocount on;
	select 
		sl.warehouse,
		whs.[description] whsDesc,
		sl.internal_load_num intLoadNum,
		sl.scheduled_ship_date shpDate,
		sl.carrier,
		ca.type carrType,
		sl.total_containers totLoadCont,
		sl.total_volume totLoadVol,
		sl.total_weight totLoadWeight,
		sl.volume_UM totVolumeUM,
		sl.weight_UM totWeightUM,
		sl.user_def1  sl_user_def1,
		sl.user_def2  sl_user_def2,
		sl.user_def3  sl_user_def3,
		sl.user_def4  sl_user_def4,
		sl.user_def5  sl_user_def5,
		sl.user_def6  sl_user_def6,
		sl.user_def7  sl_user_def7,
		sl.user_def8  sl_user_def8
	from
		shipping_load_view sl

		left outer join carrier ca
		on
			sl.carrier = ca.carrier
		and
			ca.service is null

		inner join warehouse whs
		on
			sl.warehouse = whs.warehouse
	where
		sl.internal_load_num = @INTERNAL_LOAD_NUM;	

end -- RPT_TruckManifestHeader






