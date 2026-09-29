-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







-- [comment omitted]


CREATE FUNCTION RPTfn_GetBOLStopNum(
	@internalShipmentNum numeric(9),
	@internalLoadNum numeric(9),
	@masterBOLType nvarchar(10))

returns numeric

begin
	-- [comment omitted]
	if (isnull(@masterBOLType,N'<literal:1>') <> N'<literal:2>')
	begin
		return null;
	end;

	-- [comment omitted]
	-- [comment omitted]
	-- [comment omitted]
	declare details cursor for
	select
		internal_shipment_num,
		stop_sequence,
		bol_num_alpha
	from
		shipment_header
	where
		shipping_load_num = @internalLoadNum 
	order by
		stop_sequence,
		bol_num_alpha;

	open details;

	declare @currentInternalShipmentNum numeric(9);
	declare @stopSequence numeric(9);
	declare @bolNumAlpha nvarchar(25);
	declare @stopNumCounter numeric;
	set @stopNumCounter = 1;

	fetch next from details into 
		@currentInternalShipmentNum,
		@stopSequence, -- [comment omitted]
		@bolNumAlpha; -- [comment omitted]

	while (@@FETCH_STATUS = 0)
	begin
		if (@currentInternalShipmentNum = @internalShipmentNum)
		begin
			close details;
			deallocate details;
			return @stopNumCounter;
		end;
		
		set @stopNumCounter = @stopNumCounter + 1;
		fetch next from details into 
			@currentInternalShipmentNum,
			@stopSequence, -- [comment omitted]
			@bolNumAlpha; -- [comment omitted]
	end;

	close details;
	deallocate details;
	return @stopSequence;
end -- [comment omitted]



