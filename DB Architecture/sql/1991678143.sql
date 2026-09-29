-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

CREATE PROCEDURE [dbo].[RPT_1348_bak20121206](    
	@INTERNAL_CONTAINER_NUM numeric(9)    
	)    
AS    
BEGIN    
    
	SELECT DISTINCT sd.TOTAL_QTY 
		,STATUS1
		,completed as QUANTITY_AT_STS1
		,sd.item    
		,(sd.item_desc + CASE WHEN sd.item_size IS NULL THEN '<literal:1>'
							ELSE '<literal:2>' + sd.item_size END) '<literal:3>'
		,sh.user_def6    
		,sd.quantity_um    
		,sd.total_qty
		,sh.user_def7    
		,sh.priority    
		,sd.mark_for_address1    
		,sd.mark_for_address2    
		,sd.mark_for_address3    
		,sd.mark_for_city    
		,sd.mark_for_state    
		,sd.mark_for_postal_code    
		,sd.mark_for_country    
		,sh.internal_shipment_num    
		,sd.erp_order    
		,sd.customer    
		,SD.ITEM_LIST_PRICE    
		,sd.Total_Weight    

	FROM dbo.shipping_container scp WITH(NOLOCK)
	INNER JOIN dbo.shipping_container scc WITH(NOLOCK)
		ON scp.CONTAINER_ID  = scc.PARENT_CONTAINER_ID 
	INNER JOIN (    
		SELECT internal_shipment_line_num, STATUS1, REQUESTED_QTY, item, item_desc, item_size, quantity_um
		, CASE status2
					WHEN 999 THEN quantity_at_sts1
					ELSE total_qty END '<literal:4>'            -- [comment omitted]
		,total_weight    
		,mark_for_address1    
		,mark_for_address2    
		,mark_for_address3    
		,mark_for_city    
		,mark_for_state    
		,mark_for_postal_code    
		,mark_for_country    
		,erp_order    
		,customer    
		,ITEM_LIST_PRICE
		,CASE WHEN STATUS1 >= 650 THEN QUANTITY_AT_STS1 ELSE 0 END +     
			CASE WHEN STATUS2 >= 650 THEN QUANTITY_AT_STS2 ELSE 0 END +     
			CASE WHEN STATUS3 >= 650 THEN QUANTITY_AT_STS3 ELSE 0 END +     
			CASE WHEN STATUS4 >= 650 THEN QUANTITY_AT_STS4 ELSE 0 END +     
			CASE WHEN STATUS5 >= 650 THEN QUANTITY_AT_STS5 ELSE 0 END +     
			CASE WHEN STATUS6 >= 650 THEN QUANTITY_AT_STS6 ELSE 0 END +   
			CASE WHEN STATUS7 >= 650 THEN QUANTITY_AT_STS7 ELSE 0 END +   
			CASE WHEN STATUS8 >= 650 THEN QUANTITY_AT_STS8 ELSE 0 END +   
			CASE WHEN STATUS9 >= 650 THEN QUANTITY_AT_STS9 ELSE 0 END +   
			CASE WHEN STATUS10 >= 650 THEN QUANTITY_AT_STS10 ELSE 0 END    
		AS completed
		,CASE WHEN (     
				CASE WHEN STATUS1 >= 650 THEN QUANTITY_AT_STS1 ELSE 0 END +     
				CASE WHEN STATUS2 >= 650 THEN QUANTITY_AT_STS2 ELSE 0 END +     
				CASE WHEN STATUS3 >= 650 THEN QUANTITY_AT_STS3 ELSE 0 END +     
				CASE WHEN STATUS4 >= 650 THEN QUANTITY_AT_STS4 ELSE 0 END +     
				CASE WHEN STATUS5 >= 650 THEN QUANTITY_AT_STS5 ELSE 0 END +     
				CASE WHEN STATUS6 >= 650 THEN QUANTITY_AT_STS6 ELSE 0 END +   
				CASE WHEN STATUS7 >= 650 THEN QUANTITY_AT_STS7 ELSE 0 END +   
				CASE WHEN STATUS8 >= 650 THEN QUANTITY_AT_STS8 ELSE 0 END +   
				CASE WHEN STATUS9 >= 650 THEN QUANTITY_AT_STS9 ELSE 0 END +   
				CASE WHEN STATUS10 >= 650 THEN QUANTITY_AT_STS10 ELSE 0 END   
			) = REQUESTED_QTY THEN N'<literal:5>' 
		END as OK_1348
	FROM dbo.SHIPMENT_DETAIL WITH(NOLOCK)
	) sd    
		ON scc.internal_shipment_line_num = sd.internal_shipment_line_num 
	LEFT OUTER JOIN dbo.shipment_header sh WITH(NOLOCK)
		ON scp.internal_shipment_num = sh.internal_shipment_num    
	WHERE scp.INTERNAL_CONTAINER_NUM = @INTERNAL_CONTAINER_NUM    
	AND OK_1348 = N'<literal:6>'    

END -- [comment omitted]