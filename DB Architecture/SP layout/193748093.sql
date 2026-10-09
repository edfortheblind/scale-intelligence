/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	17143	| MB	| 08/25/05	| Created.
	17143   | SWB   | 01/27/06      | Modified. 

	Returns a rowset used for ExchangeShipmentHeader.rpt.
	
	Parameters:
		internalReceiptNumber  The internal receipt number.

	Returns:
		Rowset with a row for each internal receipt number and summary information for
		that internal receipt number.

*/


CREATE PROCEDURE RPT_ExchangeShipmentHeader(
	@INTERNAL_RECEIPT_NUM numeric(9))

AS
begin
	set nocount on;
	select 
		rh.RECEIPT_ID,
		rh.RECEIPT_TYPE,
		rh.RECEIPT_ID_TYPE,
		rh.TOTAL_LINES,
		rh.SHIP_FROM_NAME,
		rh.SHIP_FROM_ADDRESS1,
		rh.SHIP_FROM_ADDRESS2,
		rh.SHIP_FROM_ADDRESS3,
		rh.SHIP_FROM_CITY,
		rh.SHIP_FROM_STATE,
		rh.SHIP_FROM_POSTAL_CODE,
		rh.warehouse,
		rh.TRAILING_STS Status,
		rh.CLOSE_DATE,
		rh.user_def1 user_defhdr1,
		rh.user_def2 user_defhdr2,
		rh.user_def3 user_defhdr3,
		rh.user_def4 user_defhdr4,
		rh.user_def5 user_defhdr5,
		rh.user_def6 user_defhdr6,
		rh.user_def7 user_defhdr7,
		rh.user_def8 user_defhdr8
	from
		RECEIPT_HEADER rh
	where
		rh.INTERNAL_RECEIPT_NUM = @INTERNAL_RECEIPT_NUM;


end -- RPT_ExchangeShipmentHeader



