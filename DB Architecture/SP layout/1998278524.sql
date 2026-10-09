/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	14636	| RAB	| 07/21/04	| Created
*/

CREATE PROCEDURE wm_RSerialNumTemplate03
	@Name nvarchar(25),
	@Description nvarchar(50)
AS
	SELECT *
	  FROM SERIAL_NUM_TEMPLATE
	 WHERE NAME = @Name
	   AND DESCRIPTION = @Description


