/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	16128	| MB	| 05/31/05	| Created.
	46818	| NB	| 07/05/10	| Modified to mask null value for numeric fields. 
								| As Crystal Report was not able to dispaly it .

	Returns a rowset used for CycleCountList.rpt.
	
	Parameters:
		internalPlanNumber  The internal plan number.

	Returns:
		Rowset with a row for each internal plan number and summary information for
		that internal plan number.

*/

CREATE PROCEDURE RPT_CycleCountListHeader(
	@INTERNAL_PLAN_NUM numeric(9))

AS
begin
	set nocount on;
	select 
		ccp.warehouse,
		ccp.master_name,
		ccp.user_def1 user_defhdr1,
		ccp.user_def2 user_defhdr2,
		ccp.user_def3 user_defhdr3,
		ccp.user_def4 user_defhdr4,
		ccp.user_def5 user_defhdr5,
		ccp.user_def6 user_defhdr6,
		isnull(ccp.user_def7,0) user_defhdr7,
		isnull(ccp.user_def8,0) user_defhdr8
	from
		cycle_count_plan ccp
	where
		ccp.internal_plan_num = @INTERNAL_PLAN_NUM;


end -- RPT_CycleCountListHeader
