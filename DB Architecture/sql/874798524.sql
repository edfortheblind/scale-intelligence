-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */









-- [comment omitted]


CREATE PROCEDURE WRK_DeactivateInactiveWork

AS
	

	insert into ia_work_instruction

	select top 10000*
 		from
      	 	work_instruction wih
 	where 
       		wih.instruction_type = N'<literal:1>'
       		and
      		 wih.condition = N'<literal:2>'
       		and
		(
           		wih.internal_num_type != N'<literal:3>'
	   	or
	   	0 = ( select 
				count(*)
  			from  
                        	work_instruction wid,
				shipment_header sh
			where
                        	wid.parent_instr = wih.internal_instruction_num
				and
				sh.internal_shipment_num = wid.internal_num
				and
				sh.trailing_sts < 900)
		);	   

	
	
	SET ROWCOUNT 0

	-- [comment omitted]
	insert into 
           ia_work_instruction
	select 
		*
	from  work_instruction
	where parent_instr in ( select  internal_instruction_num
			from ia_work_instruction);
	
	

	-- [comment omitted]
	delete from work_instruction
	where  internal_instruction_num in( select  internal_instruction_num
				    from ia_work_instruction
				    where instruction_type = N'<literal:4>');

	

	-- [comment omitted]
	delete from work_instruction
	where  internal_instruction_num in ( 
		select  internal_instruction_num
		from ia_work_instruction
		where instruction_type = N'<literal:5>');

	

		
   
	
-- [comment omitted]