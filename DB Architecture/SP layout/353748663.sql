/*
	Mod Number  | Programmer    | Date       | Modification Description
	--------------------------------------------------------------------
	18659       | RLG           | 3/13/2006	| Created.

	
        This scripts selects our Report detail fields for PurchaseOrderStatus.rpt
*/

CREATE PROCEDURE RPT_PurchaseOrderStatusDetails(@OBJECT_ID numeric(9))
AS
    SET NOCOUNT ON;
    SELECT POD.line_number,
           POD.item,
           POD.item_desc,
           POD.open_quantity poOpenQty,
           POD.total_quantity poTotalQty,
           POD.item_net_price,
           POD.quantity_um,
           (POD.item_net_price * POD.open_quantity) poOpenDollarAmount,
           sum(RD.Open_Qty) rdOpenQty,
           sum(RD.total_qty - RD.open_qty) rdRecvQty,
           CASE
		WHEN sum(RD.total_qty) is null
		THEN 0 
		ELSE sum(RD.total_qty)
           END  rdTotalQty,
           POD.user_def1,
           POD.user_def2,
           POD.user_def3,
           POD.user_def4,
           POD.user_def5,
           POD.user_def6,
           POD.user_def7,
           POD.user_def8
    FROM  (PURCHASE_ORDER_DETAIL POD
           left outer join 
                 receipt_detail RD 
           on
                 RD.purchase_order_detail_id = POD.object_id)             

    WHERE pod.PURCHASE_ORDER_OBJECT_ID = @OBJECT_ID
    GROUP BY
           POD.line_number,
           POD.item,
           POD.item_desc,
           POD.open_quantity,
           POD.total_quantity,
           POD.item_net_price,
           POD.quantity_um,
           POD.user_def1,
           POD.user_def2,
           POD.user_def3,
           POD.user_def4,
           POD.user_def5,
           POD.user_def6,
           POD.user_def7,
           POD.user_def8
    Order by
          POD.line_number,
          POD.item;

-- end RPT_PurchaseOrderStatusDetails


