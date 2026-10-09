


CREATE PROCEDURE RPT_PurchaseOrderDetails(
	@PURCHASE_ORDER_OBJECT_ID numeric(9))

AS
begin
	set nocount on;
	select 
		line_number,
		item,
		item_desc,
		total_quantity,
		open_quantity,
		(item_weight * total_quantity) line_weight,
		item_net_price,
		(item_net_price * total_quantity) total_price,
		user_def1 pod_user_def1,
		user_def2 pod_user_def2,
		user_def3 pod_user_def3,
		user_def4 pod_user_def4,
		user_def5 pod_user_def5,
		user_def6 pod_user_def6,
		user_def7 pod_user_def7,
		user_def8 pod_user_def8
	from
		purchase_order_detail
	where
		purchase_order_object_id  = @PURCHASE_ORDER_OBJECT_ID
	Order by
		line_number,
		item;

end -- RPT_PurchaseOrderDetails



