
/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	9882		| LJM			| 09/24/02	| Created.
	9593		| RAB			| 11/01/02	| Modified for standards.
	11870           | TBS                   | 09/16/03      | Added Multi-Byte support.
	15829		| NNP			| 08/01/05	| Made cursor Read_Only
        18311		| RLG			| 12/08/05	| Removed select from functional_area_status_flow
	19119           | SWB                   | 05/05/06      | Separated the validation of numeric fields from string type fields   
	5131			|DSK		| 07/08/2007|Modified to select total fields from Shipment Header View

	Validate a single outbound warehouse alert request.  If the request is
	invalid, delete it.

	Parameters
		int		@iAlertNum		internal alert number
		int		@iReqNum		internal alert request number
		int		@iSourceNum		internal shipment number
		String  	@stIdentifier1	        the field containing the shipment status
*/

CREATE PROCEDURE WAP_ValOutboundReq(
	@iAlertNum numeric(9),
	@iReqNum numeric(9),
	@iSourceNum numeric(9),
	@stIdentifier1 nvarchar(25))
as
	set nocount on;

	--Local variables for shipment header fields (alphabetized)
	declare @dTotalValue numeric(28,5);
	declare @dTotalWeight numeric(28,5);
	declare @iInternalOrderNum numeric(9);
	declare @iPriority numeric(3);
	declare @iTotalLines INT;
	declare @iTrailingSts numeric(3);
	declare @stCarrier nvarchar(25);
	declare @stCarrierService nvarchar(50);
	declare @stCompany nvarchar(25);
	declare @stCustomer nvarchar(25);
	declare @stOrderType nvarchar(25);
	declare @stShipTo nvarchar(25);

	--Local variables for criteria fields (alphabetized)
	declare @stFieldName nvarchar(50);
	declare @stOperator nvarchar(2);
	declare @stValidValue nvarchar(50);
	
	--Other local variables (alphabetized)
	declare @iValid int;
	declare @stSourceValue nvarchar(50);

	--Get the source fields
	select @dTotalValue = TOTAL_VALUE,
		   @dTotalWeight = TOTAL_WEIGHT,
		   @iInternalOrderNum = INTERNAL_ORDER_NUM,
		   @iPriority = PRIORITY,
		   @iTotalLines = TOTAL_LINES,
		   @iTrailingSts = TRAILING_STS,
		   @stCarrier = CARRIER,
		   @stCarrierService = CARRIER_SERVICE,
		   @stCompany = COMPANY,
		   @stCustomer = CUSTOMER,
		   @stOrderType = ORDER_TYPE,
		   @stShipTo = SHIP_TO
	  from SHIPMENT_HEADER_VIEW
	 where INTERNAL_SHIPMENT_NUM = @iSourceNum;

	--If the source is not found
	if (@iTrailingSts is null)
	begin
		delete from WAREHOUSE_ALERT_REQUEST where INTERNAL_ALERT_REQ_NUM = @iReqNum;
		return;
	end;

	--Create a cursor to retrieve the criteria fields
	declare curCriteria cursor READ_ONLY for
		select CRIT.NAME, TYPECRIT.OPERATOR, CRIT.VALUE
		  from WAREHOUSE_ALERT_CRITERIA CRIT,
		       WAREHOUSE_ALERT_TYPE_CRITERIA TYPECRIT
		 where CRIT.NAME = TYPECRIT.NAME
		   and CRIT.INTERNAL_ALERT_NUM = @iAlertNum
		   and CRIT.ALERT_TYPE = TYPECRIT.ALERT_TYPE;

	--For each criteria
	set @iValid = 1;
	open curCriteria;
	fetch next from curCriteria into @stFieldName, @stOperator, @stValidValue;
	while (@@FETCH_STATUS = 0 and @iValid <> 0)
	begin

		--Set the source value based on the criteria field
		if (@stFieldName = N'TRAILING_STS')			
	                set @stSourceValue = isnull(@stIdentifier1, N' ');
		else if (@stFieldName = N'CARRIER')
			set @stSourceValue = isnull(@stCarrier,N' ');
		else if (@stFieldName = N'CARRIER_SERVICE')
			set @stSourceValue = isnull(@stCarrierService, N' ');
		else if (@stFieldName = N'COMPANY')
			set @stSourceValue = isnull(@stCompany, N' ');
		else if (@stFieldName = N'PRIORITY')
			set @stSourceValue = isnull(@iPriority, N'-1');
		else if (@stFieldName = N'TOTAL_LINES')
			set @stSourceValue = isnull(@iTotalLines, N'-1');
		else if (@stFieldName = N'TOTAL_VALUE')
			set @stSourceValue = isnull(@dTotalValue, N'-1');
		else if (@stFieldName = N'TOTAL_WEIGHT')
			set @stSourceValue = isnull(@dTotalWeight, N'-1');
		else if (@stFieldName = N'INTERNAL_ORDER_NUM')
			set @stSourceValue = isnull(@iInternalOrderNum, N'-1');
		else if (@stFieldName = N'CUSTOMER')
			set @stSourceValue = isnull(@stCustomer, N' ');
		else if (@stFieldName = N'ORDER_TYPE')
			set @stSourceValue = isnull(@stOrderType, N' ');
		else if (@stFieldName = N'SHIP_TO')
			set @stSourceValue = isnull(@stShipTo, N' ');
		else
			set @stSourceValue = N' ';

		--Check criteria based on the operator
		--Check for Numeric type fields
		if ( (@stFieldName = N'TOTAL_LINES') or (@stFieldName = N'TOTAL_VALUE') or (@stFieldName = N'TOTAL_WEIGHT') )
		begin

			if (@stOperator = N'<>' or @stOperator = N'!=')
			begin
				if (cast(@stSourceValue as numeric) = cast(@stValidValue as numeric))
					set @iValid = 0;
			end;
			else if (@stOperator = N'<=')
			begin
				if (cast(@stSourceValue as numeric) > cast(@stValidValue as numeric))
					set @iValid = 0;
			end;
			else if (@stOperator = N'>=')
			begin
				if (cast(@stSourceValue as numeric) < cast(@stValidValue as numeric))
					set @iValid = 0;
			end;
			else if (@stOperator = N'<')
			begin
				if (cast(@stSourceValue as numeric) >= cast(@stValidValue as numeric))
					set @iValid = 0;
			end;
			else if (@stOperator = N'>')
			begin
				if (cast(@stSourceValue as numeric) <= cast(@stValidValue as numeric))
					set @iValid = 0;
			end;
			else
			begin
				if (cast(@stSourceValue as numeric) != cast(@stValidValue as numeric))
					set @iValid = 0;
			end;						

		end;
		
		--Check for String type fields
		else
		begin

			if (@stOperator = N'<>' or @stOperator = N'!=')
			begin
				if (upper(@stSourceValue) = upper(@stValidValue))
					set @iValid = 0;
			end;
			else if (@stOperator = N'<=')
			begin
				if (upper(@stSourceValue) > upper(@stValidValue))
					set @iValid = 0;
			end;
			else if (@stOperator = N'>=')
			begin
				if (upper(@stSourceValue) < upper(@stValidValue))
					set @iValid = 0;
			end;
			else if (@stOperator = N'<')
			begin
				if (upper(@stSourceValue) >= upper(@stValidValue))
					set @iValid = 0;
			end;
			else if (@stOperator = N'>')
			begin
				if (upper(@stSourceValue) <= upper(@stValidValue))
					set @iValid = 0;
			end;
			else
			begin
				if (upper(@stSourceValue) != upper(@stValidValue))
					set @iValid = 0;
			end;
			
		end;


		--Get the next criteria
		fetch next from curCriteria into @stFieldName, @stOperator, @stValidValue;
	end;
	close curCriteria;
	deallocate curCriteria;
	
	--Delete the request if the criteria not met
	if (@iValid = 0)
		delete from WAREHOUSE_ALERT_REQUEST where INTERNAL_ALERT_REQ_NUM = @iReqNum;
--end WAP_ValOutboundReq


