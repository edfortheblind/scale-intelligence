-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE procedure WRK_UpdateParentInstructionLnk(
	@ParentInstr numeric(9),
	@workUnit nvarchar(50))
as
	update work_instruction
	set parent_instr = @ParentInstr
	where work_unit = @WorkUnit
	and instruction_type = N'<literal:1>'



