-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */




















CREATE PROCEDURE WAP_ValOutboundReq(
	@iAlertNum numeric(9),
	@iReqNum numeric(9),
	@iSourceNum numeric(9),
	@stIdentifier1 nvarchar(25))
as
	set nocount on;

	-- [comment omitted]
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

	-- [comment omitted]
	declare @stFieldName nvarchar(50);
	declare @stOperator nvarchar(2);
	declare @stValidValue nvarchar(50);
	
	-- [comment omitted]
	declare @iValid int;
	declare @stSourceValue nvarchar(50);

	-- [comment omitted]
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

	-- [comment omitted]
	if (@iTrailingSts is null)
	begin
		delete from WAREHOUSE_ALERT_REQUEST where INTERNAL_ALERT_REQ_NUM = @iReqNum;
		return;
	end;

	-- [comment omitted]
	declare curCriteria cursor READ_ONLY for
		select CRIT.NAME, TYPECRIT.OPERATOR, CRIT.VALUE
		  from WAREHOUSE_ALERT_CRITERIA CRIT,
		       WAREHOUSE_ALERT_TYPE_CRITERIA TYPECRIT
		 where CRIT.NAME = TYPECRIT.NAME
		   and CRIT.INTERNAL_ALERT_NUM = @iAlertNum
		   and CRIT.ALERT_TYPE = TYPECRIT.ALERT_TYPE;

	-- [comment omitted]
	set @iValid = 1;
	open curCriteria;
	fetch next from curCriteria into @stFieldName, @stOperator, @stValidValue;
	while (@@FETCH_STATUS = 0 and @iValid <> 0)
	begin

		-- [comment omitted]
		if (@stFieldName = N'<literal:1>')			
	                set @stSourceValue = isnull(@stIdentifier1, N'<literal:2>');
		else if (@stFieldName = N'<literal:3>')
			set @stSourceValue = isnull(@stCarrier,N'<literal:4>');
		else if (@stFieldName = N'<literal:5>')
			set @stSourceValue = isnull(@stCarrierService, N'<literal:6>');
		else if (@stFieldName = N'<literal:7>')
			set @stSourceValue = isnull(@stCompany, N'<literal:8>');
		else if (@stFieldName = N'<literal:9>')
			set @stSourceValue = isnull(@iPriority, N'<literal:10>');
		else if (@stFieldName = N'<literal:11>')
			set @stSourceValue = isnull(@iTotalLines, N'<literal:12>');
		else if (@stFieldName = N'<literal:13>')
			set @stSourceValue = isnull(@dTotalValue, N'<literal:14>');
		else if (@stFieldName = N'<literal:15>')
			set @stSourceValue = isnull(@dTotalWeight, N'<literal:16>');
		else if (@stFieldName = N'<literal:17>')
			set @stSourceValue = isnull(@iInternalOrderNum, N'<literal:18>');
		else if (@stFieldName = N'<literal:19>')
			set @stSourceValue = isnull(@stCustomer, N'<literal:20>');
		else if (@stFieldName = N'<literal:21>')
			set @stSourceValue = isnull(@stOrderType, N'<literal:22>');
		else if (@stFieldName = N'<literal:23>')
			set @stSourceValue = isnull(@stShipTo, N'<literal:24>');
		else
			set @stSourceValue = N'<literal:25>';

		-- [comment omitted]
		-- [comment omitted]
		if ( (@stFieldName = N'<literal:26>') or (@stFieldName = N'<literal:27>') or (@stFieldName = N'<literal:28>') )
		begin

			if (@stOperator = N'<literal:29>' or @stOperator = N'<literal:30>')
			begin
				if (cast(@stSourceValue as numeric) = cast(@stValidValue as numeric))
					set @iValid = 0;
			end;
			else if (@stOperator = N'<literal:31>')
			begin
				if (cast(@stSourceValue as numeric) > cast(@stValidValue as numeric))
					set @iValid = 0;
			end;
			else if (@stOperator = N'<literal:32>')
			begin
				if (cast(@stSourceValue as numeric) < cast(@stValidValue as numeric))
					set @iValid = 0;
			end;
			else if (@stOperator = N'<literal:33>')
			begin
				if (cast(@stSourceValue as numeric) >= cast(@stValidValue as numeric))
					set @iValid = 0;
			end;
			else if (@stOperator = N'<literal:34>')
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
		
		-- [comment omitted]
		else
		begin

			if (@stOperator = N'<literal:35>' or @stOperator = N'<literal:36>')
			begin
				if (upper(@stSourceValue) = upper(@stValidValue))
					set @iValid = 0;
			end;
			else if (@stOperator = N'<literal:37>')
			begin
				if (upper(@stSourceValue) > upper(@stValidValue))
					set @iValid = 0;
			end;
			else if (@stOperator = N'<literal:38>')
			begin
				if (upper(@stSourceValue) < upper(@stValidValue))
					set @iValid = 0;
			end;
			else if (@stOperator = N'<literal:39>')
			begin
				if (upper(@stSourceValue) >= upper(@stValidValue))
					set @iValid = 0;
			end;
			else if (@stOperator = N'<literal:40>')
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


		-- [comment omitted]
		fetch next from curCriteria into @stFieldName, @stOperator, @stValidValue;
	end;
	close curCriteria;
	deallocate curCriteria;
	
	-- [comment omitted]
	if (@iValid = 0)
		delete from WAREHOUSE_ALERT_REQUEST where INTERNAL_ALERT_REQ_NUM = @iReqNum;
-- [comment omitted]


