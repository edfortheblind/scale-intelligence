-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */








CREATE FUNCTION RPTfn_GetInvoiceNumberText(
	@internalShipmentNum numeric(9))

returns varchar(2000)

begin
	declare details cursor for
	select
		distinct invoice
	from
		shipment_detail
	where
		invoice is not null
	and 
		internal_Shipment_Num = @internalShipmentNum 
	order by
		invoice;

	open details;

	declare @text varchar(2000);
	declare @invoice nvarchar(25);

	fetch next from details into @invoice;

	while (@@FETCH_STATUS = 0)
	begin
		-- [comment omitted]
		if (@text is null)
			set @text = @invoice;
		else if (len(@text) + len(@invoice) + 2 > 2000)
			break;
		else
			set @text = @text + N'<literal:1>' + @invoice;

		fetch next from details into @invoice;
	end;

	close details;
	deallocate details;

	return @text;
end -- [comment omitted]






