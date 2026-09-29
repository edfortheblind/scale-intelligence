-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






















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
	-- [comment omitted]

	-- [comment omitted]
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
		
	set @IsInventoryEmptied = N'<literal:1>';
	set @IsEmptyRequestExisting = N'<literal:2>';
	set @IsPermanentLocation = N'<literal:3>';
	set @CycleCountAction = N'<literal:4>';
	set @OnHandQty = 0;
		
	-- [comment omitted]
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
		set @IsPermanentLocation = N'<literal:5>';
	
	-- [comment omitted]
	-- [comment omitted]
	if exists ( SELECT N'<literal:6>'
	       FROM CYCLE_COUNT_REQUEST
	       WHERE LOCATION = @Loc
		     AND WAREHOUSE = @Whs
		     AND CONDITION = N'<literal:7>'
		     AND ITEM = @Item
			 AND ((COMPANY IS NULL AND @Comp IS NULL)
				OR	(COMPANY = @Comp))                      
			 AND ((LOT IS NULL AND @Lot IS NULL)
				OR	(LOT = @Lot))
			 AND ((LOGISTICS_UNIT IS NULL AND @ContId IS NULL)
				OR	(LOGISTICS_UNIT = @ContId))
			 AND (ISNULL(LOC_INV_ATTRIBUTES_ID, 0) =  ISNULL(@locInvAttributesId, 0)))
	begin
		set @CycleCountAction = N'<literal:8>' ;
	end;
	
	SELECT LOCATION 
	FROM CYCLE_COUNT_REQUEST
	WHERE 	LOCATION = @Loc
		AND WAREHOUSE = @Whs
		AND CONDITION = N'<literal:9>'
		AND ITEM = @Item
		AND ((COMPANY IS NULL AND @Comp IS NULL)
			OR	(COMPANY = @Comp))                      
		AND ((LOT IS NULL AND @Lot IS NULL)
			OR	(LOT = @Lot))
		AND ((LOGISTICS_UNIT IS NULL AND @ContId IS NULL)
			OR	(LOGISTICS_UNIT = @ContId))
		AND (ISNULL(LOC_INV_ATTRIBUTES_ID, 0) =  ISNULL(@locInvAttributesId, 0));   

	-- [comment omitted]
	if  (@@ROWCOUNT <= 0)
		begin
            
            if(ISNULL(@locInvAttributesId, 0) > 0)
            begin            
                -- [comment omitted]
                DECLARE cntCurs CURSOR READ_ONLY FOR 
                SELECT LOC_INV_ATTRIBUTES_ID 
                FROM CYCLE_COUNT_REQUEST
                WHERE 	LOCATION = @Loc
                    AND WAREHOUSE = @Whs
                    AND CONDITION = N'<literal:10>'
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
                    -- [comment omitted]
                    if(dbo.INVfn_AreInvAttributeValuesSame(@locInvAttributesId, @TempAttribId) = 1)
                    begin 
                        set @CycleCountAction = N'<literal:11>' ;
                        break;
                    end;

                FETCH NEXT FROM cntCurs INTO @TempAttribId;
                end;
                
                CLOSE cntCurs;
                DEALLOCATE cntCurs;
            end; -- [comment omitted]
            
            if(@CycleCountAction <> N'<literal:12>')
            begin            
                set @CycleCountAction = N'<literal:13>';
                
                if(@IsPermanentLocation = N'<literal:14>')
                begin
                    set @PermanentItem = @Item;
                    set @PermanentItemCompany = @Comp;
                end;
                
                SELECT LOCATION 
                FROM CYCLE_COUNT_REQUEST
                WHERE 	LOCATION = @Loc
                    AND WAREHOUSE = @Whs
                    AND CONDITION = N'<literal:15>'
                    AND  ((ITEM IS NULL AND @PermanentItem IS NULL)
                        OR	(ITEM = @PermanentItem))
                    AND ((COMPANY IS NULL AND @PermanentItemCompany IS NULL)
                        OR	(COMPANY = @PermanentItemCompany))
                    AND LOT IS NULL
                    AND LOGISTICS_UNIT IS NULL 
                    AND (LOC_INV_ATTRIBUTES_ID IS NULL OR LOC_INV_ATTRIBUTES_ID = 0);
                
                -- [comment omitted]
                if(@@ROWCOUNT > 0)
                begin
                    set @IsEmptyRequestExisting = N'<literal:16>';
                    set @CycleCountAction = N'<literal:17>';
                end;
            end; -- [comment omitted]
		end;
	else 
    -- [comment omitted]
    -- [comment omitted]
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
			
			-- [comment omitted]
			if(@OnHandQty=0)
			begin
			
				set @IsInventoryEmptied = N'<literal:18>';
				
				-- [comment omitted]
				SELECT LOCATION FROM CYCLE_COUNT_REQUEST
				WHERE 	LOCATION = @Loc
					AND WAREHOUSE = @Whs
					AND CONDITION = N'<literal:19>'
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
					set	@CycleCountAction = N'<literal:20>';
			end;
		end;
	
	-- [comment omitted]
	if (@CycleCountAction = N'<literal:21>') 
	begin
		-- [comment omitted]
		if (@IsInventoryEmptied = N'<literal:22>')
		begin
			if(@IsPermanentLocation = N'<literal:23>')
			begin
				set @Item = null;
	    		set @Comp = null;
	    		set @ItemDesc = null;
	    	end;
       		set @Lot = null;
       		set @ContId = null;
			set @locInvAttributesId = null;
		end;
		
		-- [comment omitted]
		UPDATE CYCLE_COUNT_REQUEST
		SET    ITEM = @Item,
		       COMPANY = @Comp,
		       LOT =   @Lot,
		       ITEM_DESC = @ItemDesc,
		       LOGISTICS_UNIT = @ContId,
			   LOC_INV_ATTRIBUTES_ID = @locInvAttributesId,
	           USER_STAMP = @UserName,
		       PROCESS_STAMP = N'<literal:24>',
		       DATE_TIME_STAMP = GETUTCDATE()
		WHERE  LOCATION = @Loc
		       AND WAREHOUSE = @Whs
		       AND CONDITION = N'<literal:25>'
				AND ((ITEM = @OriItem) 
					OR (ITEM IS NULL AND @OriItem IS NULL))
				AND ((COMPANY IS NULL AND @OriCompany IS NULL)
					OR	(COMPANY = @OriCompany))                      
				AND ((LOT IS NULL AND @OriLot IS NULL)
					OR	(LOT = @OriLot))
				AND ((LOGISTICS_UNIT IS NULL AND @OriContId IS NULL)
					OR	(LOGISTICS_UNIT = @OriContId))
				AND (ISNULL(LOC_INV_ATTRIBUTES_ID, 0) =  ISNULL(@OriAttribId, 0));              
		       
			
		-- [comment omitted]
		UPDATE WORK_INSTRUCTION 
		SET  ITEM = @Item ,
		     COMPANY = @Comp ,
		     LOT =   @Lot ,
		     ITEM_DESC = @ItemDesc ,
		     LOGISTICS_UNIT = @ContId ,
	         USER_STAMP = @UserName,
		     PROCESS_STAMP = N'<literal:26>',
		     DATE_TIME_STAMP = GETUTCDATE()
		WHERE CYCLE_COUNT = N'<literal:27>'
			AND LAUNCH_NUM IN 
			     (
			     SELECT LAUNCH_NUMBER FROM CYCLE_COUNT_REQUEST  
			      WHERE LOCATION = @Loc
			      AND WAREHOUSE = @Whs
			      AND CONDITION = N'<literal:28>' 
			      AND WORK_CREATED = N'<literal:29>'
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
	
	-- [comment omitted]
	if (@CycleCountAction = N'<literal:30>')
	begin
	
		-- [comment omitted]
		if( @IsEmptyRequestExisting  = N'<literal:31>')
			begin
			-- [comment omitted]
			set @CycleCountAction = N'<literal:32>';
			
			if(@IsPermanentLocation = N'<literal:33>')
			begin
				set @Item = null;
	    		set @Comp = null;
	    	end;
       		set @Lot = null;
       		set @ContId = null;
		end;
		
		-- [comment omitted]
		DELETE 
		FROM CYCLE_COUNT_REQUEST
		WHERE LOCATION = @Loc
			AND WAREHOUSE = @Whs
			AND CONDITION = N'<literal:34>'
			AND ((ITEM IS NULL AND @Item IS NULL)
				OR (ITEM =@item))
			AND ((COMPANY IS NULL AND @Comp IS NULL)
				OR	(COMPANY = @Comp))                      
			AND ((LOT IS NULL AND @Lot IS NULL)
					OR	(LOT = @Lot))
			AND ((LOGISTICS_UNIT IS NULL AND @ContId IS NULL)
				OR	(LOGISTICS_UNIT = @ContId))
			AND (ISNULL(LOC_INV_ATTRIBUTES_ID, 0) =  ISNULL(@locInvAttributesId, 0)); 
		
		-- [comment omitted]
		DELETE 
		FROM WORK_INSTRUCTION
		WHERE CYCLE_COUNT = N'<literal:35>'
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
			AND (INSTRUCTION_TYPE=N'<literal:36>') ;

		DELETE 
		FROM WORK_INSTRUCTION
		WHERE
		INTERNAL_INSTRUCTION_NUM NOT IN 
				(
				Select PARENT_INSTR
				from WORK_INSTRUCTION
				where INSTRUCTION_TYPE=N'<literal:37>'
				AND CYCLE_COUNT = N'<literal:38>'
				AND FROM_LOC = @Loc
				AND FROM_WHS = @Whs
				)
			AND CYCLE_COUNT = N'<literal:39>'
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
			AND (INSTRUCTION_TYPE=N'<literal:40>');  
	end;
	
if(@CycleCountAction = N'<literal:41>')
	set @CCAction = -1;
else if(@CycleCountAction = N'<literal:42>')
	set @CCAction = 1;

if (@@ERROR <> 0) return -1; else return 0;

