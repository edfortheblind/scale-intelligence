/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	19304	| RR	| 06/06/06	| Created.

	Parameters:
		INTERNAL_CONTAINER_NUM  The internal container number.
	Returns:
		Rowset used for the header of the default break label. Add columns to select clause if other fields are required in the break label. Then add tokens in BreakLabel.lbl.

*/


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

end -- LBL_BreakLabel




