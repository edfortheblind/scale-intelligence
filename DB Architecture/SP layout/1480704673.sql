/*
	Task  | By  | Date     | Modification Description
	-------------------------------------------------
	14842 | RAB	| 09/09/04 | Created.
	16769 | SMF	| 05/12/05 | Modified to increase performance
	19167 | SAT	| 05/24/06 | License plate changes
	70089 | DSK	| 07/16/10 | Supported Location Inventory attributes related changes 
	
*/	

-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;

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

	-- retrieve the LocationInventory's Id.
	SELECT @locInvNum = LI.INTERNAL_LOCATION_INV
	  FROM LOCATION_INVENTORY LI
	 WHERE LI.LOCATION = @location
	   AND LI.WAREHOUSE = @warehouse
	   AND LI.ITEM = @item
	   AND ISNULL(LI.COMPANY,N'!') = ISNULL(@company,N'!')
	   AND ISNULL(LI.LOT,N'!') = ISNULL(@lot,N'!')
	   AND ISNULL(LI.LOGISTICS_UNIT, N'!') = ISNULL(@containerId, N'!')
	   AND ISNULL(LI.LOC_INV_ATTRIBUTES_ID,0) = ISNULL(@locInvAttributesId,0);
	if (@@ERROR <> 0) return -1;

	UPDATE SERIAL_NUMBER
	   SET LOC_INV_NUM = @locInvNum
     	FROM INVENTORY_ARGUMENT IA
	 WHERE SERIAL_NUMBER.OBJECT_ID = cast(IA.ARGUMENT_VALUE as numeric)
		AND IA.GROUP_ID = @argumentGroupId
		AND IA.ARGUMENT_NAME = N'SERIALNUMBER';

	if (@@ERROR <> 0) return -1;
-- end INV_PutSerialNumbers
