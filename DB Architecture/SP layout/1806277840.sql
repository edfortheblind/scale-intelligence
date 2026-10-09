/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	14636	| RAB	| 07/21/04	| Created
*/

CREATE PROCEDURE wm_RSerialNumber03
	@GroupId nvarchar(32),
	@ObjectId numeric(9)
AS
	SELECT *
	  FROM SERIAL_NUMBER
	 WHERE GROUP_ID = @GroupId
	   AND OBJECT_ID <> @ObjectId


