-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
   
/* [comment omitted] */





      
      
CREATE Procedure CCP_DeleteCCWorkInstrForEmptyLoc
(
@LOCATION nvarchar(25),
@WHS nvarchar(25),
@TYPE nvarchar(25),
@OPEN_CONDITION nvarchar(25),
@IN_PROCESS_CONDITION nvarchar(25)
 )        
As        
Begin  

Declare @internal_inst_num_to_delete table
(
	internal_instruction_num numeric(9)
);

Declare @Empty_CCWork table 
(	
	INTERNAL_COUNT_NUM    numeric(9)  not null 
);
	Insert into @Empty_CCWork(INTERNAL_COUNT_NUM) 	
			Select distinct INTERNAL_COUNT_NUM 
			from CYCLE_COUNT_REQUEST 			
			where ITEM IS NULL 			
			AND WAREHOUSE=@WHS 
			AND LOCATION = @LOCATION ;
				
Insert into @internal_inst_num_to_delete (internal_instruction_num)                 
      select internal_instruction_num from WORK_INSTRUCTION 
      where  INTERNAL_NUM in 
      (
      select INTERNAL_COUNT_NUM 
      from @Empty_CCWork
      )
      AND INSTRUCTION_TYPE = N'<literal:1>'
      AND (CONDITION <>N'<literal:2>')
      AND INTERNAL_NUM_TYPE = N'<literal:3>'	;

Delete from WORK_INSTRUCTION with(rowlock) where INTERNAL_INSTRUCTION_NUM in 
(select INTERNAL_INSTRUCTION_NUM from @internal_inst_num_to_delete);
	  
End 




