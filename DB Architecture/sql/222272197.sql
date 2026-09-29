-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */
















CREATE PROCEDURE WAP_ValInboundReq(
	@iAlertNum numeric(9),
	@iReqNum numeric(9),
	@iSourceNum numeric(9),
	@stIdentifier1 nvarchar(25))
as
	set nocount on;

	-- [comment omitted]
	declare @dTotalValue numeric(28,5);
	declare @dTotalWeight numeric(28,5);
	declare @iPriority numeric(3);
	declare @iTotalLines numeric(9);
	declare @iTrailingSts numeric(3);
	declare @stCarrier nvarchar(25);
	declare @stCarrierService nvarchar(50);
	declare @stCompany nvarchar(25);
	declare @stReceiptIDType nvarchar(25);
	declare @stShipFrom nvarchar(25);
	declare @stSourceID nvarchar(25);

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
		   @iPriority = PRIORITY,
		   @iTotalLines = TOTAL_LINES,
		   @iTrailingSts = TRAILING_STS,
		   @stCarrier = CARRIER,
		   @stCarrierService = CARRIER_SERVICE,
		   @stCompany = COMPANY,
		   @stReceiptIDType = RECEIPT_ID_TYPE,
		   @stShipFrom = SHIP_FROM,
		   @stSourceID = SOURCE_ID
	  from RECEIPT_HEADER
	 where INTERNAL_RECEIPT_NUM = @iSourceNum;

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
			set @stSourceValue = isnull(@stIdentifier1,N'<literal:2>');			
		else if (@stFieldName = N'<literal:3>')
			set @stSourceValue = isnull(@stCarrier,N'<literal:4>');
		else if (@stFieldName = N'<literal:5>')
			set @stSourceValue = isnull(@stCarrierService, N'<literal:6>');
		else if (@stFieldName = N'<literal:7>')
			set @stSourceValue = isnull(@stCompany, N'<literal:8>');
		else if (@stFieldName = N'<literal:9>')
			set @stSourceValue = isnull(@iPriority, N'<literal:10>');
		else if (@stFieldName = N'<literal:11>')
			set @stSourceValue = isnull(@stReceiptIDType, N'<literal:12>');
		else if (@stFieldName = N'<literal:13>')
			set @stSourceValue = isnull(@stShipFrom, N'<literal:14>');
		else if (@stFieldName = N'<literal:15>')
			set @stSourceValue = isnull(@stSourceID, N'<literal:16>');
		else if (@stFieldName = N'<literal:17>')
			set @stSourceValue = isnull(@iTotalLines, N'<literal:18>');
		else if (@stFieldName = N'<literal:19>')
			set @stSourceValue = isnull(@dTotalValue, N'<literal:20>');
		else if (@stFieldName = N'<literal:21>')
			set @stSourceValue = isnull(@dTotalWeight, N'<literal:22>');
		else
			set @stSourceValue = N'<literal:23>';

		-- [comment omitted]
		if (@stOperator = N'<literal:24>' or @stOperator = N'<literal:25>')
		begin
			if (upper(@stSourceValue) = upper(@stValidValue))
				set @iValid = 0;
		end;
		else if (@stOperator = N'<literal:26>')
		begin
			if (upper(@stSourceValue) > upper(@stValidValue))
				set @iValid = 0;
		end;
		else if (@stOperator = N'<literal:27>')
		begin
			if (upper(@stSourceValue) < upper(@stValidValue))
				set @iValid = 0;
		end;
		else if (@stOperator = N'<literal:28>')
		begin
			if (upper(@stSourceValue) >= upper(@stValidValue))
				set @iValid = 0;
		end;
		else if (@stOperator = N'<literal:29>')
		begin
			if (upper(@stSourceValue) <= upper(@stValidValue))
				set @iValid = 0;
		end;
		else
		begin
			if (upper(@stSourceValue) != upper(@stValidValue))
				set @iValid = 0;
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



