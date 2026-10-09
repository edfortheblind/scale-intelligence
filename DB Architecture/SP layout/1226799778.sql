/*
	Mod Number	| Programmer		| Date   	| Modification Description
	--------------------------------------------------------------------
	16812		| LJM			| 05/31/05	| created
*/


CREATE procedure WRK_UpdateParentInstructionLnk(
	@ParentInstr numeric(9),
	@workUnit nvarchar(50))
as
	update work_instruction
	set parent_instr = @ParentInstr
	where work_unit = @WorkUnit
	and instruction_type = N'Detail'



