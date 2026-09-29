-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





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
	   N'<literal:1>' AS N'<literal:2>',
	   N'<literal:3>' AS N'<literal:4>',
	   @ReceiptId AS N'<literal:5>',
	   @TrailerId AS N'<literal:6>',
	   @Warehouse AS N'<literal:7>',
	   @Company AS N'<literal:8>',
	   N'<literal:9>' as N'<literal:10>',
	   N'<literal:11>' as N'<literal:12>',
	   N'<literal:13>' as N'<literal:14>',
	   N'<literal:15>' as N'<literal:16>',
	   N'<literal:17>' as N'<literal:18>',
	   N'<literal:19>' as N'<literal:20>',
	   N'<literal:21>' as N'<literal:22>',
	   N'<literal:23>' as N'<literal:24>',
	   N'<literal:25>' as N'<literal:26>',
	   N'<literal:27>' as N'<literal:28>',
	   0.0 as N'<literal:29>',
	   0.0 as N'<literal:30>'	

END
