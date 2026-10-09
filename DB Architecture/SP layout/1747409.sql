/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	16125	| SWB	| 07/19/05	| Created.
	18145	| SAT	| 01/06/05	| Modified to return NMFC information when there
					| are no containers
	20031	| RLG	| 10/12/06	| Added Container_type in the select fields.
	31640	| MM	| 08/14/08	| Modified to consider address in WAREHOUSE_COMP_ADDR_DETAIL
	34741	| MM	| 09/05/08	| Considering WAREHOUSE_COMP_ADDR_DETAIL for freight bill to	
	59083	| JAG	| 11/04/09	| Modified to select internal_mop_number
	Returns a rowset used for the header of BillOfLading.rpt.
	
	Parameters:
		INTERNAL_SHIPMENT_NUM	The internal shipment number.
		DOCUMENT_TYPE	        The document type which will get printed.


	Returns:
		Rowset with a row for each internal shipment number and summary information for
		the shipment corresponding to that internal shipment number.

*/

-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;

CREATE PROCEDURE RPT_BillOfLadingHeader(
	@INTERNAL_SHIPMENT_NUM numeric(9),
	@DOCUMENT_TYPE nvarchar(25))

AS
begin
	set nocount on;
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

		sh.shipment_id sfSid,
		sh.bol_num_alpha,
		sh.ship_to_name          stName,
		sh.ship_to_address1      stAddress1,
		sh.ship_to_address2      stAddress2,
		sh.ship_to_address3      stAddress3, 
		sh.ship_to_city          stCity,				
		sh.ship_to_state         stState,
		sh.ship_to_postal_code   stZip,
		sh.customer              stCid, 
		sh.ship_to_attention_to  stAttTo,
		sh.ship_to               locNum,
		sh.carrier,
		ca.service,
		sl.trailer_id            trNum,
		sl.seal_id               sealNum,
		ca.scac,
		sh.pro_num_alpha         proNo,

		-- determine the freight bill to information.
		-- note that the sys2value of gterms is "Shipper Pays Freight".
		case
			when isnull(gterms.sys2value, N'N') = N'N'
				and
				sh.freight_terms is not null
				and
				sh.freight_bill_to_address1 is not null
			then sh.freight_bill_to_name
			when (
				isnull(gterms.sys2value, N'N') = N'Y'
				OR
				sh.freight_terms is null
				)
			then case
				when sh.company is null
					and whs.freight_bill_to_address1 is not null
				then whs.freight_bill_to_name
				when wca.freight_bill_to_address1 is not null
				then wca.freight_bill_to_name
				when wca.company is not null
				then wca.ship_from_name
				when comp.freight_bill_to_address1 is not null
				then comp.freight_bill_to_name
				when comp.company is not null
				then comp.name
				else whs.description
			end
		end tName,

		case
			when isnull(gterms.sys2value, N'N') = N'N'
				and
				sh.freight_terms is not null
				and
				sh.freight_bill_to_address1 is not null
			then sh.freight_bill_to_address1
			when (
				isnull(gterms.sys2value, N'N') = N'Y'
				OR
				sh.freight_terms is null
				)
			then case
				when sh.company is null
					and whs.freight_bill_to_address1 is not null
				then whs.freight_bill_to_address1
				when wca.freight_bill_to_address1 is not null
				then wca.freight_bill_to_address1
				when wca.company is not null
				then wca.ship_from_address1
				when comp.freight_bill_to_address1 is not null
				then comp.freight_bill_to_address1
				when comp.company is not null
				then comp.address1
				else whs.address1
			end
		end tAddress1,

		case
			when isnull(gterms.sys2value, N'N') = N'N'
				and
				sh.freight_terms is not null
				and
				sh.freight_bill_to_address1 is not null
			then sh.freight_bill_to_address2
			when (
				isnull(gterms.sys2value, N'N') = N'Y'
				OR
				sh.freight_terms is null
				)
			then case
				when sh.company is null
					and whs.freight_bill_to_address1 is not null
				then whs.freight_bill_to_address2
				when wca.freight_bill_to_address1 is not null
				then wca.freight_bill_to_address2
				when wca.company is not null
				then wca.ship_from_address2
				when comp.freight_bill_to_address1 is not null
				then comp.freight_bill_to_address2
				when comp.company is not null
				then comp.address2
				else whs.address2
				end
		end tAddress2,

		case
			when isnull(gterms.sys2value, N'N') = N'N'
				and
				sh.freight_terms is not null
				and
				sh.freight_bill_to_address1 is not null
			then sh.freight_bill_to_address3
			when (
				isnull(gterms.sys2value, N'N') = N'Y'
				OR
				sh.freight_terms is null
				)
			then case
				when sh.company is null
					and whs.freight_bill_to_address1 is not null
				then whs.freight_bill_to_address3
				when wca.freight_bill_to_address1 is not null
				then wca.freight_bill_to_address3
				when wca.company is not null
				then wca.ship_from_address3
				when comp.freight_bill_to_address1 is not null
				then comp.freight_bill_to_address3
				when comp.company is not null
				then comp.address3
				else whs.address3
			end
		end tAddress3,

		case
			when isnull(gterms.sys2value, N'N') = N'N'
				and
				sh.freight_terms is not null
				and
				sh.freight_bill_to_address1 is not null
			then sh.freight_bill_to_city
			when (
				isnull(gterms.sys2value, N'N') = N'Y'
				OR
				sh.freight_terms is null
				)
			then case
				when sh.company is null
					and whs.freight_bill_to_address1 is not null
				then whs.freight_bill_to_city
				when wca.freight_bill_to_address1 is not null
				then wca.freight_bill_to_city
				when wca.company is not null
				then wca.ship_from_city
				when comp.freight_bill_to_address1 is not null
				then comp.freight_bill_to_city
				when comp.company is not null
				then comp.city
				else whs.city
			end
		end tCity,

		case
			when isnull(gterms.sys2value, N'N') = N'N'
				and
				sh.freight_terms is not null
				and
				sh.freight_bill_to_address1 is not null
			then sh.freight_bill_to_state
			when (
				isnull(gterms.sys2value, N'N') = N'Y'
				OR
				sh.freight_terms is null
				)
			then case
				when sh.company is null
					and whs.freight_bill_to_address1 is not null
				then whs.freight_bill_to_state
				when wca.freight_bill_to_address1 is not null
				then wca.freight_bill_to_state
				when wca.company is not null
				then wca.ship_from_state
				when comp.freight_bill_to_address1 is not null
				then comp.freight_bill_to_state
				when comp.company is not null
				then comp.state
				else whs.state
			end
		end tState,

		case
			when isnull(gterms.sys2value, N'N') = N'N'
				and
				sh.freight_terms is not null
				and
				sh.freight_bill_to_address1 is not null
			then sh.freight_bill_to_postal_code
			when (
				isnull(gterms.sys2value, N'N') = N'Y'
				OR
				sh.freight_terms is null
				)
			then case
				when sh.company is null
					and whs.freight_bill_to_address1 is not null
				then whs.freight_bill_to_postal_code
				when wca.freight_bill_to_address1 is not null
				then wca.freight_bill_to_postal_code
				when wca.company is not null
				then wca.ship_from_postal_code
				when comp.freight_bill_to_address1 is not null
				then comp.freight_bill_to_postal_code
				when comp.company is not null
				then comp.postal_code
				else whs.postal_code
			end
		end tZip,

		case
			when isnull(gterms.sys2value, N'N') = N'N'
				and
				sh.freight_terms is not null
				and
				sh.freight_bill_to_address1 is not null
			then sh.freight_bill_to_attention_to
			when (
				isnull(gterms.sys2value, N'N') = N'Y'
				OR
				sh.freight_terms is null
				)
			then case
				when sh.company is null
					and whs.freight_bill_to_address1 is not null
				then whs.freight_bill_to_attention_to
				when wca.freight_bill_to_address1 is not null
				then wca.freight_bill_to_att_to
				when wca.company is not null
				then wca.ship_from_attention_to
				when comp.freight_bill_to_address1 is not null
				then comp.freight_bill_to_attention_to
				when comp.company is not null
				then comp.attention_to
				else whs.attention_to
			end
		end tAttTo,

		sh.freight_terms,
		sl.master_bol_num_alpha,
		dbo.RPTfn_GetBOLStopNum(sh.INTERNAL_SHIPMENT_NUM, sl.internal_load_num, sl.master_bol_type) stop_number,
		dbo.RPTfn_GetCommentText(sh.INTERNAL_SHIPMENT_NUM, 0, N'SHIPMENT', @DOCUMENT_TYPE) hdr_comments,
		sh.user_def1  sh_user_def1,
		sh.user_def2  sh_user_def2,
		sh.user_def3  sh_user_def3,
		sh.user_def4  sh_user_def4,
		sh.user_def5  sh_user_def5,
		sh.user_def6  sh_user_def6,
		sh.user_def7  sh_user_def7,
		sh.user_def8  sh_user_def8

	from
		shipment_header sh

		left outer join shipping_load sl
		on
			sh.shipping_load_num = sl.internal_load_num
			
		left outer join carrier ca
		on
			sh.carrier = ca.carrier
			and
			isnull(sh.carrier_service,N'!') = isnull(ca.service,N'!')
			
		left outer join warehouse_comp_addr_detail wca
		on
		(
			sh.warehouse = wca.warehouse and 
			sh.company = wca.company
		)

		left outer join company comp
		on
			sh.company = comp.company
		
		left outer join warehouse whs
		on
			sh.warehouse = whs.warehouse
			
		left outer join generic_config_detail gterms
		on
			sh.freight_terms = gterms.identifier
			and
			gterms.record_type = N'FR TERMS'

	where
		sh.internal_shipment_num = @INTERNAL_SHIPMENT_NUM


	-- now select additional information used during data transformation.
	-- this will return all the containers in the shipment.
	
	if exists(select 1 from shipping_container where internal_shipment_num = @INTERNAL_SHIPMENT_NUM)
	BEGIN

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
			shipping_container sc

			left outer join shipment_detail sd
			on
				sc.internal_shipment_line_num = sd.internal_shipment_line_num

			left outer join generic_config_detail nmfc
			on
				nmfc.record_type = N'NMFC'
				and
				nmfc.identifier = sc.nmfc_code

		where
			sc.internal_shipment_num = @INTERNAL_SHIPMENT_NUM

	-- NOTE THAT ORDERING IS DONE WITHIN .NET CODE BECAUSE OF THE COMPLEX SUMMARY
	-- LOGIC NECESSARY FOR THE BOL.

	;
	END
	ELSE
	BEGIN
		select
		-- fields for the customer order information table.
			case
				when sd.customer_po is not null
				then sd.customer_po
				else sd.erp_order
			end order_num,

			sd.total_weight weight,
			null internal_container_num,
			null parent,
			null tree_unit,
			null quantity,


			-- additional fields for the carrier information table.
			null quantity_um,
			null container_class,
			null hazardous_material,
			nmfc.description,
			sd.nmfc_code,
			nmfc.sys1value nmfc_class
		from
			shipment_detail sd
			left outer join generic_config_detail nmfc
			on
				nmfc.record_type = N'NMFC'
				and
				nmfc.identifier = sd.nmfc_code
		where
			sd.internal_shipment_num = @INTERNAL_SHIPMENT_NUM;
	END;

end -- RPT_BillOfLadingHeader





