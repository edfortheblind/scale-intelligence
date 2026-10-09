/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	16126	| SWB	| 06/27/05	| Created.
	31640	| MM	| 08/14/08	| Modified to consider address in WAREHOUSE_COMP_ADDR_DETAIL

	Returns a rowset used for the header of ContainerPackList.rpt.
	
	Parameters:
		INTERNAL_CONTAINER_NUM	The internal container number.
		DOCUMENT_TYPE	        The document type which will get printed.


	Returns:
		Rowset with a row for each internal container number and summary information for
		the container corresponding to that internal container number.

*/

-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;


CREATE PROCEDURE RPT_ContainerPackListHeader(
	@INTERNAL_CONTAINER_NUM numeric(9),
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
		sc.container_id parentContId,
		sc.container_type parentContType,
		sc.weight tlWeight, 
		sc.weight_um tlWeightUM,
		dbo.RPTfn_GetInvoiceNumberText(sh.INTERNAL_SHIPMENT_NUM) invoice,
		sh.scheduled_ship_date shpDate,
		sh.carrier, 
		sh.carrier_service carrServ,
		sh.shipment_id shipmentID,
		sc.user_def1  sc_user_def1,
		sc.user_def2  sc_user_def2,
		sc.user_def3  sc_user_def3,
		sc.user_def4  sc_user_def4,
		sc.user_def5  sc_user_def5,
		sc.user_def6  sc_user_def6,
		sc.user_def7  sc_user_def7,
		sc.user_def8  sc_user_def8,	
		dbo.RPTfn_GetCommentText(sh.INTERNAL_SHIPMENT_NUM, 0, N'SHIPMENT', @DOCUMENT_TYPE) hdr_comments
	from
		shipping_container sc
		inner join shipment_header sh
       		on    sc.internal_shipment_num = sh.internal_shipment_num

		left outer join warehouse_comp_addr_detail wca
		on
		(
			sc.warehouse = wca.warehouse and 
			sc.company = wca.company
		)
		left outer join company comp
		on
			sc.company = comp.company

		left outer join warehouse whs
		on
			sc.warehouse = whs.warehouse

	where
		sc.internal_container_num = @INTERNAL_CONTAINER_NUM

end -- RPT_ContainerPackListHeader







