-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */
















-- [comment omitted]

CREATE PROCEDURE RPT_MasterBOLMultiStopHeader(
	@INTERNAL_LOAD_NUM numeric(9))	

AS
begin
	set nocount on;
	-- [comment omitted]
	declare @company nvarchar(25);
	select
		@company = min(company)
	from
		shipment_header
	where
		shipping_load_num = @INTERNAL_LOAD_NUM
	having
		count(distinct company) = 1

	-- [comment omitted]
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

		lastStop.ship_to               stName,
		lastStop.ship_to_address1      stAddress1,
		lastStop.ship_to_address2      stAddress2,
		lastStop.ship_to_address3      stAddress3, 
		lastStop.ship_to_city          stCity,				
		lastStop.ship_to_state         stState,
		lastStop.ship_to_postal_code   stZip,
		lastStop.ship_to_attention_to  stAttTo,
		sl.consolidator  locNum,
		sl.master_bol_num_alpha bolNum,
		sl.carrier,
		sl.trailer_id    trNum,
		sl.seal_id       sealNum,
		ca.scac,
		sl.pro_num_alpha proNo,
		dbo.RPTfn_GetMultiStopBOLNums(@INTERNAL_LOAD_NUM) stop_list,
		sl.user_def1  sl_user_def1,
		sl.user_def2  sl_user_def2,
		sl.user_def3  sl_user_def3,
		sl.user_def4  sl_user_def4,
		sl.user_def5  sl_user_def5,
		sl.user_def6  sl_user_def6,
		sl.user_def7  sl_user_def7,
		sl.user_def8  sl_user_def8
	from
		-- [comment omitted]
		(select top 1
			ship_to,          
			ship_to_address1,      
			ship_to_address2,      
			ship_to_address3,      
			ship_to_city,          
			ship_to_state,         
			ship_to_postal_code,   
			ship_to_attention_to  
		from
			shipment_header
		where
			shipping_load_num = @INTERNAL_LOAD_NUM
        	order by
			stop_sequence desc
		) lastStop,

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
		
		left outer join carrier ca
		on
			ca.carrier = sl.carrier
			and
			ca.service is null
	where
		sl.internal_load_num = @INTERNAL_LOAD_NUM


	-- [comment omitted]
	-- [comment omitted]

	select
		case
			when sd.customer_po is not null
			then sd.customer_po
			else sd.erp_order
		end order_num,

		sc.internal_container_num,
		sc.parent,
		sc.tree_unit,
		sc.container_type,
		sc.weight,
		sc.quantity,
		sc.internal_mop_number
	from
		shipment_header sh

		inner join shipping_container sc
		on
			sc.internal_shipment_num = sh.internal_shipment_num
			and
			(
				-- [comment omitted]
				sc.internal_container_num = sc.tree_unit

				or

				-- [comment omitted]
				sc.parent = sc.tree_unit
			)

		left outer join shipment_detail sd
		on
			sc.internal_shipment_line_num = sd.internal_shipment_line_num

	where
		sh.shipping_load_num = @INTERNAL_LOAD_NUM


	-- [comment omitted]
	-- [comment omitted]

	;

end -- [comment omitted]
