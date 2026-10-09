/*
	Task  | By  | Date     | Modification Description
	-------------------------------------------------
	14842 | RAB	| 09/09/04 | Created.
	16769 | SMF	| 05/12/05 | Modified to increase performance
	262192| NRJ | 12/22/20 | Modified to validate serial numbers.
	260752| NRJ	| 01/05/20 | Modified to validate only for inventory tracked serial number items.
	263598| NRJ	| 02/09/21 | Added with(nolock) to get the actual count of serial numbers(helps in concurrent situations).   
*/	

-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;


CREATE PROCEDURE INV_PickSerialNumbers(
	@argumentGroupId nvarchar(32),
	@stTransType nvarchar(50),
	@stItem nvarchar(50),
	@stCompany nvarchar(25),
	@sernCount int output
)
AS
	SET NOCOUNT ON;

	declare @error int;

	declare @serialNumTracking int;
	set @serialNumTracking=(SELECT ISNULL(SERIAL_NUM_TRACKING, 0) FROM ITEM 
							WHERE ITEM = @stItem 
							AND (COMPANY = @stCompany OR COMPANY IS NULL));

	IF((@stTransType = N'40' OR @stTransType=N'130' OR @stTransType = N'360') AND @serialNumTracking=7)
	BEGIN

		declare @serialNumbersCount int;
		declare @invArgumentsCount int;

		set @serialNumbersCount= (SELECT COUNT(*) from SERIAL_NUMBER WITH (nolock)
				WHERE OBJECT_ID IN 
					(SELECT ARGUMENT_VALUE FROM INVENTORY_ARGUMENT 
					WHERE GROUP_ID = @argumentGroupId
					AND ARGUMENT_NAME = N'SERIALNUMBER') 
					AND LOC_INV_NUM IS NOT NULL); 

		set @invArgumentsCount= (SELECT COUNT(*) FROM INVENTORY_ARGUMENT 
					WHERE GROUP_ID = @argumentGroupId
					AND ARGUMENT_NAME = N'SERIALNUMBER');

		IF(@serialNumbersCount <> @invArgumentsCount)
			BEGIN				
				RAISERROR(N'Serial numbers do not exist.' , 18, 1); 
				return -1;
			END	
	END


	UPDATE SERIAL_NUMBER
	   SET LOC_INV_NUM = NULL,
	       LOC_CONT_NUM = NULL
     	FROM INVENTORY_ARGUMENT IA
	WHERE SERIAL_NUMBER.OBJECT_ID = cast(IA.ARGUMENT_VALUE as numeric)
	 AND IA.GROUP_ID = @argumentGroupId
	 AND IA.ARGUMENT_NAME = N'SERIALNUMBER'	 

	SELECT @error = @@ERROR, @sernCount = @@ROWCOUNT;
	if (@error <> 0) return -1;
-- end INV_PickSerialNumbers


