-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
CREATE PROCEDURE EX06ValidateMOPNum_Weights(
@MOPNumber NVARCHAR(50)
)
AS
DECLARE @PalletNumber NVARCHAR(25);
DECLARE @PalletWeight DECIMAL(9,3);
DECLARE @stErrorText NVARCHAR(MAX);
DECLARE @stResult NVARCHAR(MAX);

IF EXISTS(SELECT 1 FROM multi_order_pallet WITH(NOLOCK) WHERE MULTI_ORDER_PALLET_ID = @MOPNumber)
BEGIN

IF EXISTS(select 1 from SHIPPING_CONTAINER where INTERNAL_MOP_NUMBER=(select INTERNAL_MOP_NUMBER FROM MULTI_ORDER_PALLET WHERE MULTI_ORDER_PALLET_ID=@MOPNumber) and status<900)
BEGIN
SELECT @PalletNumber=USER_DEF1,@PalletWeight=USER_DEF7 FROM multi_order_pallet where MULTI_ORDER_PALLET_ID = @MOPNumber;

select @MOPNumber AS MOPNumber,@PalletNumber As PalletNumber,@PalletWeight As PalletWeight;
END

ELSE
BEGIN
			SET @stResult = N'<literal:1>';
			SELECT @stErrorText = ISNULL(TEXT, N'<literal:2>') FROM RESOURCE_FILE_CUSTOM WITH(NOLOCK) WHERE RESOURCE_KEY = N'<literal:3>' 
			AND RESOURCE_GROUP = N'<literal:4>' AND RESOURCE_LANGUAGE = N'<literal:5>';

			SELECT @stResult AS RESULT, @stErrorText AS ERRORTEXT;
END

END




