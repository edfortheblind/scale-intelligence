/*
	Mod Number  | Programmer    | Date       | Modification Description
	--------------------------------------------------------------------
	18662       | RLG           | 3/1/2006	| Created.
	103500	    | DSG	    | 10/16/2012| Added rd.INTERNAL_RECEIPT_LINE_NUM

	
        This scripts selects our Report detail fields for subreport in ReceiptStatus.rpt
*/

-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;

CREATE PROCEDURE RPT_ReceiptStatusDtlsAndConts(
    @INTERNAL_RECEIPT_NUM numeric(9))
AS
    SET NOCOUNT ON;
    SELECT RD.erp_order_line_num,
           RD.item,
           RD.item_desc,
           RD.open_qty,
           RD.total_qty,
           RD.quantity_um,
           (RD.total_qty - RD.open_qty) as receivedQty,
           RD.item_net_price,
           (RD.item_net_price * RD.open_qty) openDollarAmount,
           RD.user_def1 rd_userDef1,
           RD.user_def2 rd_userDef2,
           RD.user_def3 rd_userDef3,
           RD.user_def4 rd_userDef4,
           RD.user_def5 rd_userDef5,
           RD.user_def6 rd_userDef6,
           RD.user_def7 rd_userDef7,
           RD.user_def8 rd_userDef8,
           RC.Internal_Receipt_line_num,
           RC.quantity,
           -- get status name instead of status number
           FA.status_name,
           RC.container_id,
           RC.user_def1 rc_userDef1,
           RC.user_def2 rc_userDef2,
           RC.user_def3 rc_userDef3,
           RC.user_def4 rc_userDef4,
           RC.user_def5 rc_userDef5,
           RC.user_def6 rc_userDef6,
           RC.user_def7 rc_userDef7,
           RC.user_def8 rc_userDef8,
           RC.quantity_um rc_qtyUm,
           RC.converted_loc_qty rc_convQty,
           RC.converted_qty_um rc_convQtyUm,
		   rd.INTERNAL_RECEIPT_LINE_NUM rd_internal_receipt_line_num
   FROM	
          ((receipt_detail RD 
            left outer join receipt_container RC 
            on
                     RD.internal_receipt_line_num = RC.internal_receipt_line_num ) 
            left outer join functional_area_status_flow FA  
            on 
                     FA.status = RC.status 
                     and
                     FA.functional_area = N'Inbound') 		
   WHERE
            RD.internal_receipt_num = @INTERNAL_RECEIPT_NUM 

            -- we dont want to display the parent containers.
            AND  (RC.container_type is null);

-- end RPT_ReceiptStatusDtlsAndConts


