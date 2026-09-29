-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */








CREATE FUNCTION RPTfn_GetMultiStopBOLNums(
	@internalLoadNum numeric(9))

returns varchar(2000)

begin
	declare details cursor for
	select
		distinct bol_num_alpha, stop_sequence
	from
		shipment_header
	where
		bol_num_alpha is not null
	and 
		shipping_load_num = @internalLoadNum 
	order by
		stop_sequence,
		bol_num_alpha;

	open details;

	declare @text varchar(2000);
	declare @bolNumAlpha nvarchar(25);
	declare @stopSequence numeric(9);
	declare @stopNumCounter numeric;
	set @stopNumCounter = 1;

	fetch next from details into @bolNumAlpha, @stopSequence;

	while (@@FETCH_STATUS = 0)
	begin
		-- [comment omitted]
		if (@text is null)
			set @text = N'<literal:1>' + cast(@stopNumCounter as varchar) + N'<literal:2>' + @bolNumAlpha;
		else if (len(@text) + len(@bolNumAlpha) + len(cast(@stopNumCounter as varchar)) + 10 > 2000)
			break;
		else
			set @text = @text + N'<literal:3>' + cast(@stopNumCounter as varchar) + N'<literal:4>' + @bolNumAlpha;
		
		set @stopNumCounter = @stopNumCounter + 1;
		fetch next from details into @bolNumAlpha, @stopSequence;
	end;

	close details;
	deallocate details;

	return @text;
end -- [comment omitted]



