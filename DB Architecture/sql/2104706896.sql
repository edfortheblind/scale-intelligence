-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */












CREATE PROCEDURE LBL_BreakLabel(
	@INTERNAL_CONTAINER_NUM numeric(9))

AS
begin
	set nocount on;
select
	sh.SHIPMENT_ID,
	sc.CONTAINER_ID, 
	sh.CARRIER
from
	shipping_container sc,
	shipment_header sh

where
	sh.internal_shipment_num = sc.internal_shipment_num and 
	sc.internal_container_num = @INTERNAL_CONTAINER_NUM;

end -- [comment omitted]




