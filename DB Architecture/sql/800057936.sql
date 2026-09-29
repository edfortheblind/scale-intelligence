-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
CREATE TRIGGER [dbo].[work_instruction_outgoing_pd]
ON [dbo].[WORK_INSTRUCTION]
AFTER INSERT
AS 
if	(
	select count(*) 
	from inserted 
	where (internal_num_type = N'<literal:1>' or internal_num_type = N'<literal:2>')
	and from_templ_field1 <> to_templ_field1 and from_loc <> N'<literal:3>' AND to_loc <> N'<literal:4>'
	) > 0
BEGIN
            UPDATE work_instruction
              SET outgoing_pd_loc = work_instruction.to_templ_field1
             FROM inserted
            WHERE inserted.internal_instruction_num = work_instruction.internal_instruction_num
END