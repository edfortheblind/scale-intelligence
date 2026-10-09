/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	16138	| SWB	| 04/26/05	| Created.

	This function is used to print a comma delimited list of purchase order numbers for a specified shipment header.
*/


CREATE FUNCTION RPTfn_GetPurchaseOrderText(
	@internalShipmentNum numeric(9))

returns varchar(2000)

begin
	declare details cursor for
	select
		distinct customer_po
	from
		shipment_detail
	where
		customer_po is not null
	and 
		internal_Shipment_Num = @internalShipmentNum 
	order by
		customer_po;

	open details;

	declare @text varchar(2000);
	declare @customerPo nvarchar(25);

	fetch next from details into @customerPo;

	while (@@FETCH_STATUS = 0)
	begin
		-- cannot concat a null string.
		if (@text is null)
			set @text = @customerPo;
		else if (len(@text) + len(@customerPo) + 2 > 2000)
			break;
		else
			set @text = @text + N', ' + @customerPo;

		fetch next from details into @customerPo;
	end;

	close details;
	deallocate details;

	return @text;
end -- RPTfn_GetPurchaseOrderText






