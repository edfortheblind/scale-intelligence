/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	14636	| RAB	| 07/21/04	| Created
*/

CREATE PROCEDURE wm_RSerialNumTemplate02
	@ObjectId numeric(9)
AS
	SELECT *
	  FROM SERIAL_NUM_TEMPLATE
	 WHERE OBJECT_ID = @ObjectId


