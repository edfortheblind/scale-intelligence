-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */














CREATE PROCEDURE RPT_ShipmentVasActivityListDetails(
	@INTERNAL_SHIPMENT_NUM numeric(9))
AS
begin
	set nocount on;
	select 	
		sc.INTERNAL_CONTAINER_NUM internal_container_num,
		sc.CONTAINER_ID container_id,
		sc.user_def1  user_def1,
		sc.user_def2  user_def2,
		sc.user_def3  user_def3,
		sc.user_def4  user_def4,
		sc.user_def5  user_def5,
		sc.user_def6  user_def6,
		sc.user_def7  user_def7,
		sc.user_def8  user_def8
	from
		SHIPPING_CONTAINER sc with(nolock)
	where
		sc.INTERNAL_SHIPMENT_NUM = @INTERNAL_SHIPMENT_NUM
		and sc.CONTAINER_TYPE <> N'<literal:1>'
		and exists 
		(select 1 from SHIPPING_CONT_VAS_ACTIVITY scv with(nolock) 
		 where scv.INTERNAL_CONTAINER_NUM = sc.INTERNAL_CONTAINER_NUM)

end -- [comment omitted]


