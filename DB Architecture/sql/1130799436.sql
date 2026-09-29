-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */













CREATE PROCEDURE WRK_SplitReplenishmentRequest( @qty numeric(19,5),
@ReplenishmentReqNum numeric(9),
@newInternalInstNum numeric(9),
@newReplenishmentReqNum numeric(9) output)  
AS 
/* [comment omitted] */ 
if (@ReplenishmentReqNum is null OR @ReplenishmentReqNum <= 0 OR @qty is null OR @qty <= 0)  
	return -1;
		INSERT
		INTO
		   REPLENISHMENT_REQUEST ([COMPANY] ,
		   [FROM_WHS] ,
		   [PRIORITY] ,
		   [ITEM] ,
		   [ITEM_DESC] ,
		   [ALLOCATED_QTY] ,
		   [QUANTITY_UM] ,
		   [LOT] ,
		   [ORDER_DATE] ,
		   [ALLOCATION_ZONE] ,
		   [ITEM_DIVISION] ,
		   [ITEM_DEPARTMENT] ,
		   [ITEM_LIST_PRICE] ,
		   [ITEM_NET_PRICE] ,
		   [VALUE] ,
		   [ITEM_SIZE] ,
		   [ITEM_COLOR] ,
		   [ITEM_STYLE] ,
		   [LAUNCH_NUM] ,
		   [NMFC_CODE] ,
		   [USER_DEF1] ,
		   [USER_DEF2] ,
		   [USER_DEF3] ,
		   [USER_DEF4] ,
		   [USER_DEF5] ,
		   [USER_DEF6] ,
		   [USER_DEF7] ,
		   [USER_DEF8] ,
		   [USER_STAMP] ,
		   [PROCESS_STAMP] ,
		   [DATE_TIME_STAMP] ,
		   [TO_WHS] ,
		   [INTERFACED_DATE] ,
		   [PICKING_SEQ] ,
		   [PUTAWAY_SEQ] ,
		   [CONVERTED_ALLOC_QTY] ,
		   [CONVERTED_QTY_UM] ,
		   [FROM_LOC] ,
		   [TO_LOC] ,
		   [FROM_TEMPL_FIELD1] ,
		   [FROM_TEMPL_FIELD2] ,
		   [FROM_TEMPL_FIELD3] ,
		   [FROM_TEMPL_FIELD4] ,
		   [FROM_TEMPL_FIELD5] ,
		   [TO_TEMPL_FIELD1] ,
		   [TO_TEMPL_FIELD2] ,
		   [TO_TEMPL_FIELD3] ,
		   [TO_TEMPL_FIELD4] ,
		   [TO_TEMPL_FIELD5] ,
		   [WORK_CREATED] ,
		   [REPLENISHMENT_MASTER] ,
		   [INCOMING_PD_LOC] ,
		   [OUTGOING_PD_LOC] ,
		   [FROM_LOGISTICS_UNIT] ,
		   [FROM_PARENT_LOGISTICS_UNIT] ,
		   [TO_LOGISTICS_UNIT] ,
		   [TO_PARENT_LOGISTICS_UNIT] ,
		   [TO_WORK_ZONE] ,
		   [FROM_WORK_ZONE] ,
		   [REPLENISHMENT_TYPE] ,
		   [REPLENISHMENT_MODE] ,
		   [CONSOLIDATED] ,
		   [MARKED_FOR_WORK_CREATION] ,
		   [ORIGINAL_WAVE_NUM]) 
		SELECT
		   [COMPANY] ,
		   [FROM_WHS] ,
		   [PRIORITY] ,
		   [ITEM] ,
		   [ITEM_DESC] ,
		   ALLOCATED_QTY - @qty ,
		   [QUANTITY_UM] ,
		   [LOT] ,
		   [ORDER_DATE] ,
		   [ALLOCATION_ZONE] ,
		   [ITEM_DIVISION] ,
		   [ITEM_DEPARTMENT] ,
		   [ITEM_LIST_PRICE] ,
		   [ITEM_NET_PRICE] ,
		   [VALUE] ,
		   [ITEM_SIZE] ,
		   [ITEM_COLOR] ,
		   [ITEM_STYLE] ,
		   [LAUNCH_NUM] ,
		   [NMFC_CODE] ,
		   [USER_DEF1] ,
		   [USER_DEF2] ,
		   [USER_DEF3] ,
		   [USER_DEF4] ,
		   [USER_DEF5] ,
		   [USER_DEF6] ,
		   [USER_DEF7] ,
		   [USER_DEF8] ,
		   N'<literal:1>' ,
		   N'<literal:2>' ,
		   [DATE_TIME_STAMP] ,
		   [TO_WHS] ,
		   [INTERFACED_DATE] ,
		   [PICKING_SEQ] ,
		   [PUTAWAY_SEQ] ,
		   (CONVERTED_ALLOC_QTY / ALLOCATED_QTY)  * (ALLOCATED_QTY - @qty) ,
		   [CONVERTED_QTY_UM] ,
		   [FROM_LOC] ,
		   [TO_LOC] ,
		   [FROM_TEMPL_FIELD1] ,
		   [FROM_TEMPL_FIELD2] ,
		   [FROM_TEMPL_FIELD3] ,
		   [FROM_TEMPL_FIELD4] ,
		   [FROM_TEMPL_FIELD5] ,
		   [TO_TEMPL_FIELD1] ,
		   [TO_TEMPL_FIELD2] ,
		   [TO_TEMPL_FIELD3] ,
		   [TO_TEMPL_FIELD4] ,
		   [TO_TEMPL_FIELD5] ,
		   [WORK_CREATED] ,
		   [REPLENISHMENT_MASTER] ,
		   [INCOMING_PD_LOC] ,
		   [OUTGOING_PD_LOC] ,
		   [FROM_LOGISTICS_UNIT] ,
		   [FROM_PARENT_LOGISTICS_UNIT] ,
		   [TO_LOGISTICS_UNIT] ,
		   [TO_PARENT_LOGISTICS_UNIT] ,
		   [TO_WORK_ZONE] ,
		   [FROM_WORK_ZONE] ,
		   [REPLENISHMENT_TYPE] ,
		   [REPLENISHMENT_MODE] ,
		   [CONSOLIDATED] ,
		   [MARKED_FOR_WORK_CREATION] ,
		   [ORIGINAL_WAVE_NUM]
		FROM
		   [REPLENISHMENT_REQUEST]
		WHERE
		   INTERNAL_RPLN_REQ_NUM = @ReplenishmentReqNum; if (@@ERROR <> 0)  return -1;
		   
		set @newReplenishmentReqNum = SCOPE_IDENTITY() ; 
		
		/* [comment omitted] */
		UPDATE
			WORK_INSTRUCTION
		SET
			INTERNAL_REQ_NUM = @newReplenishmentReqNum ,
			INTERNAL_NUM = @newReplenishmentReqNum,
			DATE_TIME_STAMP = GETUTCDATE(),
			PROCESS_STAMP = N'<literal:3>',
			USER_STAMP=N'<literal:4>'
		WHERE
			INTERNAL_INSTRUCTION_NUM=@newInternalInstNum; 
			
			
		/* [comment omitted] */
		UPDATE
		    REPLENISHMENT_REQUEST
		SET
		    CONVERTED_ALLOC_QTY = (CONVERTED_ALLOC_QTY / ALLOCATED_QTY)  * (ALLOCATED_QTY - (ALLOCATED_QTY - @qty) ) ,
			ALLOCATED_QTY = @qty ,
			PROCESS_STAMP = N'<literal:5>',
			DATE_TIME_STAMP = GETUTCDATE(),
			USER_STAMP=N'<literal:6>'
		WHERE
		   INTERNAL_RPLN_REQ_NUM = @ReplenishmentReqNum; 
		   
		if (@@ERROR <> 0)  return -1;



