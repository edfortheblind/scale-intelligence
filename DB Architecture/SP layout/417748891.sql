/*
	Mod Number  | Programmer    | Date       | Modification Description
	--------------------------------------------------------------------
	18662       | RLG           | 3/1/2006	| Created.

	
        This scripts selects our Report detail fields for ReceiptStatus.rpt
*/

CREATE PROCEDURE RPT_ReceiptStatusDetails(
    @INTERNAL_RECEIPT_NUM numeric(9))
AS
    SET NOCOUNT ON;
    SELECT erp_order_line_num,
           item,
           item_desc,
           open_qty,
           total_qty,
           quantity_um,
           (total_qty - open_qty) receivedQty,
           item_net_price,
           (item_net_price * open_qty) openDollarAmount,
           user_def1,
           user_def2,
           user_def3,
           user_def4,
           user_def5,
           user_def6,
           user_def7,
           user_def8
    FROM RECEIPT_DETAIL
    WHERE INTERNAL_RECEIPT_NUM = @INTERNAL_RECEIPT_NUM
    Order by
       erp_order_line_num ,
       Internal_receipt_line_num;

-- end RPT_ReceiptStatusDetails


