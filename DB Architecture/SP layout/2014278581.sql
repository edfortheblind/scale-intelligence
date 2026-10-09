/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	19459	| MDL	| 12/26/06	| Created
*/

CREATE PROCEDURE wm_RSerialNumTemplate04
	@Name nvarchar(25),
	@Sequence numeric(3)
AS
	SELECT *
	  FROM SERIAL_NUM_TEMPLATE
	 WHERE NAME = @name
	   AND SEQUENCE = @sequence ;


