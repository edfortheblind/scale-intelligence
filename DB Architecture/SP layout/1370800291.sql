/*
	Mod Number	| Programmer		| Date   	| Modification Description
	--------------------------------------------------------------------
	16812		| LJM			| 05/31/05	| created
*/


CREATE procedure WRK_UpdateWorkUnitName(
	@OldWorkUnit nvarchar(50),
	@NewworkUnit nvarchar(50))
as
	update work_instruction
	set work_unit = @NewWorkUnit
	where work_unit = @OldWorkUnit



