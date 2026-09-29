-- DOCUMENTATION ONLY: literals/comments removed; do not execute.



CREATE PROCEDURE RPT_PurchaseOrderHeader(
	@PURCHASE_ORDER_OBJECT_ID numeric(9))

AS
begin
	set nocount on;
	select 
		purchase_order_id,
		created_date_time,
		closed_date_time,
		status,
		ship_from_address1,
		ship_from_address2,
		ship_from_address3,
		ship_from_city,
		ship_from_state,
		ship_from_postal_code,
		ship_from_name,
		warehouse,
		user_def1 poh_user_def1,
		user_def2 poh_user_def2,
		user_def3 poh_user_def3,
		user_def4 poh_user_def4,
		user_def5 poh_user_def5,
		user_def6 poh_user_def6,
		user_def7 poh_user_def7,
		user_def8 poh_user_def8
	from
		purchase_order_header
	where
		object_id  = @PURCHASE_ORDER_OBJECT_ID;


end -- [comment omitted]



