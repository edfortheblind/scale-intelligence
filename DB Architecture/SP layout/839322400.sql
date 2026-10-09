/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_RGenericConfigDetail02
	@RecordType nvarchar(50)
	,@Identifier nvarchar(50)
AS
	SELECT * 
     FROM GENERIC_CONFIG_DETAIL
	 WHERE RECORD_TYPE = @RecordType
	   AND IDENTIFIER = @Identifier
      AND active = N'Y'
