/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	16134	| SWB	| 08/29/05	| Created.

	This function is used to print a comma delimited list of BOL numbers found on a load, which is displayed on MasterBOLConsol.rpt.
*/


CREATE FUNCTION RPTfn_GetUnderlyingBOLNums(
	@internalLoadNum numeric(9))

returns varchar(2000)

begin
	declare details cursor for
	select
		distinct bol_num_alpha
	from
		shipment_header
	where
		bol_num_alpha is not null
	and 
		shipping_load_num = @internalLoadNum 
	order by
		bol_num_alpha;

	open details;

	declare @text varchar(2000);
	declare @bolNumAlpha nvarchar(25);

	fetch next from details into @bolNumAlpha;

	while (@@FETCH_STATUS = 0)
	begin
		-- cannot concat a null string.
		if (@text is null)
			set @text = @bolNumAlpha;
		else if (len(@text) + len(@bolNumAlpha) + 2 > 2000)
			break;
		else
			set @text = @text + N', ' + @bolNumAlpha;

		fetch next from details into @bolNumAlpha;
	end;

	close details;
	deallocate details;

	return @text;
end -- RPTfn_GetUnderlyingBOLNums



