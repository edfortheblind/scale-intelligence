-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */

















-- [comment omitted]


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
		ISNULL(WI.COMPANY, N'<literal:1>') = ISNULL(IM.COMPANY,N'<literal:2>') AND
        WI.instruction_type = N'<literal:3>' AND
		WI.parent_instr = @PARENT_INSTR
	order by
		from_loc,
		WI.item;





end -- [comment omitted]



