-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */




	


CREATE PROCEDURE INV_InsertArgument(
	@groupId nvarchar(32),
	@argumentName nvarchar(50),
	@argumentValue nvarchar(2000))
AS
	SET NOCOUNT ON;

	declare @rowCount int;

	IF(@argumentName=N'<literal:1>')
	BEGIN

	INSERT INTO INVENTORY_ARGUMENT(GROUP_ID,ARGUMENT_NAME,ARGUMENT_VALUE)
	VALUES(@groupId,@argumentName,@argumentValue)
	SELECT @groupId,N'<literal:2>', OBJECT_ID 
    FROM SERIAL_NUMBER WHERE OBJECT_ID= @argumentValue;

	SELECT @rowCount = @@ROWCOUNT;

	if (@@ERROR <> 0) return -1;

	if(@rowCount=0)
	BEGIN
		RAISERROR(N'<literal:3>' , 18, 1); 
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

-- [comment omitted]


