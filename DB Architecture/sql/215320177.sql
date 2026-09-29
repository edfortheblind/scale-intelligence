-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */











CREATE PROCEDURE WAP_ValAllRequests(
	@stBatchID nvarchar(100))
as
	set nocount on;
	
	-- [comment omitted]
	declare @iAlertNum numeric(9);
	declare @iReqNum numeric(9);
	declare @iSourceNum numeric(9);
	declare @stIdentifier1 nvarchar(25);
	declare @stAlertType nvarchar(25);

	-- [comment omitted]
	declare curRequests cursor static for
		select INTERNAL_ALERT_NUM, INTERNAL_ALERT_REQ_NUM, INTERNAL_SOURCE_NUM, IDENTIFIER1, ALERT_TYPE
		  from WAREHOUSE_ALERT_REQUEST
		 where PROCESS_STAMP = @stBatchID
		   and PROCESSED = N'<literal:1>';

	-- [comment omitted]
	open curRequests;
	fetch next from curRequests into @iAlertNum, @iReqNum, @iSourceNum, @stIdentifier1, @stAlertType;
	while (@@FETCH_STATUS = 0)
	begin

		-- [comment omitted]
		if (@stAlertType = N'<literal:2>')
			exec WAP_ValInboundReq @iAlertNum, @iReqNum, @iSourceNum, @stIdentifier1;
		else if (@stAlertType = N'<literal:3>')
			exec WAP_ValOutboundReq @iAlertNum, @iReqNum, @iSourceNum, @stIdentifier1;

		-- [comment omitted]
		fetch next from curRequests into @iAlertNum, @iReqNum, @iSourceNum, @stIdentifier1, @stAlertType;
	end;
	close curRequests;
	deallocate curRequests;
-- [comment omitted]
