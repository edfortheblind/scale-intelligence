-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */



















-- [comment omitted]


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
		dbo.RPTfn_GetCommentText(wi.internal_num, 0, N'<literal:1>', @DOCUMENT_TYPE) hdr_comments,
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
		wi.instruction_type = N'<literal:2>'
	and     
		wi.internal_instruction_num = @PARENT_INSTR

end -- [comment omitted]







