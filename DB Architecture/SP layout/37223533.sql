/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	19023	| SP	| 06/07/06	| Created.

	Parameters:
		INTERNAL_CONTAINER_NUM  The internal container number.
	Returns:
		Rowset used for the header of GS1-AI label. 

*/


CREATE PROCEDURE LBL_GS1AILabelHeader(
	@INTERNAL_CONTAINER_NUM numeric(9))

AS
begin
	set nocount on;
select
	sc.INTERNAL_CONTAINER_NUM, 
	substring(sc.CONTAINER_ID,3,18) as CONTAINER_ID, 
	sc.USER_DEF1, 
	sc.USER_DEF2, 
	sc.USER_DEF3, 
	sc.USER_DEF4, 
	sc.USER_DEF5, 
	sc.USER_DEF6, 
	sc.USER_DEF7, 
	sc.USER_DEF8,
	w.DESCRIPTION as WAREHOUSE,
	w.ADDRESS1,
	w.ADDRESS2,
	w.ADDRESS3,
	w.CITY,
	w.STATE,
	w.COUNTRY,
	w.POSTAL_CODE
from
	SHIPPING_CONTAINER sc,
	WAREHOUSE w
where
	sc.INTERNAL_CONTAINER_NUM = @INTERNAL_CONTAINER_NUM
	AND sc.WAREHOUSE = w.WAREHOUSE;

end -- LBL_GS1AILabelHeader




