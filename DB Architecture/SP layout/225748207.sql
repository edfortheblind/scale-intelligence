/*
	Task	| By	| Date			| Modification Description
	---------------------------------------------------------------
	16134	| SWB	| 08/29/05		| Created.
	12931	| KRG	| 11/02/2007	| Added Container_Type in the SELECT query for fetching the containers in the Load
	31640	| MM	| 08/18/08		| Modified to consider address in WAREHOUSE_COMP_ADDR_DETAIL
	59083	| JAG	| 11/04/09		| Modified to select internal_mop_number
	Returns a rowset used for the header of MasterBOLConsol.rpt.
	
	Parameters:
		INTERNAL_LOAD_NUM       The internal load number.

	Returns:
		Rowset with a row for each internal load number and summary information for
		the load corresponding to that internal load number.

*/

-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;

CREATE PROCEDURE RPT_MasterBOLConsolHeader(
	@INTERNAL_LOAD_NUM numeric(9))	

AS
begin
	set nocount on;
	-- only use company if all shipments belong to 1 company.
	declare @company nvarchar(25);
	select
		@company = min(company)
	from
		shipment_header
	where
		shipping_load_num = @INTERNAL_LOAD_NUM
	having
		count(distinct company) = 1

	-- select load information.
	select 				
		case
			when wca.company is not null
			then wca.ship_from_name
			when comp.company is not null
			then comp.name
			else whs.description
		end sfName,
		
		case
			when wca.company is not null
			then wca.ship_from_address1
			when comp.company is not null
			then comp.address1
			else whs.address1
		end sfAddress1,

		case
			when wca.company is not null
			then wca.ship_from_address2
			when comp.company is not null
			then comp.address2
			else whs.address2
		end sfAddress2,

		case
			when wca.company is not null
			then wca.ship_from_address3
			when comp.company is not null
			then comp.address3
			else whs.address3
		end sfAddress3,

		case
			when wca.company is not null
			then wca.ship_from_city
			when comp.company is not null
			then comp.city
			else whs.city
		end sfCity,

		case
			when wca.company is not null
			then wca.ship_from_state
			when comp.company is not null
			then comp.state
			else whs.state
		end sfState,
		
		case
			when wca.company is not null
			then wca.ship_from_postal_code
			when comp.company is not null
			then comp.postal_code
			else whs.postal_code
		end sfZip,

		sa.name          stName,
		sa.address1      stAddress1,
		sa.address2      stAddress2,
		sa.address3      stAddress3, 
		sa.city          stCity,				
		sa.state         stState,
		sa.postal_code   stZip,
		sa.attention_to  stAttTo,
		sl.consolidator  locNum,
		sl.master_bol_num_alpha bolNum,
		sl.carrier,		
		sl.trailer_id    trNum,
		sl.seal_id       sealNum,
		ca.scac,
		sl.pro_num_alpha proNo,
		dbo.RPTfn_GetUnderlyingBOLNums(@INTERNAL_LOAD_NUM) bol_list,
		sl.user_def1  sl_user_def1,
		sl.user_def2  sl_user_def2,
		sl.user_def3  sl_user_def3,
		sl.user_def4  sl_user_def4,
		sl.user_def5  sl_user_def5,
		sl.user_def6  sl_user_def6,
		sl.user_def7  sl_user_def7,
		sl.user_def8  sl_user_def8
	from
		shipping_load sl
		inner join warehouse whs
		on
			whs.warehouse = sl.warehouse

		left outer join company comp
		on
			comp.company = @company

		left outer join warehouse_comp_addr_detail wca
		on
		(
			wca.warehouse = sl.warehouse and 
			wca.company = @company
		)
		
		left outer join shipping_address sa
		on
			sa.internal_load_num = sl.internal_load_num
			and
			sa.record_type = N'CONSOL'

		left outer join carrier ca
		on
			ca.carrier = sl.carrier
			and
			ca.service is null

	where
		sl.internal_load_num = @INTERNAL_LOAD_NUM


	-- now select additional information used during data transformation.
	-- this will return all the containers in the load.

	select
		-- fields for the customer order information table.
		case
			when sd.customer_po is not null
			then sd.customer_po
			else sd.erp_order
		end order_num,

		sc.weight,
		sc.internal_container_num,
		sc.parent,
		sc.tree_unit,
		sc.quantity,
		sc.internal_mop_number,

		-- additional fields for the carrier information table.
		sc.quantity_um,
		sc.container_class,
		sc.container_type,

		case
			when sc.hazardous_code is null
			then null
			else N'X'
		end hazardous_material,

		nmfc.description,
		sc.nmfc_code,
		nmfc.sys1value nmfc_class
	from
		shipment_header sh

		inner join shipping_container sc
		on
			sc.internal_shipment_num = sh.internal_shipment_num

		left outer join shipment_detail sd
		on
			sc.internal_shipment_line_num = sd.internal_shipment_line_num

		left outer join generic_config_detail nmfc
		on
			nmfc.record_type = N'NMFC'
			and
			nmfc.identifier = sc.nmfc_code

	where
		sh.shipping_load_num = @INTERNAL_LOAD_NUM

	-- NOTE THAT ORDERING IS DONE WITHIN .NET CODE BECAUSE OF THE COMPLEX SUMMARY
	-- LOGIC NECESSARY FOR THE BOL.

	;

end -- RPT_MasterBOLConsolHeader
