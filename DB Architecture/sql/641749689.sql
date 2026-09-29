-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */
























-- [comment omitted]



CREATE PROCEDURE RPT_ShipmentPackListHeaderForSSRS(

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

		end sfShipFromName,

		

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

		

		sh.ship_to_name          stShipToName,

		sh.ship_to_phone_num     stPhone,

		sh.ship_to_address1      stAddress1,

		sh.ship_to_address2      stAddress2,

		sh.ship_to_address3      stAddress3, 

		sh.ship_to_city          stCity,				

		sh.ship_to_state         stState ,

		sh.ship_to_postal_code   stZip ,

		sh.ship_to_attention_to  stAttTo,

		dbo.RPTfn_GetPurchaseOrderText(sh.INTERNAL_SHIPMENT_NUM) purOrd,

		dbo.RPTfn_GetInvoiceNumberText(sh.INTERNAL_SHIPMENT_NUM) invoice,

		sh.scheduled_ship_date shpDate,

		sh.carrier, 

		sh.carrier_service carrServ,

		sh.shipment_id shipmentID,

		sh.user_def1  sh_user_def1,

		sh.user_def2  sh_user_def2,

		sh.user_def3  sh_user_def3,

		sh.user_def4  sh_user_def4,

		sh.user_def5  sh_user_def5,

		sh.user_def6  sh_user_def6,

		sh.user_def7  sh_user_def7,

		sh.user_def8  sh_user_def8,	

		dbo.RPTfn_GetCommentText(sh.INTERNAL_SHIPMENT_NUM, 0, N'<literal:1>', @DOCUMENT_TYPE) hdr_comments,

		((Select count(*) from shipping_container where container_id is not null 
and internal_shipment_num =@internal_shipment_num)-(Select count(distinct parent) from shipping_container where parent is not null and container_id is not null
and internal_shipment_num =@internal_shipment_num)) as PCount

	from

		shipment_header sh

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



	where

		sh.internal_shipment_num = @INTERNAL_SHIPMENT_NUM

;			
end -- [comment omitted]



