/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	16131	| MB	| 05/09/05	| Created.
	20289	| BTD	| 11/09/06	| Axapta Certification - TOP without ORDER BY

	Returns a rowset used for the header of ReplenishmentPickList.rpt.
	
	Parameters:
		Replenishment_master 	The replenishment master type.
		Launch_Number	 	The Launch number to be used.


	Returns:
		1 Rowset with a row of summary information for
		the ReplenishmentMaster corresponding to that Launch Number.

*/
-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;


CREATE PROCEDURE RPT_ReplenPickListHeader(
	@REPLENISHMENT_MASTER nvarchar(25),
	@LAUNCH_NUM numeric(9))

AS
begin
	set nocount on;
	select top 1
		rr.from_whs,
		case -- return -1 if not actually created in the launch.
			when ls.internal_launch_num is null
			then -1
			else rr.launch_num
		end launch_num,
		rr.replenishment_master
	from
		replenishment_request rr left outer join launch_statistics ls		
		on
		ls.internal_launch_num = @LAUNCH_NUM

	where
		rr.launch_num = @LAUNCH_NUM
		and 
		rr.replenishment_master = @REPLENISHMENT_MASTER
		and
		rr.work_created = N'I' -- work not created.
	order by rr.replenishment_master


end -- RPT_ReplenPickListHeader




