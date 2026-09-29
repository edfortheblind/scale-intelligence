-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







	

-- [comment omitted]

CREATE PROCEDURE INV_PutSerialNumbers(
	@argumentGroupId nvarchar(32),
	@location nvarchar(25),
	@warehouse nvarchar(25),
	@item nvarchar(50),
	@company nvarchar(25),
	@lot nvarchar(25),
	@containerId nvarchar(50),
	@locInvAttributesId numeric(9))
AS
	SET NOCOUNT ON;

	declare @locInvNum numeric(9);

	-- [comment omitted]
	SELECT @locInvNum = LI.INTERNAL_LOCATION_INV
	  FROM LOCATION_INVENTORY LI
	 WHERE LI.LOCATION = @location
	   AND LI.WAREHOUSE = @warehouse
	   AND LI.ITEM = @item
	   AND ISNULL(LI.COMPANY,N'<literal:1>') = ISNULL(@company,N'<literal:2>')
	   AND ISNULL(LI.LOT,N'<literal:3>') = ISNULL(@lot,N'<literal:4>')
	   AND ISNULL(LI.LOGISTICS_UNIT, N'<literal:5>') = ISNULL(@containerId, N'<literal:6>')
	   AND ISNULL(LI.LOC_INV_ATTRIBUTES_ID,0) = ISNULL(@locInvAttributesId,0);
	if (@@ERROR <> 0) return -1;

	UPDATE SERIAL_NUMBER
	   SET LOC_INV_NUM = @locInvNum
     	FROM INVENTORY_ARGUMENT IA
	 WHERE SERIAL_NUMBER.OBJECT_ID = cast(IA.ARGUMENT_VALUE as numeric)
		AND IA.GROUP_ID = @argumentGroupId
		AND IA.ARGUMENT_NAME = N'<literal:7>';

	if (@@ERROR <> 0) return -1;
-- [comment omitted]
