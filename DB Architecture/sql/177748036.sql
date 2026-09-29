-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */

















CREATE PROCEDURE RPT_ExchangeShipmentDetails(
	@INTERNAL_RECEIPT_NUM numeric(9))

AS
begin
	set nocount on;
	select 
		ERP_ORDER_LINE_NUM, 
		ITEM,
		ITEM_DESC,
		TOTAL_QTY,
		OPEN_QTY,
		ITEM_WEIGHT,
		ITEM_NET_PRICE,
		(ITEM_NET_PRICE * TOTAL_QTY) TOTAL_PRICE,
		user_def1 user_defdtl1,
		user_def2 user_defdtl2,
		user_def3 user_defdtl3,
		user_def4 user_defdtl4,
		user_def5 user_defdtl5,
		user_def6 user_defdtl6,
		user_def7 user_defdtl7,
		user_def8 user_defdtl8
	from
		RECEIPT_DETAIL
	where
		INTERNAL_RECEIPT_NUM = @INTERNAL_RECEIPT_NUM
	ORDER BY
		ERP_ORDER_LINE_NUM, 
		ITEM;

end -- [comment omitted]



