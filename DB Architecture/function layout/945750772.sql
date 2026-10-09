/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	16125	| RAB	| 09/21/05	| Created.

	This function determines the stop number of the specified shipment.
*/

-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;


CREATE FUNCTION RPTfn_GetBOLStopNum(
	@internalShipmentNum numeric(9),
	@internalLoadNum numeric(9),
	@masterBOLType nvarchar(10))

returns numeric

begin
	-- do nothing if not a multi-stop master bol.
	if (isnull(@masterBOLType,N'!') <> N'MULTI STOP')
	begin
		return null;
	end;

	-- otherwise, determine what stop it is using the stop_sequence
	-- and bol_num_alpha fields.  Note that stop_sequence is not necessarilly
	-- 1,2,3,4, etc, so we use a counter to determine the stop number.
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
		@stopSequence, -- not used, only selected because of order by
		@bolNumAlpha; -- not used, only selected because of order by

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
			@stopSequence, -- not used, only selected because of order by
			@bolNumAlpha; -- not used, only selected because of order by
	end;

	close details;
	deallocate details;
	return @stopSequence;
end -- RPTfn_GetBOLStopNum



