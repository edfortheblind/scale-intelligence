-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */













-- [comment omitted]


CREATE FUNCTION RPTfn_GetLocInvSernText (
	@locInvNum numeric(9))

returns varchar(2000)
 
begin
	-- [comment omitted]
	-- [comment omitted]
	-- [comment omitted]
	if (@locInvNum is null)
		return null;

	-- [comment omitted]
	declare serns cursor for

	-- [comment omitted]
	select
		serial_number
	from
		serial_number
	where
		loc_inv_num = @locInvNum
		and
		template_id is null
    union all
    select
		serial_number
	from
		ar_serial_number
	where
		loc_inv_num = @locInvNum
		and
		template_id is null
	union all

		-- [comment omitted]
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
			sn.loc_inv_num = @locInvNum
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
			asn.loc_inv_num = @locInvNum
		order by
			serial_number;
	
		open serns;
	
	declare @text varchar(2000);
	declare @serialNumber nvarchar(50);

	fetch next from serns into @serialNumber;

	while (@@FETCH_STATUS = 0)
	begin
		-- [comment omitted]
		if (@text is null)
			set @text = @serialNumber;
		else if (len(@text) + len(@serialNumber) + 2 > 2000)
			break;
		else
			set @text = @text + N'<literal:1>' + @serialNumber;
		
		fetch next from serns into @serialNumber;
	end;

	close serns;
	deallocate serns;

	return @text;
end -- [comment omitted]
