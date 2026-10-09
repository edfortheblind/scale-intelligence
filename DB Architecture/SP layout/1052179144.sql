/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	14724		| MD		| 06/21/04	| Created.
	14724		| MD		| 08/20/04	| Fixed item getting updated across requests.
	17024		| SSG		| 07/27/05	| Fixed wrong work instruction updation for new CC request.
	15901		| SAT		| 11/30/05	| Fixed Cycle Count Request/work instruction updation for new CC request.
	19440		| RLG		| 07/11/06	| Cycle Count Request/work instruction will not be updated for 		
										| multiitem location when there is inventory in that lochanges
	19165		| VK		| 08/08/06	| Licenseplate changes
	19106		| KRG		| 02/19/08	| Added a check for License Plate while updating Work Instructions.
										| The scenario addressed here is when we have same different LPs for same LOT
	18287		| BB		| 02/21/08	| Fixed creating multiple acitivity driven CC request for a single locations
	27575		| AG		| 06/05/08	| Handled CC Request creation for All-Empty-Multi-Item has some inventory at that location.
										
	50497		| BB		| 04/30/09	| Refactored the SP and made cycle count request specific to Loc/Item/Company/Lot/LP.
	70251		| DSK		| 06/02/10	| Fixed the work instruction update to include Item/Company/Lot/LP criteria in where clause
	77170		| RJR		| 11/15/10	| Added inventory attributes id parameter.
    79731		| SSH		| 02/05/11	| Modified to check for inventory attribute values while inserting new request.
				
	Procedure to update the existing cycle count requests.
	returns 1 if new requests can be created.
*/
CREATE PROCEDURE CCP_CheckToUpdateCCRequest(
	@Item nvarchar(50),
	@ItemDesc nvarchar(100),
	@Comp nvarchar(25),
	@Lot nvarchar(25),
	@Loc nvarchar(25),
	@Whs nvarchar(25),
	@ContId nvarchar(50),
	@locInvAttributesId numeric(9), 
	@NewOnHandQty numeric(19,5),
	@UserName nvarchar(30),
	@CCAction int output)
