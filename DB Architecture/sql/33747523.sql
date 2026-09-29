-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */




















-- [comment omitted]

CREATE PROCEDURE RPT_CommonShipmentHeaderInfo(
	@INTERNAL_SHIPMENT_NUM numeric(9),
	@DOCUMENT_TYPE nvarchar(25))

AS
begin
	set nocount on;
	select 
		shv.shipment_id,
		shv.customer,
		dbo.RPTfn_GetPurchaseOrderText(@INTERNAL_SHIPMENT_NUM) customer_po,
		sd.order_date,
		shv.scheduled_ship_date,
		shv.order_type,

		case
			when wca.company is not null
			then wca.ship_from_name
			when comp.company is not null
			then comp.name
			else whs.description
		end sf_name,
		
		case
			when wca.company is not null
			then wca.ship_from_address1
			when comp.company is not null
			then comp.address1
			else whs.address1
		end sf_address1,

		case
			when wca.company is not null
			then wca.ship_from_address2
			when comp.company is not null
			then comp.address2
			else whs.address2
		end sf_address2,

		case
			when wca.company is not null
			then wca.ship_from_address3
			when comp.company is not null
			then comp.address3
			else whs.address3
		end sf_address3,

		case
			when wca.company is not null
			then wca.ship_from_city
			when comp.company is not null
			then comp.city
			else whs.city
		end sf_city,

		case
			when wca.company is not null
			then wca.ship_from_state
			when comp.company is not null
			then comp.state
			else whs.state
		end sf_state,
		
		case
			when wca.company is not null
			then wca.ship_from_postal_code
			when comp.company is not null
			then comp.postal_code
			else whs.postal_code
		end sf_postal_code,

		shv.customer_name         c_name,
		shv.customer_address1     c_address1,
		shv.customer_address2     c_address2,
		shv.customer_address3     c_address3,
		shv.customer_city         c_city,
		shv.customer_state        c_state ,
		shv.customer_postal_code  c_postal_code,
		shv.customer_attention_to c_attention_to,
		shv.ship_to_name          st_name ,
		shv.ship_to_address1      st_address1,
		shv.ship_to_address2      st_address2,
		shv.ship_to_address3      st_address3, 
		shv.ship_to_city          st_city,				
		shv.ship_to_state         st_state ,
		shv.ship_to_postal_code   st_postal_code ,
		shv.ship_to_attention_to  st_attention_to,
		shv.total_weight,
		shv.requested_delivery_type req_del_type,
		shv.requested_delivery_date req_del_date,
		dbo.RPTfn_GetCommentText(@INTERNAL_SHIPMENT_NUM, 0, N'<literal:1>', @DOCUMENT_TYPE) hdr_comments,
		shv.carrier, 
		shv.carrier_service,
		shv.warehouse,
		shv.company,
		shv.customer_phone_num  c_phone_num,
		shv.customer_country    c_country,
		shv.ship_to_phone_num   st_phone_num,
		shv.ship_to_country     st_country,
		shv.user_def1  sh_user_def1,
		shv.user_def2  sh_user_def2,
		shv.user_def3  sh_user_def3,
		shv.user_def4  sh_user_def4,
		shv.user_def5  sh_user_def5,
		shv.user_def6  sh_user_def6,
		shv.user_def7  sh_user_def7,
		shv.user_def8  sh_user_def8,
		shv.base_freight_charge,
		shv.total_value,
		shv.total_freight_charge,
		shv.erp_order
	from
		shipment_header_view shv
		left outer join warehouse_comp_addr_detail wca
		on
		(
			shv.warehouse = wca.warehouse and 
			shv.company = wca.company
		)
		left outer join company comp
		on
			shv.company = comp.company

		left outer join warehouse whs
		on
			shv.warehouse = whs.warehouse

		left outer join (
			select 
				min(order_date) order_date 
			from 
				shipment_detail
	                where
                                shipment_detail.internal_shipment_num = @INTERNAL_SHIPMENT_NUM) sd

		on 1=1 -- [comment omitted]

	where
		shv.internal_shipment_num = @INTERNAL_SHIPMENT_NUM;	

end -- [comment omitted]

