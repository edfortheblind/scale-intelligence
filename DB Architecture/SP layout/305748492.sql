/*
	Mod Number  | Programmer    | Date       | Modification Description
	--------------------------------------------------------------------
	18659       | RLG           | 3/13/2006	| Created.

	
        This scripts selects our Report detail fields for subreport of PurchaseOrderStatus.rpt
*/

CREATE PROCEDURE RPT_POStatusDetailsAndReceipts(@OBJECT_ID numeric(9))
AS
    SET NOCOUNT ON;
    SELECT POD.line_number,
           POD.object_id,
           POD.item,
           POD.item_desc,
           POD.open_quantity poOpenQty,
           POD.total_quantity poTotalQty,
           POD.item_net_price,
	   POD.quantity_um,
           (POD.item_net_price * POD.open_quantity) poOpenDollarAmount,
           POD.user_def1 POD_userDef1,
           POD.user_def2 POD_userDef2,
           POD.user_def3 POD_userDef3,
           POD.user_def4 POD_userDef4,
           POD.user_def5 POD_userDef5,
           POD.user_def6 POD_userDef6,
           POD.user_def7 POD_userDef7,
           POD.user_def8 POD_userDef8,
           RD.receipt_id,
	   RD.erp_order_line_num,
           CASE
		WHEN RD.open_qty is null
		THEN 0 
		ELSE RD.open_qty
           END  rdOpenQty,
	   RD.total_qty rdTotalQty,           
           CASE
		WHEN (RD.total_qty - RD.open_qty) is null
                THEN 0 
		ELSE (RD.total_qty - RD.open_qty)
           END rdRecvQty,
           RD.user_def1 RD_userDef1,
           RD.user_def2 RD_userDef2,
           RD.user_def3 RD_userDef3,
           RD.user_def4 RD_userDef4,
           RD.user_def5 RD_userDef5,
           RD.user_def6 RD_userDef6,
           RD.user_def7 RD_userDef7,
           RD.user_def8 RD_userDef8
    FROM (PURCHASE_ORDER_DETAIL POD 
            left outer join RECEIPT_DETAIL RD 
            on
                POD.OBJECT_ID = RD.PURCHASE_ORDER_DETAIL_ID) 
    WHERE
          POD.PURCHASE_ORDER_OBJECT_ID = @OBJECT_ID
    Order by
          POD.line_number,
          POD.item,
          RD.receipt_id,
          RD.erp_order_line_num;

-- end RPT_POStatusDetailsAndReceipts