AS
	-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;

	-- local variables
	declare @IsInventoryEmptied char(1);
	declare @IsPermanentLocation char(1);
	declare @CycleCountAction char(10);
	declare @IsEmptyRequestExisting char(1);
	declare @OriItem nvarchar(50);
	declare @OriLot nvarchar(25);
	declare @OriCompany nvarchar(25); 
    declare @OriContId nvarchar(50);
	declare @OriAttribId  numeric(9);
    declare @OnHandQty numeric(19,5);
    declare @TempAttribId  numeric(9);
    
   	declare @PermanentItem nvarchar(50);
   	declare @PermanentItemCompany nvarchar(25); 
		
	set @IsInventoryEmptied = N'N';
	set @IsEmptyRequestExisting = N'N';
	set @IsPermanentLocation = N'N';
	set @CycleCountAction = N'Update';
	set @OnHandQty = 0;
		
	-- maintain an additional copy 
	set @OriItem = @Item;
	set @OriLot = @Lot;
	set @OriCompany = @Comp;
	set @OriContId = @ContId;
	set @OriAttribId = @locInvAttributesId;
	
	
	SELECT ALLOCATION_LOC
	FROM  ITEM_LOCATION_ASSIGNMENT 
	WHERE ALLOCATION_LOC =  @Loc 
		AND WAREHOUSE = @Whs 
		AND ITEM = @item
		AND ((COMPANY IS NULL AND @Comp IS NULL)
				OR	(COMPANY = @Comp));
		
	if  (@@ROWCOUNT > 0)
		set @IsPermanentLocation = N'Y';
	
	-- if the cycle count is in Pending Review status we do not want to write new requests
	-- neither modify an existing one
	if exists ( SELECT N'A'
	       FROM CYCLE_COUNT_REQUEST
	       WHERE LOCATION = @Loc
		     AND WAREHOUSE = @Whs
		     AND CONDITION = N'Pending Review'
		     AND ITEM = @Item
			 AND ((COMPANY IS NULL AND @Comp IS NULL)
				OR	(COMPANY = @Comp))                      
			 AND ((LOT IS NULL AND @Lot IS NULL)
				OR	(LOT = @Lot))
			 AND ((LOGISTICS_UNIT IS NULL AND @ContId IS NULL)
				OR	(LOGISTICS_UNIT = @ContId))
			 AND (ISNULL(LOC_INV_ATTRIBUTES_ID, 0) =  ISNULL(@locInvAttributesId, 0)))
	begin
		set @CycleCountAction = N'No Action' ;
	end;
	
	SELECT LOCATION 
	FROM CYCLE_COUNT_REQUEST
	WHERE 	LOCATION = @Loc
		AND WAREHOUSE = @Whs
		AND CONDITION = N'Open'
		AND ITEM = @Item
		AND ((COMPANY IS NULL AND @Comp IS NULL)
			OR	(COMPANY = @Comp))                      
		AND ((LOT IS NULL AND @Lot IS NULL)
			OR	(LOT = @Lot))
		AND ((LOGISTICS_UNIT IS NULL AND @ContId IS NULL)
			OR	(LOGISTICS_UNIT = @ContId))
		AND (ISNULL(LOC_INV_ATTRIBUTES_ID, 0) =  ISNULL(@locInvAttributesId, 0));   

	-- if no open request exists, we want to generate a new cycle count request.
	if  (@@ROWCOUNT <= 0)
		begin
            
            if(ISNULL(@locInvAttributesId, 0) > 0)
            begin            
                -- Get cycle count requests with distinct inventory attributes id  while all other values remain same in all returned rows.
                DECLARE cntCurs CURSOR READ_ONLY FOR 
                SELECT LOC_INV_ATTRIBUTES_ID 
                FROM CYCLE_COUNT_REQUEST
                WHERE 	LOCATION = @Loc
                    AND WAREHOUSE = @Whs
                    AND CONDITION = N'Open'
                    AND ITEM = @Item
                    AND ((COMPANY IS NULL AND @Comp IS NULL)
                        OR	(COMPANY = @Comp))                      
                    AND ((LOT IS NULL AND @Lot IS NULL)
                        OR	(LOT = @Lot))
                    AND ((LOGISTICS_UNIT IS NULL AND @ContId IS NULL)
                        OR	(LOGISTICS_UNIT = @ContId));
                
                OPEN cntCurs;
                FETCH NEXT FROM cntCurs INTO @TempAttribId;
                
                while (@@FETCH_STATUS = 0)
                begin
                    --Function returns 1 if attribute values are same    
                    if(dbo.INVfn_AreInvAttributeValuesSame(@locInvAttributesId, @TempAttribId) = 1)
                    begin 
                        set @CycleCountAction = N'No Action' ;
                        break;
                    end;

                FETCH NEXT FROM cntCurs INTO @TempAttribId;
                end;
                
                CLOSE cntCurs;
                DEALLOCATE cntCurs;
            end; --end if(ISNULL(@locInvAttributesId, 0) > 0)
            
            if(@CycleCountAction <> N'No Action')
            begin            
                set @CycleCountAction = N'Insert';
                
                if(@IsPermanentLocation = N'Y')
                begin
                    set @PermanentItem = @Item;
                    set @PermanentItemCompany = @Comp;
                end;
                
                SELECT LOCATION 
                FROM CYCLE_COUNT_REQUEST
                WHERE 	LOCATION = @Loc
                    AND WAREHOUSE = @Whs
                    AND CONDITION = N'Open'
                    AND  ((ITEM IS NULL AND @PermanentItem IS NULL)
                        OR	(ITEM = @PermanentItem))
                    AND ((COMPANY IS NULL AND @PermanentItemCompany IS NULL)
                        OR	(COMPANY = @PermanentItemCompany))
                    AND LOT IS NULL
                    AND LOGISTICS_UNIT IS NULL 
                    AND (LOC_INV_ATTRIBUTES_ID IS NULL OR LOC_INV_ATTRIBUTES_ID = 0);
                
                --check if empty CC request exists for this location, then update that empty request
                if(@@ROWCOUNT > 0)
                begin
                    set @IsEmptyRequestExisting = N'Y';
                    set @CycleCountAction = N'Delete';
                end;
            end; --if(@CycleCountAction <> 'No Action')    
		end;
	else 
    --Delete the CC request if it needs to be updated as empty and different
    -- CC request exist for that location
		begin
			SELECT @OnHandQty = ISNULL(ON_HAND_QTY,0)
			FROM LOCATION_INVENTORY
			WHERE LOCATION = @Loc
				AND WAREHOUSE = @Whs
				AND ITEM = @Item
				AND ((COMPANY IS NULL AND @Comp IS NULL)
					OR	(COMPANY = @Comp))                      
				AND ((LOT IS NULL AND @Lot IS NULL)
					OR	(LOT = @Lot))
				AND ((LOGISTICS_UNIT IS NULL AND @ContId IS NULL)
					OR	(LOGISTICS_UNIT = @ContId))
				AND (ISNULL(LOC_INV_ATTRIBUTES_ID, 0) =  ISNULL(@locInvAttributesId, 0)); 
			
			--if inventory adjust made LP empty, check if location has another CC request existing
			if(@OnHandQty=0)
			begin
			
				set @IsInventoryEmptied = N'Y';
				
				-- if the cycle count request exist in location
				SELECT LOCATION FROM CYCLE_COUNT_REQUEST
				WHERE 	LOCATION = @Loc
					AND WAREHOUSE = @Whs
					AND CONDITION = N'Open'
					AND NOT (
						ITEM = @Item
						AND ((COMPANY IS NULL AND @Comp IS NULL)
							OR	(COMPANY = @Comp))                      
						AND ((LOT IS NULL AND @Lot IS NULL)
							OR	(LOT = @Lot))
						AND ((LOGISTICS_UNIT IS NULL AND @ContId IS NULL)
							OR	(LOGISTICS_UNIT = @ContId))
						AND (ISNULL(LOC_INV_ATTRIBUTES_ID, 0) =  ISNULL(@locInvAttributesId, 0))
						); 
						
				if (@@ROWCOUNT > 0)
					set	@CycleCountAction = N'Delete';
			end;
		end;
	
	--if the CCAction needs an update
	if (@CycleCountAction = N'Update') 
	begin
		-- if the inventory is emptied, update the existing non-empty CC request to empty CC request
		if (@IsInventoryEmptied = N'Y')
		begin
			if(@IsPermanentLocation = N'N')
			begin
				set @Item = null;
	    		set @Comp = null;
	    		set @ItemDesc = null;
	    	end;
       		set @Lot = null;
       		set @ContId = null;
			set @locInvAttributesId = null;
		end;
		
		-- update the existing cycle count
		UPDATE CYCLE_COUNT_REQUEST
		SET    ITEM = @Item,
		       COMPANY = @Comp,
		       LOT =   @Lot,
		       ITEM_DESC = @ItemDesc,
		       LOGISTICS_UNIT = @ContId,
			   LOC_INV_ATTRIBUTES_ID = @locInvAttributesId,
	           USER_STAMP = @UserName,
		       PROCESS_STAMP = N'CCP_CheckToUpdateCCRequest',
		       DATE_TIME_STAMP = GETUTCDATE()
		WHERE  LOCATION = @Loc
		       AND WAREHOUSE = @Whs
		       AND CONDITION = N'Open'
				AND ((ITEM = @OriItem) 
					OR (ITEM IS NULL AND @OriItem IS NULL))
				AND ((COMPANY IS NULL AND @OriCompany IS NULL)
					OR	(COMPANY = @OriCompany))                      
				AND ((LOT IS NULL AND @OriLot IS NULL)
					OR	(LOT = @OriLot))
				AND ((LOGISTICS_UNIT IS NULL AND @OriContId IS NULL)
					OR	(LOGISTICS_UNIT = @OriContId))
				AND (ISNULL(LOC_INV_ATTRIBUTES_ID, 0) =  ISNULL(@OriAttribId, 0));              
		       
			
		-- update the work instruction if the work is created.
		UPDATE WORK_INSTRUCTION 
		SET  ITEM = @Item ,
		     COMPANY = @Comp ,
		     LOT =   @Lot ,
		     ITEM_DESC = @ItemDesc ,
		     LOGISTICS_UNIT = @ContId ,
	         USER_STAMP = @UserName,
		     PROCESS_STAMP = N'CCP_CheckToUpdateCCRequest',
		     DATE_TIME_STAMP = GETUTCDATE()
		WHERE CYCLE_COUNT = N'Y'
			AND LAUNCH_NUM IN 
			     (
			     SELECT LAUNCH_NUMBER FROM CYCLE_COUNT_REQUEST  
			      WHERE LOCATION = @Loc
			      AND WAREHOUSE = @Whs
			      AND CONDITION = N'Open' 
			      AND WORK_CREATED = N'Y'
				AND ((ITEM = @Item)
             		OR (ITEM IS NULL AND @Item IS NULL))
				AND ((COMPANY IS NULL AND @Comp IS NULL)
					OR	(COMPANY = @Comp))                      
				AND ((LOT IS NULL AND @Lot IS NULL)
					OR	(LOT = @Lot))
				AND ((LOGISTICS_UNIT IS NULL AND @ContId IS NULL)
					OR	(LOGISTICS_UNIT = @ContId))
				AND (ISNULL(LOC_INV_ATTRIBUTES_ID, 0) =  ISNULL(@locInvAttributesId, 0))
				)
			AND FROM_LOC = @Loc
			AND FROM_WHS = @Whs
			AND ((ITEM = @OriItem) 
					OR (ITEM IS NULL AND @OriItem IS NULL))
				AND ((COMPANY IS NULL AND @OriCompany IS NULL)
					OR	(COMPANY = @OriCompany))                      
				AND ((LOT IS NULL AND @OriLot IS NULL)
					OR	(LOT = @OriLot))
				AND ((LOGISTICS_UNIT IS NULL AND @OriContId IS NULL)
					OR	(LOGISTICS_UNIT = @OriContId))
				AND (ISNULL(FROM_LOC_INV_ATTRIBUTES_ID, 0) =  ISNULL(@OriAttribId, 0));     
		
	end;
	
	-- delete the empty cycle count request when there is a CC request present for that location.
	if (@CycleCountAction = N'Delete')
	begin
	
		--if location has an empty request delete it and create new CC request(s)
		if( @IsEmptyRequestExisting  = N'Y')
			begin
			--set the CC action to insert
			set @CycleCountAction = N'Insert';
			
			if(@IsPermanentLocation = N'N')
			begin
				set @Item = null;
	    		set @Comp = null;
	    	end;
       		set @Lot = null;
       		set @ContId = null;
		end;
		
		-- delete the cycle count request
		DELETE 
		FROM CYCLE_COUNT_REQUEST
		WHERE LOCATION = @Loc
			AND WAREHOUSE = @Whs
			AND CONDITION = N'Open'
			AND ((ITEM IS NULL AND @Item IS NULL)
				OR (ITEM =@item))
			AND ((COMPANY IS NULL AND @Comp IS NULL)
				OR	(COMPANY = @Comp))                      
			AND ((LOT IS NULL AND @Lot IS NULL)
					OR	(LOT = @Lot))
			AND ((LOGISTICS_UNIT IS NULL AND @ContId IS NULL)
				OR	(LOGISTICS_UNIT = @ContId))
			AND (ISNULL(LOC_INV_ATTRIBUTES_ID, 0) =  ISNULL(@locInvAttributesId, 0)); 
		
		-- delete the work instruction if the work is created.	
		DELETE 
		FROM WORK_INSTRUCTION
		WHERE CYCLE_COUNT = N'Y'
			AND FROM_LOC = @Loc
			AND FROM_WHS = @Whs
			AND ((ITEM IS NULL AND @Item IS NULL)
				OR (ITEM =@item))
			AND ((COMPANY IS NULL AND @Comp IS NULL)
				OR	(COMPANY = @Comp))                      
			AND ((LOT IS NULL AND @Lot IS NULL)
				OR	(LOT = @Lot))
			AND ((LOGISTICS_UNIT IS NULL AND @ContId IS NULL)
				OR	(LOGISTICS_UNIT = @ContId))
			AND (ISNULL(FROM_LOC_INV_ATTRIBUTES_ID, 0) =  ISNULL(@locInvAttributesId, 0))
			AND (INSTRUCTION_TYPE=N'Detail') ;

		DELETE 
		FROM WORK_INSTRUCTION
		WHERE
		INTERNAL_INSTRUCTION_NUM NOT IN 
				(
				Select PARENT_INSTR
				from WORK_INSTRUCTION
				where INSTRUCTION_TYPE=N'Detail'
				AND CYCLE_COUNT = N'Y'
				AND FROM_LOC = @Loc
				AND FROM_WHS = @Whs
				)
			AND CYCLE_COUNT = N'Y'
			AND FROM_LOC = @Loc
			AND FROM_WHS = @Whs
			AND ((ITEM IS NULL AND @Item IS NULL)
				OR (ITEM =@item))
			AND ((COMPANY IS NULL AND @Comp IS NULL)
				OR	(COMPANY = @Comp))                      
			AND ((LOT IS NULL AND @Lot IS NULL)
				OR	(LOT = @Lot))
			AND ((LOGISTICS_UNIT IS NULL AND @ContId IS NULL)
				OR	(LOGISTICS_UNIT = @ContId))
			AND (ISNULL(FROM_LOC_INV_ATTRIBUTES_ID, 0) =  ISNULL(@locInvAttributesId, 0))
			AND (INSTRUCTION_TYPE=N'Header');  
	end;
	
if(@CycleCountAction = N'No Action')
	set @CCAction = -1;
else if(@CycleCountAction = N'Insert')
	set @CCAction = 1;

if (@@ERROR <> 0) return -1; else return 0;

