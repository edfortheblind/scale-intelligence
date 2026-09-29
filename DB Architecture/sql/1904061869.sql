-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
create view sci_work_instruction_view
as
SELECT * FROM WORK_INSTRUCTION with (nolock)
UNION ALL
SELECT * FROM IA_WORK_INSTRUCTION with (nolock)
union all 
select * from ar_work_instruction with (nolock) 
union all 
select * from ar_ia_work_instruction with (nolock)