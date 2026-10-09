/*
	Mod Number  | Programmer    | Date       | Modification Description
	--------------------------------------------------------------------
	132313       | NVS          | 2/18/2014	 | Created.

        This scripts selects our Report Header fields for ReceiptStatus.rpt
*/
-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;


CREATE PROCEDURE RPT_ReceivingWorksheet(@INTERNAL_RECEIPT_NUM numeric(9), @DOCUMENT_TYPE nvarchar(25))
    
AS
   begin
      set nocount on;
      SELECT
              RECEIPT_DETAIL.warehouse, 
              RECEIPT_DETAIL.RECEIPT_ID, 
                  RECEIPT_DETAIL.ITEM, 
                  RECEIPT_DETAIL.ITEM_DESC, 
                  RECEIPT_DETAIL.TOTAL_QTY, 
                  RECEIPT_DETAIL.OPEN_QTY, 
                  RECEIPT_DETAIL.QUANTITY_UM, 
                  RECEIPT_DETAIL.ERP_ORDER_NUM, 
                  RECEIPT_DETAIL.ERP_ORDER_LINE_NUM, 
                  RECEIPT_DETAIL.ITEM_WEIGHT, 
                  RECEIPT_DETAIL.ITEM_LENGTH, 
                  RECEIPT_DETAIL.ITEM_WIDTH, 
                  RECEIPT_DETAIL.ITEM_HEIGHT, 
                  RECEIPT_DETAIL.WEIGHT_UM, 
                  RECEIPT_DETAIL.USER_DEF1, 
                  RECEIPT_DETAIL.SHIP_FROM, 
                  RECEIPT_DETAIL.RECEIPT_DATE, 
                  RECEIPT_HEADER.RECEIPT_ID_TYPE, 
                  WAREHOUSE.ADDRESS1, 
                  WAREHOUSE.CITY, 
                  WAREHOUSE.STATE, 
                  WAREHOUSE.COUNTRY, 
                  WAREHOUSE.POSTAL_CODE,  
                  receipt_header.total_qty as ttlrecqty
FROM            
      RECEIPT_DETAIL 
            INNER JOIN 
      RECEIPT_HEADER 
            ON RECEIPT_DETAIL.INTERNAL_RECEIPT_NUM = RECEIPT_HEADER.INTERNAL_RECEIPT_NUM 
            INNER JOIN
      WAREHOUSE 
            ON RECEIPT_DETAIL.warehouse = WAREHOUSE.warehouse
      where
            receipt_header.internal_receipt_num = @INTERNAL_RECEIPT_NUM

end -- RPT_ReceivingWorksheet



