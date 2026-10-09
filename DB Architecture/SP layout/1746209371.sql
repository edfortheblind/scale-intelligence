/*
 Mod     | Programmer    | Date       | Modification Description
 --------------------------------------------------------------------
 EX01    | rphilip       | 03/10/2023 | Updates the data of container returned by PackSize.
*/
	
CREATE PROCEDURE TRAV_EX01_UpdateContainerDetails
(
	@Container_ID NVARCHAR(25),
	@Container_Length NVARCHAR(25),
	@Container_Width NVARCHAR(25),
	@Container_Height NVARCHAR(25)
)

AS 
BEGIN
	SET NOCOUNT ON

	DECLARE @Container_Volume NUMERIC(19,5);

	SET @Container_Volume = CONVERT(NUMERIC(19,5),@Container_Length) * CONVERT(NUMERIC(19,5),@Container_Width) * CONVERT(NUMERIC(19,5),@Container_Height);

	UPDATE SHIPPING_CONTAINER SET LENGTH = CONVERT(NUMERIC(19,5),@Container_Length), WIDTH = CONVERT(NUMERIC(19,5),@Container_Width), HEIGHT = CONVERT(NUMERIC(19,5),@Container_Height), VOLUME = @Container_Volume WHERE CONTAINER_ID = @Container_ID;


END