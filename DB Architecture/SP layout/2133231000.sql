/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	16086	| SWB	| 03/22/05	| Created.
	31640	| MM	| 08/14/08	| Modified to consider address in WAREHOUSE_COMP_ADDR_DETAIL


	Returns a rowset used for the header of BatchPickList.rpt.
	
	Parameters:
		PARENT_INSTR	The parent instruction number.
		DOCUMENT_TYPE	The document type which will get printed.


	Returns:
		Rowset with a row for each parent instruction and summary information for
		the work instructions corresponding to that parent instruction.

*/

-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;


CREATE PROCEDURE RPT_BatchPickListHeader(
	@PARENT_INSTR numeric(9),
	@DOCUMENT_TYPE nvarchar(25))

AS
begin
	set nocount on;
	select 
		wi.work_unit,
		wi.user_assigned,
		wi.from_whs,
		dbo.RPTfn_GetCommentText(wi.internal_num, 0, N'SHIPMENT', @DOCUMENT_TYPE) hdr_comments,
		wi.company,

		case
			when wca.company is not null
			then wca.ship_from_phone_number
			when comp.company is not null
			then comp.phone_num
			else whs.phone_num
		end ship_from_phone_num,

		case
			when wca.company is not null
			then wca.ship_from_country
			when comp.company is not null
			then comp.country
			else whs.country
		end ship_from_country,

		sh.ship_to_phone_num,
		sh.ship_to_country,
		sh.carrier, 
		sh.carrier_service,
		sh.scheduled_ship_date,
		sh.user_def1  sh_user_def1,
		sh.user_def2  sh_user_def2,
		sh.user_def3  sh_user_def3,
		sh.user_def4  sh_user_def4,
		sh.user_def5  sh_user_def5,
		sh.user_def6  sh_user_def6,
		sh.user_def7  sh_user_def7,
		sh.user_def8  sh_user_def8

	from
		work_instruction  wi
		left outer join  shipment_header sh
       		on    wi.internal_num = sh.internal_shipment_num
		
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
		wi.instruction_type = N'Header'
	and     
		wi.internal_instruction_num = @PARENT_INSTR

end -- RPT_BatchPickListHeader







