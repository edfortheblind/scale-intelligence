-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */








CREATE PROCEDURE RPT_ReceiptStatusHeader(@INTERNAL_RECEIPT_NUM numeric(9))
    
AS
    SET NOCOUNT ON;     
    SELECT
	RH.company,
	RH.receipt_date,
	RH.receipt_id,
	RH.receipt_id_type,
	RH.receipt_type,          
	RH.ship_from_name,
	RH.ship_from_address1,
	RH.ship_from_address2,
	RH.ship_from_address3,
	RH.ship_from_city,
	RH.ship_from_country,
	RH.ship_from_postal_code,
	RH.ship_from_state,
	RH.total_lines,
	RD.sumDetailOpenQty, 
	RD.sumDetailTotalQty,	   
	RD.aggregatePOId, 
	RH.trailing_sts,
	RH.close_date,  
	RH.total_qty,
	RH.total_containers,
	RH.trailer_id,           
	RH.user_def1,
	RH.user_def2,
	RH.user_def3,
	RH.user_def4,
	RH.user_def5,
	RH.user_def6,
	RH.user_def7,
	RH.user_def8,           
	RH.warehouse,
	RC.locatePendingQty,
	RC.putawayPendingQty,
	RC.inPutawayQty,
	RC.closedQty
   FROM
	RECEIPT_HEADER RH,
	(
		SELECT
			sum(open_qty) sumDetailOpenQty, 
			sum(total_qty) sumDetailTotalQty,	        
			CASE
				WHEN count(distinct purchase_order_id) > 1
				THEN N'<literal:1>'
				ELSE max(purchase_order_id)
			END aggregatePOId
		FROM 
			RECEIPT_DETAIL
		WHERE 
			INTERNAL_RECEIPT_NUM =  @INTERNAL_RECEIPT_NUM
	) RD,
	(
		SELECT 
			sum(case 
				when status = 200 then
				quantity
				else 0
			end) locatePendingQty,
			sum(case 
				when status = 300 then
				quantity
				else 0
			end) putawayPendingQty,
			sum(case 
				when status = 301 then
				quantity
				else 0
			end) inPutawayQty,
			sum(case 
				when status = 900 then
				quantity
				else 0
			end) closedQty
		FROM 
			receipt_container
		WHERE
			INTERNAL_RECEIPT_NUM = @INTERNAL_RECEIPT_NUM
                AND
                        container_type is null
	) RC
WHERE 
	INTERNAL_RECEIPT_NUM =  @INTERNAL_RECEIPT_NUM; 
   
-- [comment omitted]


