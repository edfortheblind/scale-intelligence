/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	16128	| MB	| 05/31/05	| Created.
    134894  | SHS   | 05/22/14  | Removed Serial_Number_View
	Returns a rowset used for CCListWSerns.rpt.
	
	Parameters:
		locInvNum  The Location Inventory Number.

	Returns:
		This function is used to print a comma delimited list of master serial numbers a specified location inventory record.

*/
-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;


CREATE FUNCTION RPTfn_GetLocInvSernText (
	@locInvNum numeric(9))

returns varchar(2000)
 
begin
	-- if the query calling this function left outer joined
	-- to the location_inventory table and the location was
	-- empty, locInvNum will be null.
	if (@locInvNum is null)
		return null;

	-- only select master serial numbers.
	declare serns cursor for

	-- start with those without templates.
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
end -- RPTfn_GetLocInvSernText
