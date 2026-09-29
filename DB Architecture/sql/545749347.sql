-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */















-- [comment omitted]


CREATE PROCEDURE RPT_ShipContListHeader(
	@INTERNAL_LOAD_NUM numeric(9))

AS
begin
	set nocount on;
	select 
		whs.DESCRIPTION,
		whs.Address1,
		whs.Address2,
		whs.City,
		whs.State,
		whs.POSTAL_CODE,
		sl.CARRIER,
		sl.INTERNAL_LOAD_NUM,
 
		-- [comment omitted]
		(	select top 1 
				sc.weight_um 
			from 
				shipping_container sc

				inner join shipment_header sh
				on
					sc.internal_shipment_num = sh.internal_shipment_num

			where
				sh.shipping_load_num = @INTERNAL_LOAD_NUM
				and
				sc.weight_um is not null
		) WEIGHT_UM,

		sl.USER_DEF1 hdrUserDef1,
		sl.USER_DEF2 hdrUserDef2,
		sl.USER_DEF3 hdrUserDef3,
		sl.USER_DEF4 hdrUserDef4,
		sl.USER_DEF5 hdrUserDef5,
		sl.USER_DEF6 hdrUserDef6,
		sl.USER_DEF7 hdrUserDef7,
		sl.USER_DEF8 hdrUserDef8
		
	from
		shipping_load sl
		inner join warehouse whs
		on
		sl.warehouse = whs.warehouse

	where
		sl.internal_load_num = @INTERNAL_LOAD_NUM;		



end -- [comment omitted]



