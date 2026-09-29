-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE procedure WRK_UpdateWorkUnitName(
	@OldWorkUnit nvarchar(50),
	@NewworkUnit nvarchar(50))
as
	update work_instruction
	set work_unit = @NewWorkUnit
	where work_unit = @OldWorkUnit



