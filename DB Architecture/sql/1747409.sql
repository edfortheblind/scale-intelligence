-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






















-- [comment omitted]

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

		-- [comment omitted]
		-- [comment omitted]
		case
			when isnull(gterms.sys2value, N'<literal:1>') = N'<literal:2>'
				and
				sh.freight_terms is not null
				and
				sh.freight_bill_to_address1 is not null
			then sh.freight_bill_to_name
			when (
				isnull(gterms.sys2value, N'<literal:3>') = N'<literal:4>'
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
			when isnull(gterms.sys2value, N'<literal:5>') = N'<literal:6>'
				and
				sh.freight_terms is not null
				and
				sh.freight_bill_to_address1 is not null
			then sh.freight_bill_to_address1
			when (
				isnull(gterms.sys2value, N'<literal:7>') = N'<literal:8>'
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
			when isnull(gterms.sys2value, N'<literal:9>') = N'<literal:10>'
				and
				sh.freight_terms is not null
				and
				sh.freight_bill_to_address1 is not null
			then sh.freight_bill_to_address2
			when (
				isnull(gterms.sys2value, N'<literal:11>') = N'<literal:12>'
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
			when isnull(gterms.sys2value, N'<literal:13>') = N'<literal:14>'
				and
				sh.freight_terms is not null
				and
				sh.freight_bill_to_address1 is not null
			then sh.freight_bill_to_address3
			when (
				isnull(gterms.sys2value, N'<literal:15>') = N'<literal:16>'
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
			when isnull(gterms.sys2value, N'<literal:17>') = N'<literal:18>'
				and
				sh.freight_terms is not null
				and
				sh.freight_bill_to_address1 is not null
			then sh.freight_bill_to_city
			when (
				isnull(gterms.sys2value, N'<literal:19>') = N'<literal:20>'
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
			when isnull(gterms.sys2value, N'<literal:21>') = N'<literal:22>'
				and
				sh.freight_terms is not null
				and
				sh.freight_bill_to_address1 is not null
			then sh.freight_bill_to_state
			when (
				isnull(gterms.sys2value, N'<literal:23>') = N'<literal:24>'
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
			when isnull(gterms.sys2value, N'<literal:25>') = N'<literal:26>'
				and
				sh.freight_terms is not null
				and
				sh.freight_bill_to_address1 is not null
			then sh.freight_bill_to_postal_code
			when (
				isnull(gterms.sys2value, N'<literal:27>') = N'<literal:28>'
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
			when isnull(gterms.sys2value, N'<literal:29>') = N'<literal:30>'
				and
				sh.freight_terms is not null
				and
				sh.freight_bill_to_address1 is not null
			then sh.freight_bill_to_attention_to
			when (
				isnull(gterms.sys2value, N'<literal:31>') = N'<literal:32>'
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
		dbo.RPTfn_GetCommentText(sh.INTERNAL_SHIPMENT_NUM, 0, N'<literal:33>', @DOCUMENT_TYPE) hdr_comments,
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
			isnull(sh.carrier_service,N'<literal:34>') = isnull(ca.service,N'<literal:35>')
			
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
			gterms.record_type = N'<literal:36>'

	where
		sh.internal_shipment_num = @INTERNAL_SHIPMENT_NUM


	-- [comment omitted]
	-- [comment omitted]
	
	if exists(select 1 from shipping_container where internal_shipment_num = @INTERNAL_SHIPMENT_NUM)
	BEGIN

		select
			-- [comment omitted]
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

			-- [comment omitted]
			sc.quantity_um,
			sc.container_class,
			sc.container_type,

			case
				when sc.hazardous_code is null
				then null
				else N'<literal:37>'
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
				nmfc.record_type = N'<literal:38>'
				and
				nmfc.identifier = sc.nmfc_code

		where
			sc.internal_shipment_num = @INTERNAL_SHIPMENT_NUM

	-- [comment omitted]
	-- [comment omitted]

	;
	END
	ELSE
	BEGIN
		select
		-- [comment omitted]
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


			-- [comment omitted]
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
				nmfc.record_type = N'<literal:39>'
				and
				nmfc.identifier = sd.nmfc_code
		where
			sd.internal_shipment_num = @INTERNAL_SHIPMENT_NUM;
	END;

end -- [comment omitted]





