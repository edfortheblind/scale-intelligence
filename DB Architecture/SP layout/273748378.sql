/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	16123	| MB	| 03/24/05	| Created.
	31640	| MM	| 08/18/08		| Modified to consider address in WAREHOUSE_COMP_ADDR_DETAIL

	Returns a rowset used for the header of OrderPickList.rpt.
	
	Parameters:
		parentInstr	The parent instruction number.
		documentType	The document type which will get printed.


	Returns:
		Rowset with a row for each parent instruction and summary information for
		the work instructions corresponding to that parent instruction.

*/
-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;


CREATE PROCEDURE RPT_OrderPickListHeader(
	@PARENT_INSTR numeric(9),
	@DOCUMENT_TYPE nvarchar(25))

AS
begin
	set nocount on;
	select 
		wi.work_unit,
		wi.user_assigned,
		wi.user_def1 widef1,
		wi.user_def2 widef2,
		wi.user_def3 widef3,
		wi.user_def4 widef4,
		wi.user_def5 widef5,
		wi.user_def6 widef6,
		wi.user_def7 widef7,
		wi.user_def8 widef8,
		case
			when comp.company is not null
			then comp.company
			else whs.Description
		end shipFromField,
		dbo.RPTfn_GetCommentText(wi.internal_num, 0, N'SHIPMENT', @DOCUMENT_TYPE) hdr_comments,
		comp.company,
		sh.warehouse,
		sh.Ship_To_Name,
		sh.Ship_To_Address1, 
		sh.Ship_To_Address2,
		sh.Ship_To_Address3,
		sh.Ship_To_City,
		sh.Ship_To_State,
		sh.Ship_To_POSTAL_Code,
		sh.Ship_To_Phone_NUM,
		sh.Ship_To_Country,
		sh.Carrier,
		sh.Carrier_Service,
		sh.scheduled_ship_date,
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
		end sf_postal_code
		

	from
		work_instruction_view wi
		left outer join shipment_header sh
			on
			wi.internal_num = sh.internal_shipment_num
		left outer join warehouse_comp_addr_detail wca
			on
		(
			wi.from_whs = wca.warehouse and 
			wi.company = wca.company 
		)
		left outer join company comp
			on
			wi.company = comp.company
		left outer join warehouse whs
			on
			wi.from_whs = whs.warehouse
			
	where
		wi.internal_instruction_num = @PARENT_INSTR


end -- RPT_OrderPickListHeader




