

/****** Object:  StoredProcedure [dbo].[CCP_MergeCCRequestsFromDifferentWorkUnits]    Script Date: 05/08/2014 14:01:29 ******/
/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	140866		| SHS		    | 05/08/14	| Created
	
	Merges work instruction for a cycle count request with the current work if it is not active
	
	Parameters
		@stItem nvarchar(50) - item to be merged,	
		@stCompany nvarchar(25) - company,
		@stLot nvarchar(25) - lot,
		@stLoc nvarchar(25) - location,
		@stWhs nvarchar(25) - warehouse,
		@stWorkUnit nvarchar(50) - work unit to which item should be merged,	
		@stLogisticUnit nvarchar(50) - lp,
		@LOCINVATTRIBUTESID int - loc_inv_att_id,
		@currentIns int output - instruction num of merged instruction,
		@currentCCReq int output - count num of merged count
*/

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
	declare @currentParentInstr numeric(9) = (select INTERNAL_INSTRUCTION_NUM from WORK_INSTRUCTION where WORK_UNIT=@stWorkUnit and INSTRUCTION_TYPE=N'header');
	declare @iPlanNum numeric(9) = (Select INTERNAL_PLAN_NUM from CYCLE_COUNT_REQUEST
									where INTERNAL_COUNT_NUM = (Select TOP 1 INTERNAL_COUNT_NUM from work_instruction 
									where work_unit = @stWorkUnit and INSTRUCTION_TYPE = N'DETAIL'));
    declare @TotOpenCC int;
    declare @openWorkDetails  int ;
	
	-- Select the inventory work to be merged if it is not active
	select @currentIns = INTERNAL_INSTRUCTION_NUM,@planNum=LAUNCH_NUM,@currentCCReq=INTERNAL_NUM,@parentInstr=PARENT_INSTR  from WORK_INSTRUCTION
	where FROM_LOC = @stLoc
    and ITEM=@stItem
	and ((COMPANY is null and @stCompany is null ) or COMPANY = @stCompany)
	and ((LOT is null and @stLot is null ) or LOT = @stLot)
	and ((LOGISTICS_UNIT is null and  @stLogisticUnit is null ) or LOGISTICS_UNIT = @stLogisticUnit)	
	and FROM_WHS = @stWhs
    and WORK_UNIT <> @stWorkUnit
	and ((FROM_LOC_INV_ATTRIBUTES_ID is null and @LOCINVATTRIBUTESID is null)  or FROM_LOC_INV_ATTRIBUTES_ID= @LOCINVATTRIBUTESID)
    and Internal_Num_Type=N'Cycle Count'
    and INSTRUCTION_TYPE = N'detail'
	and not (CONDITION = N'In Process' and USER_ASSIGNED is not null)
	
	
		--UPDATE cycle count request -- internal plan num, launch num, 
		update CYCLE_COUNT_REQUEST set INTERNAL_PLAN_NUM = @iPlanNum, LAUNCH_NUMBER = @iPlanNum
		where INTERNAL_COUNT_NUM = @currentCCReq
		
		--update current cycle count plan
		update CYCLE_COUNT_PLAN set TOTAL_OPEN = TOTAL_OPEN+1 where INTERNAL_PLAN_NUM = @iPlanNum
		
		set @TotOpenCC = (select COUNT(*) from CYCLE_COUNT_REQUEST where INTERNAL_PLAN_NUM = @planNum and CONDITION <> N'Closed')
		
		if @TotOpenCC> 0
			begin
				--Update cycle count plan of merged CC request
				update CYCLE_COUNT_PLAN set TOTAL_OPEN = @TotOpenCC
				where INTERNAL_PLAN_NUM = @planNum
			end
		else
			begin
				-- delete the plan if no other requests exist
				delete from CYCLE_COUNT_PLAN where INTERNAL_PLAN_NUM = @planNum
			end
		
		-- update the work to change parent , work unit etc.
		update WORK_INSTRUCTION set PARENT_INSTR = @currentParentInstr, WORK_UNIT = @stWorkUnit
		, REFERENCE_ID = @iPlanNum, LAUNCH_NUM = @iPlanNum, CONDITION=N'In Process', SEQUENCE = (select MAX(SEQUENCE) + 1 from WORK_INSTRUCTION where WORK_UNIT = @stWorkUnit), 
		USER_ASSIGNED = (select USER_ASSIGNED from WORK_INSTRUCTION where WORK_UNIT=@stWorkUnit and INSTRUCTION_TYPE=N'Header')
		where INTERNAL_INSTRUCTION_NUM = @currentIns
		
		--update current work header
		update WORK_INSTRUCTION set NUMBER_OF_CHILDREN = NUMBER_OF_CHILDREN+1 where INTERNAL_INSTRUCTION_NUM = @currentParentInstr
		
		set @openWorkDetails = (select COUNT(*) from WORK_INSTRUCTION where PARENT_INSTR = @parentInstr and CONDITION <> N'Closed')
			
		if @openWorkDetails >0
		begin 
			--update header of merged work unit
			update WORK_INSTRUCTION set NUMBER_OF_CHILDREN = @openWorkDetails
			where INTERNAL_INSTRUCTION_NUM = @parentInstr
		end
		else
		begin
			--delete header of merged work if no more details are left
			delete from WORK_INSTRUCTION where PARENT_INSTR = @parentInstr or INTERNAL_INSTRUCTION_NUM = @parentInstr
		end
	
	
	
	