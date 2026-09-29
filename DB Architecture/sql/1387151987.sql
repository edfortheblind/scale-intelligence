-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
CREATE PROCEDURE [dbo].[TRAV_BreakLabel](
	@INTERNAL_CONTAINER_NUM numeric(9))

AS
begin
	set nocount on;
select
	sc.CONTAINER_TYPE, 
	sh.LAUNCH_NUM
from
	shipping_container sc,
	shipment_header sh

where
	sh.internal_shipment_num = sc.internal_shipment_num and 
	sc.internal_container_num = @INTERNAL_CONTAINER_NUM;

end -- [comment omitted]