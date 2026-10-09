/*
	Mod Number  | Programmer    | Date       | Modification Description
	--------------------------------------------------------------------
	18659       | RLG           | 3/13/2006	| Created.

        This scripts selects our Purchase Order Header fields for PurchaseOrderStatus.rpt
*/


CREATE PROCEDURE RPT_PurchaseOrderStatusHeader(@OBJECT_ID numeric(9))
    
AS
    SET NOCOUNT ON;
    SELECT POH.purchase_order_id,
           POH.created_date_time,
           POH.closed_date_time,
           POH.status,  
           POH.Company,  
           POH.ship_from_name,
           POH.ship_from_address1,
           POH.ship_from_address2,
           POH.ship_from_address3,
           POH.ship_from_city,
           POH.ship_from_country,
           POH.ship_from_postal_code,
           POH.ship_from_state,          
           POD.sumDetailOpenQty, 
           POD.sumDetailTotalQty,
	   POD.total_lines,          
           POH.user_def1,
           POH.user_def2,
           POH.user_def3,
           POH.user_def4,
           POH.user_def5,
           POH.user_def6,
           POH.user_def7,
           POH.user_def8,           
           POH.warehouse           
     FROM PURCHASE_ORDER_HEADER POH,
             ( SELECT count(*) total_lines,
                      sum(open_quantity) sumDetailOpenQty, 
                      sum(total_quantity) sumDetailTotalQty		
               FROM 
                      PURCHASE_ORDER_DETAIL
               WHERE 
                      PURCHASE_ORDER_OBJECT_ID = @OBJECT_ID  ) POD
    WHERE 
        OBJECT_ID = @OBJECT_ID; 
   
-- end RPT_PurchaseOrderStatusHeader


