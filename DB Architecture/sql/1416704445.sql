-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







	

-- [comment omitted]


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

	IF((@stTransType = N'<literal:1>' OR @stTransType=N'<literal:2>' OR @stTransType = N'<literal:3>') AND @serialNumTracking=7)
	BEGIN

		declare @serialNumbersCount int;
		declare @invArgumentsCount int;

		set @serialNumbersCount= (SELECT COUNT(*) from SERIAL_NUMBER WITH (nolock)
				WHERE OBJECT_ID IN 
					(SELECT ARGUMENT_VALUE FROM INVENTORY_ARGUMENT 
					WHERE GROUP_ID = @argumentGroupId
					AND ARGUMENT_NAME = N'<literal:4>') 
					AND LOC_INV_NUM IS NOT NULL); 

		set @invArgumentsCount= (SELECT COUNT(*) FROM INVENTORY_ARGUMENT 
					WHERE GROUP_ID = @argumentGroupId
					AND ARGUMENT_NAME = N'<literal:5>');

		IF(@serialNumbersCount <> @invArgumentsCount)
			BEGIN				
				RAISERROR(N'<literal:6>' , 18, 1); 
				return -1;
			END	
	END


	UPDATE SERIAL_NUMBER
	   SET LOC_INV_NUM = NULL,
	       LOC_CONT_NUM = NULL
     	FROM INVENTORY_ARGUMENT IA
	WHERE SERIAL_NUMBER.OBJECT_ID = cast(IA.ARGUMENT_VALUE as numeric)
	 AND IA.GROUP_ID = @argumentGroupId
	 AND IA.ARGUMENT_NAME = N'<literal:7>'	 

	SELECT @error = @@ERROR, @sernCount = @@ROWCOUNT;
	if (@error <> 0) return -1;
-- [comment omitted]


