/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	14635	| KSP	| 07/13/04	| Created
	20289	| BTD	| 11/09/06	| Axapta Certification - TOP without ORDER BY
*/

CREATE PROCEDURE wm_RSerialNumTemplate01
	@Name nvarchar(25)
AS
	SELECT TOP 1 NAME
	  FROM SERIAL_NUM_TEMPLATE
	 WHERE NAME = @Name
           AND ACTIVE = N'Y'
	 ORDER BY NAME


