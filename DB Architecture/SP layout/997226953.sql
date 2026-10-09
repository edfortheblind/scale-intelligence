/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	203806	| SO	| 06/27/17	| Created
*/

CREATE PROCEDURE MetaTrans_GetTrailerDetails(
	@internalreceiptNum numeric(9) = 0, 
	@culture nvarchar(10))
AS
BEGIN
	   SET NOCOUNT ON;
	Declare @ReceiptId nvarchar(25);
	DECLARE @TrailerId nvarchar(25);
	DECLARE @Warehouse nvarchar(25);
	DECLARE @Company nvarchar(25);

	select @ReceiptId = receipt_id,
	@TrailerId = Trailer_Id,
	@Warehouse = warehouse, @Company= company from RECEIPT_HEADER where INTERNAL_RECEIPT_NUM = @internalreceiptNum

	   SELECT 
	   N'SCALAR' AS N'EntityType',
	   N'TrailerDetail' AS N'EntityName',
	   @ReceiptId AS N'receiptId',
	   @TrailerId AS N'trailer_id',
	   @Warehouse AS N'warehouse',
	   @Company AS N'company',
	   N'' as N'appointmentDateTime',
	   N'' as N'currentYardLocation',
	   N'' as N'destinationYardLocation',
	   N'' as N'destinationReceivingDock',
	   N'' as N'userDefinedField1',
	   N'' as N'userDefinedField2',
	   N'' as N'userDefinedField3',
	   N'' as N'userDefinedField4',
	   N'' as N'userDefinedField5',
	   N'' as N'userDefinedField6',
	   0.0 as N'userDefinedField7',
	   0.0 as N'userDefinedField8'	

END
