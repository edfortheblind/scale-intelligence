-- DOCUMENTATION ONLY: literals/comments removed; do not execute.


/* [comment omitted] */
/* [comment omitted] */



















CREATE PROCEDURE CCP_MergeCCRequestsFromDifferentWorkUnits(
	@stItem nvarchar(50),	
	@stCompany nvarchar(25),
	@stLot nvarchar(25),
	@stLoc nvarchar(25),
	@stWhs nvarchar(25),
	@stWorkUnit nvarchar(50),	
	@stLogisticUnit nvarchar(50),
	@LOCINVATTRIBUTESID numeric(9),
	@currentIns numeric(9) output,
	@currentCCReq numeric(9) output 
	)
AS
	SET NOCOUNT ON;	
	
	declare @planNum numeric(9);
	declare	@parentInstr numeric(9); 
	declare @numOfRecordsMerged int;
	declare @currentParentInstr numeric(9) = (select INTERNAL_INSTRUCTION_NUM from WORK_INSTRUCTION where WORK_UNIT=@stWorkUnit and INSTRUCTION_TYPE=N'<literal:1>');
	declare @iPlanNum numeric(9) = (Select INTERNAL_PLAN_NUM from CYCLE_COUNT_REQUEST
									where INTERNAL_COUNT_NUM = (Select TOP 1 INTERNAL_COUNT_NUM from work_instruction 
									where work_unit = @stWorkUnit and INSTRUCTION_TYPE = N'<literal:2>'));
    declare @TotOpenCC int;
    declare @openWorkDetails  int ;
	
	-- [comment omitted]
	select @currentIns = INTERNAL_INSTRUCTION_NUM,@planNum=LAUNCH_NUM,@currentCCReq=INTERNAL_NUM,@parentInstr=PARENT_INSTR  from WORK_INSTRUCTION
	where FROM_LOC = @stLoc
    and ITEM=@stItem
	and ((COMPANY is null and @stCompany is null ) or COMPANY = @stCompany)
	and ((LOT is null and @stLot is null ) or LOT = @stLot)
	and ((LOGISTICS_UNIT is null and  @stLogisticUnit is null ) or LOGISTICS_UNIT = @stLogisticUnit)	
	and FROM_WHS = @stWhs
    and WORK_UNIT <> @stWorkUnit
	and ((FROM_LOC_INV_ATTRIBUTES_ID is null and @LOCINVATTRIBUTESID is null)  or FROM_LOC_INV_ATTRIBUTES_ID= @LOCINVATTRIBUTESID)
    and Internal_Num_Type=N'<literal:3>'
    and INSTRUCTION_TYPE = N'<literal:4>'
	and not (CONDITION = N'<literal:5>' and USER_ASSIGNED is not null)
	
	
		-- [comment omitted]
		update CYCLE_COUNT_REQUEST set INTERNAL_PLAN_NUM = @iPlanNum, LAUNCH_NUMBER = @iPlanNum
		where INTERNAL_COUNT_NUM = @currentCCReq
		
		-- [comment omitted]
		update CYCLE_COUNT_PLAN set TOTAL_OPEN = TOTAL_OPEN+1 where INTERNAL_PLAN_NUM = @iPlanNum
		
		set @TotOpenCC = (select COUNT(*) from CYCLE_COUNT_REQUEST where INTERNAL_PLAN_NUM = @planNum and CONDITION <> N'<literal:6>')
		
		if @TotOpenCC> 0
			begin
				-- [comment omitted]
				update CYCLE_COUNT_PLAN set TOTAL_OPEN = @TotOpenCC
				where INTERNAL_PLAN_NUM = @planNum
			end
		else
			begin
				-- [comment omitted]
				delete from CYCLE_COUNT_PLAN where INTERNAL_PLAN_NUM = @planNum
			end
		
		-- [comment omitted]
		update WORK_INSTRUCTION set PARENT_INSTR = @currentParentInstr, WORK_UNIT = @stWorkUnit
		, REFERENCE_ID = @iPlanNum, LAUNCH_NUM = @iPlanNum, CONDITION=N'<literal:7>', SEQUENCE = (select MAX(SEQUENCE) + 1 from WORK_INSTRUCTION where WORK_UNIT = @stWorkUnit), 
		USER_ASSIGNED = (select USER_ASSIGNED from WORK_INSTRUCTION where WORK_UNIT=@stWorkUnit and INSTRUCTION_TYPE=N'<literal:8>')
		where INTERNAL_INSTRUCTION_NUM = @currentIns
		
		-- [comment omitted]
		update WORK_INSTRUCTION set NUMBER_OF_CHILDREN = NUMBER_OF_CHILDREN+1 where INTERNAL_INSTRUCTION_NUM = @currentParentInstr
		
		set @openWorkDetails = (select COUNT(*) from WORK_INSTRUCTION where PARENT_INSTR = @parentInstr and CONDITION <> N'<literal:9>')
			
		if @openWorkDetails >0
		begin 
			-- [comment omitted]
			update WORK_INSTRUCTION set NUMBER_OF_CHILDREN = @openWorkDetails
			where INTERNAL_INSTRUCTION_NUM = @parentInstr
		end
		else
		begin
			-- [comment omitted]
			delete from WORK_INSTRUCTION where PARENT_INSTR = @parentInstr or INTERNAL_INSTRUCTION_NUM = @parentInstr
		end
	
	
	
	