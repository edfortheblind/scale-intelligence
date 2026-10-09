/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	16129	| MB	| 04/01/05	| Created.
	104131  | TSP   | 10/29/12  | Added company criteria to avoid duplicate records.

	Returns a rowset used for ReplenishmentWorkPickList.rpt.
	
	Parameters:
		parentInstr	The parent instruction number.
		documentType	The document type which will get printed.


	Returns:
		Rowset with a row for each parent instruction and summary information for
		the work instructions corresponding to that parent instruction.

*/
-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;


CREATE PROCEDURE RPT_ReplenishmentWorkPickList(
	@PARENT_INSTR numeric(9))

AS
begin
	set nocount on;
	select 
		WI.TO_WHS,
		WI.FROM_LOC,
		WI.TO_LOC,
		WI.CONVERTED_QTY,
		WI.CONVERTED_QTY_UM,
		WI.USER_ASSIGNED,
		WI.QUANTITY,
		WI.QUANTITY_UM,
		WI.WORK_UNIT,
		WI.ITEM,
		WI.ITEM_DESC,
		IM.ITEM_SIZE,
		IM.ITEM_COLOR,
		IM.ITEM_STYLE

	from
		work_instruction WI, ITEM IM
	
	where
		WI.ITEM = IM.ITEM AND
		WI.ITEM_DESC = IM.DESCRIPTION AND
		ISNULL(WI.COMPANY, N'!') = ISNULL(IM.COMPANY,N'!') AND
        WI.instruction_type = N'Detail' AND
		WI.parent_instr = @PARENT_INSTR
	order by
		from_loc,
		WI.item;





end -- RPT_ReplenishmentWorkPickList



