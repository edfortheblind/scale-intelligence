/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	9882		| LJM			| 09/24/02	| Created.
	9593		| RAB			| 11/01/02	| Modified for standards.

	Validate all warehouse alert requests for a given batch ID.

	Parameters
		String	@stBatchID		the batch ID
*/

CREATE PROCEDURE WAP_ValAllRequests(
	@stBatchID nvarchar(100))
as
	set nocount on;
	
	--Local variables for warehouse alert requests (alphabetized)
	declare @iAlertNum numeric(9);
	declare @iReqNum numeric(9);
	declare @iSourceNum numeric(9);
	declare @stIdentifier1 nvarchar(25);
	declare @stAlertType nvarchar(25);

	--Cursor to get the request fields
	declare curRequests cursor static for
		select INTERNAL_ALERT_NUM, INTERNAL_ALERT_REQ_NUM, INTERNAL_SOURCE_NUM, IDENTIFIER1, ALERT_TYPE
		  from WAREHOUSE_ALERT_REQUEST
		 where PROCESS_STAMP = @stBatchID
		   and PROCESSED = N'N';

	--For each request
	open curRequests;
	fetch next from curRequests into @iAlertNum, @iReqNum, @iSourceNum, @stIdentifier1, @stAlertType;
	while (@@FETCH_STATUS = 0)
	begin

		--Execute request, based on alert type
		if (@stAlertType = N'Inbound')
			exec WAP_ValInboundReq @iAlertNum, @iReqNum, @iSourceNum, @stIdentifier1;
		else if (@stAlertType = N'Outbound')
			exec WAP_ValOutboundReq @iAlertNum, @iReqNum, @iSourceNum, @stIdentifier1;

		--Get the next request
		fetch next from curRequests into @iAlertNum, @iReqNum, @iSourceNum, @stIdentifier1, @stAlertType;
	end;
	close curRequests;
	deallocate curRequests;
--end WAP_ValAllRequests
