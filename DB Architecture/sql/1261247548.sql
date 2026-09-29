-- DOCUMENTATION ONLY: literals/comments removed; do not execute.



/* [comment omitted] */

/* [comment omitted] */
create function fn_record_type(
	@warehouse_grp int,
	@status_grp int,
	@receipt_date_grp int,
	@receipt_type_grp int,
	@company_grp int,
	@carrier_grp int,
	@carrier_service_grp int,
	@source_id_grp int,
	@source_name_grp int,
	@source_state_grp int)
RETURNS nvarchar(10)
AS
begin
	declare @return nvarchar(10)
	set @return = CASE 
	WHEN @warehouse_grp = 0
	 and @status_grp = 0
	 and @receipt_date_grp = 0
	 and @receipt_type_grp = 1
	 and @company_grp = 1
	 and @carrier_grp = 1
	 and @carrier_service_grp = 1
	 and @source_id_grp = 1
	 and @source_name_grp = 1
	 and @source_state_grp = 1 THEN '<literal:1>'
	WHEN @warehouse_grp = 0
	 and @status_grp = 0
	 and @receipt_date_grp = 0
	 and @receipt_type_grp = 1
	 and @company_grp = 1
	 and @carrier_grp = 1
	 and @carrier_service_grp = 1
	 and @source_id_grp = 1
	 and @source_name_grp = 1
	 and @source_state_grp = 0 THEN '<literal:2>'
	WHEN @warehouse_grp = 0
	 and @status_grp = 0
	 and @receipt_date_grp = 0
	 and @receipt_type_grp = 1
	 and @company_grp = 0
	 and @carrier_grp = 1
	 and @carrier_service_grp = 1
	 and @source_id_grp = 0
	 and @source_name_grp = 0
	 and @source_state_grp = 1 THEN '<literal:3>'
	WHEN @warehouse_grp = 0
	 and @status_grp = 0
	 and @receipt_date_grp = 0
	 and @receipt_type_grp = 1
	 and @company_grp = 1
	 and @carrier_grp = 0
	 and @carrier_service_grp = 0
	 and @source_id_grp = 1
	 and @source_name_grp = 1
	 and @source_state_grp = 1 THEN '<literal:4>'
	WHEN @warehouse_grp = 0
	 and @status_grp = 0
	 and @receipt_date_grp = 0
	 and @receipt_type_grp = 0
	 and @company_grp = 1
	 and @carrier_grp = 1
	 and @carrier_service_grp = 1
	 and @source_id_grp = 1
	 and @source_name_grp = 1
	 and @source_state_grp = 1 THEN '<literal:5>'
	ELSE '<literal:6>'
	END

	return @return
end