/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	16126	| SWB	| 07/01/05	| Created.
    134894  | SHS   | 05/22/14  | Removed Serial_Number_View

	This function is used to print a comma delimited list of master serial numbers in a specified shipping container.
*/


CREATE FUNCTION RPTfn_GetShipContSernText(
	@shipContNum numeric(9))

returns Varchar(2000)

begin
	-- only select master serial numbers.
	declare serns cursor for

	-- start with those without templates.
	select
		serial_number
	from
		serial_number
	where
		ship_cont_num = @shipContNum
		and
		template_id is null
    union all
    select
		serial_number
	from
		ar_serial_number
	where
		ship_cont_num = @shipContNum
		and
		template_id is null
	union all

	-- union those only tied to the master template.
	select
		sn.serial_number
	from
		serial_number sn
		
		inner join serial_num_template snt
		on
			sn.template_id = snt.object_id
			and
			snt.sequence = 0
	where
		sn.ship_cont_num = @shipContNum
    union all
    select
		asn.serial_number
	from
		ar_serial_number asn
		
		inner join serial_num_template snt
		on
			asn.template_id = snt.object_id
			and
			snt.sequence = 0
	where
		asn.ship_cont_num = @shipContNum

	order by
		serial_number;


	open serns;

	declare @text varchar(2000);
	declare @serialNumber nvarchar(50);

	fetch next from serns into @serialNumber;

	while (@@FETCH_STATUS = 0)
	begin
		-- cannot concat a null string.
		if (@text is null)
			set @text = @serialNumber;
		else if (len(@text) + len(@serialNumber) + 2 > 2000)
			break;
		else
			set @text = @text + N', ' + @serialNumber;
		
		fetch next from serns into @serialNumber;
	end;

	close serns;
	deallocate serns;

	return @text;
end -- RPTfn_GetShipContSernText
	


