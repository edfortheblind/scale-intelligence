/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	16034           | KSP           | 07/25/05      | Created
	216453			| MJ			| 12/11/17		| Modified to make db compatible with Azure SQL.

	Deactivates inactive work. 
	Copies all closed work instructions from WORK_INSTRUCTION table to IA_WORK_INSTRUCTION
*/

-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;


CREATE PROCEDURE WRK_DeactivateInactiveWork

AS
	

	insert into ia_work_instruction

	select top 10000*
 		from
      	 	work_instruction wih
 	where 
       		wih.instruction_type = N'Header'
       		and
      		 wih.condition = N'Closed'
       		and
		(
           		wih.internal_num_type != N'Shipment'
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

	-- Copy Details
	insert into 
           ia_work_instruction
	select 
		*
	from  work_instruction
	where parent_instr in ( select  internal_instruction_num
			from ia_work_instruction);
	
	

	-- Delete Details
	delete from work_instruction
	where  internal_instruction_num in( select  internal_instruction_num
				    from ia_work_instruction
				    where instruction_type = N'Detail');

	

	-- Delete headers
	delete from work_instruction
	where  internal_instruction_num in ( 
		select  internal_instruction_num
		from ia_work_instruction
		where instruction_type = N'Header');

	

		
   
	
-- end WRK_DeactivateInactiveWork