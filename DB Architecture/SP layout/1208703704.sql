/*
	Task  | By  | Date     | Modification Description
	-------------------------------------------------
	14842 | RAB	| 09/09/04 | Created.
	260752| NRJ	| 11/09/20 | Modified such that inventory arguments will be inserted ,only when serial numbers exists.
*/	


CREATE PROCEDURE INV_InsertArgument(
	@groupId nvarchar(32),
	@argumentName nvarchar(50),
	@argumentValue nvarchar(2000))
AS
	SET NOCOUNT ON;

	declare @rowCount int;

	IF(@argumentName=N'SERIALNUMBER')
	BEGIN

	INSERT INTO INVENTORY_ARGUMENT(GROUP_ID,ARGUMENT_NAME,ARGUMENT_VALUE)
	VALUES(@groupId,@argumentName,@argumentValue)
	SELECT @groupId,N'SERIALNUMBER', OBJECT_ID 
    FROM SERIAL_NUMBER WHERE OBJECT_ID= @argumentValue;

	SELECT @rowCount = @@ROWCOUNT;

	if (@@ERROR <> 0) return -1;

	if(@rowCount=0)
	BEGIN
		RAISERROR(N'Serial numbers do not exist.' , 18, 1); 
		return -1;
	END

	return;
	
	END

	INSERT INTO INVENTORY_ARGUMENT
	(
		GROUP_ID,
		ARGUMENT_NAME,
		ARGUMENT_VALUE
	)
	VALUES
	(
		@groupId,
		@argumentName,
		@argumentValue
	);
	if (@@ERROR <> 0) return -1;

-- end 


